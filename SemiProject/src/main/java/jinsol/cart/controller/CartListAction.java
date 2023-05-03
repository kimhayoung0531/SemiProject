package jinsol.cart.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jinsol.cart.model.CartDAO;
import jinsol.cart.model.CartVO;
import jinsol.cart.model.InterCartDAO;
import sge.member.model.MemberVO;


public class CartListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boolean isLogin = super.checkLogin(request);

		if(!isLogin) {
			request.setAttribute("message", "장바구니를 보려면 먼저 로그인 부터 하세요!!");
	        request.setAttribute("loc", "javascript:history.back()"); 
	         
	      //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/msg.jsp");
	         return;
		}

		else {
			// ***페이징 처리를 안 한 상태로 장바구니 목록 보여주기 ***//
				
			HttpSession session = request.getSession();
	        MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
	
	        InterCartDAO cdao = new CartDAO(); 
	
			  ////////////////////////테스트용///////////////////////////////////
			 /* 
			  loginuser = new MemberVO();
			  loginuser.setUser_id("demo");
			  */
			  //////////////////////////////////////////////////////////////////
			  
	        List<CartVO> cartList = cdao.selectProductCart(loginuser.getUser_id());
	        HashMap<String,String> sumMap = cdao.selectCartSumPricePoint(loginuser.getUser_id());
	        
	        request.setAttribute("cartList", cartList);
	        request.setAttribute("sumMap", sumMap);
	
	        String sumPrice = sumMap.get("SUMTOTALPRICE");
	        
	        long sumPriceDelivery = Long.parseLong(sumPrice) +  3000;
	        request.setAttribute("sumPriceDelivery", sumPriceDelivery);
	        
	
	        super.setRedirect(false);
			super.setViewPage("/WEB-INF/kjs_cart/cartList.jsp");
			
		}
	}
}
