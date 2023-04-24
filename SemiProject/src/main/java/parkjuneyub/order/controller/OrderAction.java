package parkjuneyub.order.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import parkjuneyub.member.controller.InterMemberDAO;
import parkjuneyub.member.controller.MemberDAO;
import sge.member.model.MemberVO;

public class OrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String method = request.getMethod();
		
		if("get".equalsIgnoreCase(method)) {
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		if("post".equalsIgnoreCase(method)) {
			
			// 1. 장바구니를 통해 넘어온 경우 유저 정보와 장바구니의 내용이 필요합니다.
			
			// 2. 물건 바로 구매하기 버튼을 통해 넘어온 경우 유저 정보와 장바구니 그리고 구매하기 직전에 상품의 아이디와 상품 구매 개수가 필요합니다.
			
			
			// 유저정보 가져오기
			String userid = "test";
			
			InterMemberDAO mdao = new MemberDAO();
			MemberVO mvo = mdao.getUserInfo(userid);
			
			request.setAttribute("mvo", mvo);
			
			// 유저정보를 활용해 장바구니 가져오기
			
			
			
			super.setRedirect(false);
			super.setViewPage("WEB-INF/pjy_order/order.jsp");
		}
		
		
		
	}

}
