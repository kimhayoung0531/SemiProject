package parkjuneyub.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class OrderEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pjy_order/orderEnd.jsp");
		
	}

}
