package jinsol.cart.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
public class AddCartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		  String method = request.getMethod();
		  
		  if(!"POST".equalsIgnoreCase(method)) { //POST방식으로 넘어온 것이 아니라면
		  
		  String message = "비정상적인 경로로 들어왔습니다."; 
		  String loc = "javascript:history.back()"; //"javascript:history.back()" 얘 암기해두기!
		  
		  request.setAttribute("message", message); 
		  request.setAttribute("loc", loc);
		  
		  super.setRedirect(false); super.setViewPage("/WEB-INF/msg.jsp");
		  
		  return; //execute(HttpServletRequest request, HttpServletRespons response)메소드를 종료함
		  
		 } 
		 else { 
			 //POST방식으로 넘어온 것이라면 			 
			 
			  boolean isLogin = super.checkLogin(request);
			  if(isLogin) {	//로그인 한 상태라면
				 
				  String item_cnt = request.getParameter("item_cnt");
				  request.setAttribute("item_cnt", item_cnt);
				  
				  super.setRedirect(false);
				  super.setViewPage("/WEB-INF/kjs_cart/cart.jsp");

			  }
			  else {
				  request.setAttribute("message", "장바구니를 이용하기 위해서는 먼저 로그인 하세요.");
				  request.setAttribute("loc", "javascript:history.back()");
					
				  super.setRedirect(false);
				  super.setViewPage("/WEB-INF/msg.jsp");
				  return;
			  }
		 
		 }
				/*
				 * InterCartDAO cdao = new CartDAO();
				 * 
				 * List<CartVO> cartList = cdao.cartSelectAll();
				 * request.setAttribute("cartList", cartList);
				 */

			
		  
	} //end of public void execute ---------------------------------------

	
}
