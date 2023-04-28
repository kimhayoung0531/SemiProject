package jinsol.cart.controller;



import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jinsol.cart.model.CartDAO;
import jinsol.cart.model.InterCartDAO;
import sge.member.model.MemberVO;

public class AddCartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			
		  String item_cnt = request.getParameter("item_cnt");
		  String pnum = request.getParameter("product_num");
		  
		  System.out.println("~~~~~~ AddCartAction.java 에서1 pnum : " + pnum);
		  
		  HttpSession session = request.getSession();
		  MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		  
		  ////////////////////////테스트용///////////////////////////////////
		  
		  loginuser = new MemberVO();
		  loginuser.setUser_id("demo");
		  
		  //////////////////////////////////////////////////////////////////
		  
		  InterCartDAO cdao = new CartDAO();

		  Map<String, String> paraMap = new HashMap<>();
		  paraMap.put("user_id", loginuser.getUser_id());
		  paraMap.put("pnum", pnum);
		  paraMap.put("item_cnt", item_cnt);
		  
		  int n = cdao.addCart(paraMap);
		  
		  if(n==1) {
			request.setAttribute("message", "장바구니에 담겼습니다.");
			request.setAttribute("loc", "cart.ban");
		  }
		  else {
			request.setAttribute("message", "장바구니 담기에 실패하셨습니다.");
			request.setAttribute("loc", "javascript:history.back()");
		  }
		  
		  super.setViewPage("/WEB-INF/msg.jsp");

		}
		
		else {
			//GET방식이라면 
			String message = "비정상적인 경로로 들어왔습니다.";
		    String loc = "javascript:history.back()";
		      
		   request.setAttribute("message", message);
		   request.setAttribute("loc", loc);
		      
		   super.setRedirect(false);
		   super.setViewPage("/WEB-INF/msg.jsp");
		}
			 
				 
	} //end of public void execute ---------------------------------------

	
}
