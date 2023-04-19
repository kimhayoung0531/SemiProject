package jinsol.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class CartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		super.setRedirect(true);
		super.setViewPage("/WEB-INF/kjs_cart/cart.jsp");
		
		
	}

	
}
