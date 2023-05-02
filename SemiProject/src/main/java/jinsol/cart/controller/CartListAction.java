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

		HttpSession session = request.getSession();
        MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

        InterCartDAO cdao = new CartDAO(); 

		  ////////////////////////테스트용///////////////////////////////////
		  
		  loginuser = new MemberVO();
		  loginuser.setUser_id("demo");
		  
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
