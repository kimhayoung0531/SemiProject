package parkjuneyub.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class OrderEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String test = request.getParameter("productTitle_join");
		System.out.println("상품 정보 " +test);
		
		String test2 = request.getParameter("order_name");
		System.out.println("주문자 정보 " + test2);
		
		String test4 = request.getParameter("receive_name");
		System.out.println("배송자 정보 " + test4);
		
		String test3 = request.getParameter("receive_mobile");
		System.out.println("배송자 휴대폰 정보 " + test3);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pjy_order/orderEnd.jsp");
		
	}

}
