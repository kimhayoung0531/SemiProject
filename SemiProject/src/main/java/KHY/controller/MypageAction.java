package KHY.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KHY.member.model.MemberVO;
import common.controller.AbstractController;

public class MypageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
	
		if(super.checkLogin(request)) {
			// 로그인을 했으면
			
			
			String user_id = request.getParameter("user_id");
			System.out.println(user_id);
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if(loginuser.getUser_id().equals(user_id) ) {
				// 로그인한 사용자가 자신의 마이페이지를 보는 경우
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/KHY/mypage_main.jsp");
				
				
			}
			else {
				// 로그인한 사용자가 다른 사용자의 정보를 수정하는 경우
				String message = "다른 사용자의 마이페이지는 볼 수 없습니다";
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
		
	}
	
	
	
}
