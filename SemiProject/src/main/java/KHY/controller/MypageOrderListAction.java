package KHY.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import sge.member.model.MemberVO;


public class MypageOrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String user_id = request.getParameter("user_id");
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		super.setViewPage("/WEB-INF/KHY/mypage_order_list.jsp");
		
		  
		/* 로그인 기능 제대로 구현되기 전까지 멈춤
		
		// 자신의 주문 정보를 조회하기 위해서는 먼저 로그인이 되어 있어야 한다.
		if(super.checkLogin(request)) { 
			// 로그인을 했으면
			
			
			String user_id = request.getParameter("user_id");
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if(loginuser.getUser_id().equals(user_id) ) {
				// 로그인한 사용자가 자신의 주문 정보를 조회하는 경우
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/KHY/mypage_order_list.jsp");
				
			}
			else {
				// 로그인한 사용자가 다른 사용자의 정보를 수정하는 경우
				String message = "다른 사용자의 정보 변경은 불가합니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
			}
			
			
		}
		else {
			// 로그인을 안했으면
			String message = "회원정보를 수정 하기 위해서는 먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
		}
		
		*/
	}
}
