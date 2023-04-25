package jinsol.cart.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jinsol.cart.model.CartDAO;
import jinsol.cart.model.InterCartDAO;
import parkjuneyub.product.model.InterProductDAO;
import parkjuneyub.product.model.ProductDAO;
import sge.member.model.MemberVO;

public class AddCartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		  boolean isLogin = super.checkLogin(request);
		  
		  if(!isLogin) {	//로그인 하지 않은 상태라면
			  /*
	            사용자가 로그인을 하지 않은 상태에서 특정제품을 장바구니에 담고자 하는 경우 
	            사용자가 로그인을 하면 장바구니에 담고자 했던 그 특정제품 페이지로 이동하도록 해야 한다.
	            이와 같이 하려고 ProdViewAction 클래스에서 super.goBackURL(request); 을 해두었음.   
				 */
			  request.setAttribute("message", "장바구니를 이용하기 위해서는 먼저 로그인 하세요.");
			  request.setAttribute("loc", "javascript:history.back()");
				
			  super.setRedirect(false);
			  super.setViewPage("/WEB-INF/msg.jsp");
			  return;

		  }
		  else { //로그인을 한 상태라면 
			  /* 
				장바구니 테이블(tbl_cart)에 해당 제품을 담아야 한다.
		        장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 tbl_cart 테이블에 insert 를 해야하고, 
		        장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 tbl_cart 테이블에 update 를 해야한다.
				*/
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
				 // int n = cdao.addCart(paraMap);
				  
				  
				  
				  
				 
			}
			 
	 }// 로그인 한 상태
			  
			
	} //end of public void execute ---------------------------------------

	
}
