package jinsol.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class ProductDetailtoCartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/kjs_cart/productDetailtoCart.jsp");
		
		
		
	} // end of public void execute() -----------------------------------

}
