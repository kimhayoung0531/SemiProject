package parkjuneyub.order.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import parkjuenyub.order.model.OrderVO;
import sge.member.model.MemberVO;
import parkjuneyub.product.model.InterProductDAO;
import parkjuneyub.product.model.ProductDAO;
import parkjuneyub.product.model.ProductVO;

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
			
			String[] productNum_arr = productNum_join.split("\\,");
			List<ProductVO> productList = pdao.getPvoListByPnum(productNum_arr);
			
			
			String recipt_address = "우편번호("+postcode + ") " + postcode + " " + detailAddress + " " + extraAddress;
			request.setAttribute("ovo", ovo);
			request.setAttribute("recipt_address", recipt_address);
			request.setAttribute("save_mileage", save_mileage);
			request.setAttribute("order_name", order_name);
			request.setAttribute("productList", productList);
		
		
		
		// **** 주문이 완료되었을시 세션에 저장되어져 있는 loginuser 정보를 갱신하고
	    //      이어서 주문이 완료되었다라는 email 보내주기  **** //
		
			// 세션에 저장되어져 있는 loginuser 정보를 갱신
			loginuser.setMileage(loginuser.getMileage() - Integer.parseInt(useMileage) + Integer.parseInt(save_mileage));
			
			//// == 주문이 완료되었다는 mail 보내기 시작 == ////
			GoogleMail mail = new GoogleMail();

			StringBuilder sb = new StringBuilder();
			
			String html = "  <div class=\"order_zone_tit\">\r\n"
					+ " <h3 class=\"title_h3\">주문자 정보</h3>\r\n"
					+ " </div>\r\n"
					+ "  <div class=\"order_table_type\">\r\n"
					+ "                                                    <table class=\"table_left\">\r\n"
					+ "                                                        <colgroup>\r\n"
					+ "                                                            <col style=\"width:20%\">\r\n"
					+ "                                                            <col style=\"width:80%\">\r\n"
					+ "                                                        </colgroup>\r\n"
					+ "                                                        <tbody>\r\n"
					+ "                                                            <tr>\r\n"
					+ "                                                                <th><span class=\"order_important\">결제수단</span></th>\r\n"
					+ "                                                                <td>\r\n"
					+ "                                                                    <ul class=\"order_summary_information\">\r\n"
					+ "                                                                        <li>신용카드</li>\r\n"
					+ "                                                                    </ul>\r\n"
					+ "                                                                </td>\r\n"
					+ "                                                            </tr>\r\n"
					+ "<tr>\r\n"
					+ "	     <th><span class=\"order_important\">주문상품</span></th>\r\n"
					+ "<td>";
			
			for(int i = 0; i < productList.size(); i++) {
				html += "<li>"+productList.get(i).getProduct_title()+"</li>";
			}
			html += "</td> "
					+ "</tr>"
					+ "<tr>"
					+ "		<th><span class=\"order_important\">주문번호</span></th>\r\n"
					+ "  	<td>"+oderNum+"</td>\r\n"
					+ " </tr>"
					+ " <tr>\r\n"
					+ " 	<th><span class=\"order_important\">주문일자</span></th>\r\n"
					+ " 	<td>"+orderTime+"</td>\r\n"
					+ " </tr>"
					+ "<tr>\r\n"
					+ " 	<th><span class=\"order_important\">주문자명</span></th>\r\n"
					+ " 	<td>"+order_name+"</td>\r\n"
					+ "</tr>\r\n"
					+ "<tr>\r\n"
					+ "   	<th><span class=\"order_important\">배송정보</span></th>\r\n"
					+ "  	<td>"+recipt_address+"</td>\r\n"
					+ "</tr>\r\n"
					+ "<tr>\r\n"
					+ "  	<th><span class=\"order_important\">배송비</span></th>\r\n"
					+ "  	<td>3,000원</td>\r\n"
					+ "</tr>\r\n"
					+ " <tr>\r\n"
					+ "    		<th><span class=\"order_important\">마일리지 적립/사용</span></th>\r\n"
					+ "  <td>\r\n"
					+ "      <ul class=\"order_benefit_list\"> \r\n"
					+ "   		<li>마일리지 적립 : <span class='save_mileage'>"+ovo.getOrder_mileage_total()+"</span>원</li>\r\n"
					+ "   		<li>마일리지 사용 : <span class='save_mileage'>"+save_mileage+"</span>원</li>\r\n"
					+ "   	</ul>\r\n"
					+ " </td>\r\n"
					+ " </tr>\r\n"
					+ " <tr>\r\n"
					+ "   <th><span class=\"order_important\">총 결제금액(배송비 포함)</span></th>\r\n"
					+ "   <td><strong>"+ovo.getOrder_price_total()+"</strong></td>\r\n"
					+ " </tr>\r\n"
					+ " </tbody>\r\n"
					+ " </table>\r\n"
					+ " </div>\r\n";

			sb.append("<br>이용해 주셔서 감사합니다.");

			
			String emailContents = sb.toString();
			
			
			try {
				mail.sendmail_OrderFinish("ajsjdlwj0123@naver.com", loginuser.getUser_name(), emailContents);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//// == 주문이 완료되었다는 mail 보내기 끝 == ////
			
		}

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pjy_order/orderEnd.jsp");
		
	}

}
