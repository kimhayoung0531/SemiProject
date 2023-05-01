package KHY.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import KHY.model.*;


public class MemberChangePwdcheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		// 내정보(회원정보)를 수정하기위한 전제조건은 먼저 로그인을 해야한다.
				if(super.checkLogin(request)) {
					// 로그인을 했으면
					
					
					HttpSession session = request.getSession();
					MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
					
					
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/KHY/mypage_memberchange_pwdcheck.jsp");
			
					
					
					
					
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
