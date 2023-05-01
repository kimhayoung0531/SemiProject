package jinsol.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jinsol.cart.model.CartDAO;
import jinsol.cart.model.InterCartDAO;

public class CartDeleteAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			
			String cart_num = request.getParameter("cart_num");

			InterCartDAO cdao = new CartDAO();
			
			//장바구니 테이블에서 특정 제품을 삭제
			int n = cdao.deleteCart(cart_num);
			
			JSONObject jsobj = new JSONObject();		// {} jsobj은 자바스크립트 객체
			jsobj.put("n", n);			//{"n" : 1}		{key, value}
			
			String json = jsobj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");

			
		}
		
	}	//end of public void execute ------------------------------------

}
