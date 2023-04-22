package jinsol.cart.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class AddCartLoginAction extends AbstractController{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 장바구니에 상품을 담기위한 전제조건은 먼저 로그인을 해야 하는 것이다.  
		if(super.checkLogin(request)) {
			//로그인을 했으면
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/member/coinPurchaseTypeChoice.jsp");
			
			HttpSession session = request.getSession();
			HashMap<String, String> login_map = (HashMap<String, String>)session.getAttribute("login_map");

			String userid = request.getParameter("userid");	// 폼태그에서 등등에서 넘어온 값.
			
			if( login_map.get("user_id").equals(userid) ) {
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/kjs_cart/cart.jsp");
			}
			else {
				String message = "다른 사용자의 장바구니 추가는 불가합니다.";
				String loc = "javascript:history.back()";		//이전페이지로 가기
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
		}
		else {
			String message = "장바구니 추가를 위해서먼저 로그인 하세요.";
			String loc = "javascript:history.back()";		//이전페이지로 가기
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/kjs_cart/cart.jsp");
			
		
	}//end of public void execute ---------------------------------------


}
