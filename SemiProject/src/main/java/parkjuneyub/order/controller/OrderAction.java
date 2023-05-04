package parkjuneyub.order.controller;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jinsol.cart.model.CartVO;
import parkjuneyub.member.model.InterMemberDAO;
import parkjuneyub.member.model.MemberDAO;
import parkjuneyub.product.model.InterProductDAO;
import parkjuneyub.product.model.ProductDAO;
import parkjuneyub.product.model.ProductVO;
import sge.member.model.MemberVO;

public class OrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
	      HttpSession session = request.getSession();
	      MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	      
	    if(loginuser == null) {
	         super.setRedirect(false);
	         super.setViewPage("/WEB-INF/sge_login/memberLogin.jsp");
	         return;
	    }
	      
		String method = request.getMethod();
		
		if("get".equalsIgnoreCase(method)) {
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		if("post".equalsIgnoreCase(method)) {
			InterProductDAO pdao = new ProductDAO();
			// 1. 장바구니를 통해 넘어온 경우 유저 정보와 장바구니의 내용이 필요합니다.
			// 유저정보 가져오기
			String userid = loginuser.getUser_id();
			
			// 바로 구매한 아이템을 저장한 Map
			Map<String, String> buyItem_map = new HashMap<>();

			if(request.getParameter("product_num") != null && !request.getParameter("product_num").isEmpty() ) {	// 바로주문하기의 경우
				
				int product_cnt = Integer.parseInt(request.getParameter("product_cnt"));
				int product_price = Integer.parseInt(request.getParameter("product_price"));
				int product_totalPrice = product_cnt*product_price;
				
				buyItem_map.put("product_mileage", String.valueOf(product_totalPrice / 100) );
				buyItem_map.put("product_num", request.getParameter("product_num"));
				buyItem_map.put("product_title", request.getParameter("product_title"));
				buyItem_map.put("product_cnt", request.getParameter("product_cnt"));
				buyItem_map.put("product_price", request.getParameter("product_price"));
				buyItem_map.put("product_totalPrice", String.valueOf(product_totalPrice));
				
				request.setAttribute("buyItem_map", buyItem_map);
			}
			
			if(request.getParameter("pnum_join") != null && !request.getParameter("pnum_join").isEmpty() ) {	// 장바구니를 통한 주문의 경우

				String[] pnum_join = request.getParameter("pnum_join").split(",");
				String[] cart_num_join = request.getParameter("cart_num_join").split(",");
				String[] cart_cnt_join = request.getParameter("cart_cnt_join").split(",");
				String[] totalPrice_join = request.getParameter("totalPrice_join").split(",");
				String[] totalMileage_join = request.getParameter("totalMileage_join").split(",");
				String sum_totalPrice = request.getParameter("sum_totalPrice");
				String sum_totalMileage = request.getParameter("sum_totalMileage");	
				String cart_num = request.getParameter("cart_num_join");
				List<ProductVO> pvoList = pdao.getPvoListByPnum(pnum_join);

				List<CartVO> cartList = new ArrayList<>();
				for(int i = 0; i < pnum_join.length; i++) {

					CartVO cvo = new CartVO();
					cvo.setCart_num(Integer.parseInt(cart_num_join[i]));
					cvo.setProduct_count(Integer.parseInt(cart_cnt_join[i]));

					pvoList.get(i).setProduct_price((Integer.parseInt(totalPrice_join[i])/Integer.parseInt(cart_cnt_join[i])));

					cvo.setTotalMileage(Long.parseLong(totalMileage_join[i]));
					cvo.setPvo(pvoList.get(i));
					cartList.add(cvo);
				}
				request.setAttribute("cart_num", cart_num);
				request.setAttribute("cartList", cartList);
				request.setAttribute("sum_totalPrice", sum_totalPrice);
				request.setAttribute("sum_totalMileage", sum_totalMileage);
			}
			
			// 구매자 정보
			InterMemberDAO mdao = new MemberDAO();
			MemberVO mvo = mdao.getUserInfo(userid);
			request.setAttribute("mvo", mvo);

			super.setRedirect(false);
			super.setViewPage("WEB-INF/pjy_order/order.jsp");
			return;
		}
		
		
		
	}

}
