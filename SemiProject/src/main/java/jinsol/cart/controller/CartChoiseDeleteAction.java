package jinsol.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jinsol.cart.model.CartDAO;
import jinsol.cart.model.InterCartDAO;

public class CartChoiseDeleteAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			
			String cart_ck_join = request.getParameter("cart_ck_join");
			String[] cart_ck_arr = cart_ck_join.split("\\,");
			
			String pnumes =  String.join("','",cart_ck_arr);
	        pnumes = "'" + pnumes +"'";
	         
			InterCartDAO cdao = new CartDAO();
			
			//장바구니 테이블에서 선택 제품을 삭제
			int n = cdao.choiseDeleteCart(pnumes);
			
			JSONObject jsobj = new JSONObject();		// {} jsobj은 자바스크립트 객체
			jsobj.put("n", n);			//{"n" : 1}		{key, value}
			
			String json = jsobj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");

			
		}else {
			//GET방식이라면 
			String message = "비정상적인 경로로 들어왔습니다.";
		    String loc = "javascript:history.back()";
		      
		   request.setAttribute("message", message);
		   request.setAttribute("loc", loc);
		      
		   super.setViewPage("/WEB-INF/msg.jsp");
		   return;
		}
		
		
	}//end of public void execute()--------------------------------------

}
