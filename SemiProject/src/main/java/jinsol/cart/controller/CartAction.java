package jinsol.cart.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
public class CartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		    String itemCnt = request.getParameter("itemCnt");
		
		    request.setAttribute("itemCnt", itemCnt);
		    
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/kjs_cart/cart.jsp");
			
		
	} //end of public void execute ---------------------------------------

	
}
