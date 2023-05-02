package parkjuneyub.order.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import parkjuenyub.order.model.OrderVO;
import sge.member.model.MemberVO;
import parkjuneyub.product.model.InterProductDAO;
import parkjuneyub.product.model.ProductDAO;

public class OrderEndAction extends AbstractController {

	InterProductDAO pdao = new ProductDAO();
	
	
	private String getOderNum() throws SQLException {
		// 주문코드 형식 : s+날짜+sequence ==> s20220503-1 , s20220503-2 , s20220503-3
		
		// 날짜 생성
		Date now = new Date();
		SimpleDateFormat smdatefm = new SimpleDateFormat("yyyyMMdd");
		String today = smdatefm.format(now);
		
		int seq = pdao.getSeq_tbl_order();
		
		return today+"b-"+seq;
		
	};
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		System.out.println(request.getParameter("order_name"));
		String order_name = request.getParameter("order_name");
		String order_phone = request.getParameter("order_phone");
		String order_mobile = request.getParameter("order_mobile");
		String order_email = request.getParameter("order_email");
		String receive_name = request.getParameter("receive_name");
		String receive_phone = request.getParameter("receive_phone");
		String receive_mobile = request.getParameter("receive_mobile");
		String receive_last_say = request.getParameter("receive_last_say");
		String useMileage = request.getParameter("useMileage");
		String productNum_join = request.getParameter("productNum_join");
		String productCnt_join = request.getParameter("productCnt_join");
		String productPrice_join = request.getParameter("productPrice_join");
		String productMileage_join = request.getParameter("productMileage_join");
		String save_mileage = request.getParameter("save_mileage");
		String finalTotalPrice = request.getParameter("finalTotalPrice");
		String cartNo_join = request.getParameter("cartNo_join");
		
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		String oderNum = getOderNum();
		System.out.println("order_name " + order_name);
		System.out.println("receive_phone " + receive_phone);
		System.out.println("productNum_join " + productNum_join);
		System.out.println("productCnt_join " + productCnt_join);
		System.out.println("productMileage_join " + productMileage_join);
		
		
		// 주문테이블에 insert 할 데이터들
		paraMap.put("oderNum", oderNum);
		paraMap.put("userid", loginuser.getUser_id());
		if(useMileage.isEmpty()) {
			useMileage = "0";
		}
		paraMap.put("useMileage", useMileage);
		
		if(save_mileage.isEmpty()) {
			save_mileage = "0";
		}
		paraMap.put("save_mileage", save_mileage);
		
		if(finalTotalPrice.isEmpty()) {
			finalTotalPrice = "0";
		}
		paraMap.put("finalTotalPrice", finalTotalPrice);
		
		// 주문 상세 테이블에 insert 할 데이터들
		paraMap.put("productNum_arr", productNum_join.split("\\,")); // 제품 아이디
		paraMap.put("productCnt_arr", productCnt_join.split("\\,"));  // 수량
		paraMap.put("productPrice_arr", productPrice_join.split("\\,")); // 제품 각각의 판매가격
		
		paraMap.put("order_name", order_name);
		paraMap.put("order_phone", order_phone);
		paraMap.put("order_mobile", order_mobile);
		paraMap.put("order_email", order_email);
		paraMap.put("receive_name", receive_name);
		paraMap.put("receive_phone", receive_phone);
		paraMap.put("receive_mobile", receive_mobile);
		paraMap.put("receive_last_say", receive_last_say);
		paraMap.put("postcode", postcode);
		paraMap.put("address", address);
		paraMap.put("detailAddress", detailAddress);
		paraMap.put("extraAddress", extraAddress);
		
		if(cartNo_join != null) {
			paraMap.put("cartNo_join", cartNo_join);
		}
		
		int isSuccess = pdao.orderAdd(paraMap);
		
		if(isSuccess == 1) {
			OrderVO ovo = new OrderVO();
			ovo.setOrder_num(oderNum);
			ovo.setOrder_mileage_total(Long.parseLong(useMileage));
			ovo.setOrder_price_total(Long.parseLong(finalTotalPrice));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();
			String orderTime = sdf.format(now);
			ovo.setOrder_date(orderTime);
			
			
			String recipt_address = "우편번호("+postcode + ") " + postcode + " " + detailAddress + " " + extraAddress;
			request.setAttribute("ovo", ovo);
			request.setAttribute("recipt_address", recipt_address);
			request.setAttribute("save_mileage", save_mileage);
			request.setAttribute("order_name", order_name);
		
		}

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pjy_order/orderEnd.jsp");
		
	}

}
