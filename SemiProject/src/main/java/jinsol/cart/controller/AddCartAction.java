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

		  String item_cnt = request.getParameter("item_cnt");
		  String pnum = request.getParameter("product_num");
		  
		  HttpSession session = request.getSession();
		  MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		  
		  InterCartDAO cdao = new CartDAO();

		  Map<String, String> paraMap = new HashMap<>();
		  paraMap.put("fk_user_id", loginuser.getUser_id());
		  paraMap.put("fk_pnum", pnum);
		  paraMap.put("item_cnt", item_cnt);
		  
		  int n = cdao.addCart(paraMap);
		  
		  if(n==1) {
			request.setAttribute("message", "장바구니에 담겼습니다.");
			request.setAttribute("loc", "/WEB-INF/kjs_cart/cart.jsp");
		  }
		  else {
			request.setAttribute("message", "장바구니 담기에 실패하셨습니다.");
			request.setAttribute("loc", "javascript:history.back()");
		  }
		  
		  super.setViewPage("/WEB-INF/msg.jsp");

		  
			  /* 
				장바구니 테이블(tbl_cart)에 해당 제품을 담아야 한다.
		        장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 tbl_cart 테이블에 insert 를 해야하고, 
		        장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 tbl_cart 테이블에 update 를 해야한다.
				
			  String method = request.getMethod();
			  
			  if(!"POST".equalsIgnoreCase(method)) { //GET방식이라면
				  
				  String message = "비정상적인 경로로 들어왔습니다."; 
				  String loc = "javascript:history.back()"; //"javascript:history.back()" 얘 암기해두기!
				  
				  request.setAttribute("message", message); 
				  request.setAttribute("loc", loc);
				  
				  super.setRedirect(false); 
				  super.setViewPage("/WEB-INF/msg.jsp");
			  
			 } 
			 else { 		// POST 방식이라면 
		
				  String item_cnt = request.getParameter("item_cnt");
				  String pnum = request.getParameter("pnum");

				  HttpSession session = request.getSession();
				  MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				  
				  InterProductDAO pdao = new ProductDAO();
				  
				  Map<String, String> paraMap = new HashMap<>();
				  paraMap.put("fk_user_id", loginuser.getUser_id());
				  paraMap.put("fk_pnum", pnum);
				  paraMap.put("item_cnt", item_cnt);
				  
				  InterCartDAO cdao = new CartDAO();
				  int n = cdao.addCart(paraMap);
				   */
				 
	} //end of public void execute ---------------------------------------

	
}
