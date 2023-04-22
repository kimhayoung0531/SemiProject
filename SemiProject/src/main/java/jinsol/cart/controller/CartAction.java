package jinsol.cart.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
public class CartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		/*
		// 장바구니 이동을 위한 전제조건은 먼저 로그인을 해야 하는 것이다.
		if(super.checkLogin(request)) {
			//로그인을 했으면
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/member/coinPurchaseTypeChoice.jsp");
			
			HttpSession session = request.getSession();
		    HashMap<String, String> login_map = (HashMap<String, String>)session.getAttribute("login_map");	//로그인된 유저
			
			String user_id = request.getParameter("user_id");	// 넘어온 값
			
			
			if( login_map.getUser_id().equals(user_id) ) {
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
			String message = "장바구니 추가를 하기 위해서는 먼저 로그인 하세요.";
			String loc = "javascript:history.back()";		//이전페이지로 가기
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		*/
		
		    String itemCnt = request.getParameter("itemCnt");
		
		    request.setAttribute("itemCnt", itemCnt);
		    
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/kjs_cart/cart.jsp");
			
		
	} //end of public void execute ---------------------------------------

	
}
