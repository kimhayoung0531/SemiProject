package product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class ProductDetailAction extends AbstractController {
	


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/product/productDetail.jsp");
	}
	
}
