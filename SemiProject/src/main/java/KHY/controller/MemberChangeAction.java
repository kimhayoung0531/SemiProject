package KHY.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

import KHY.member.model.*;

public class MemberChangeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		
		// 내정보(회원정보)를 수정하기위한 전제조건은 먼저 로그인을 해야한다.
		if(super.checkLogin(request)) {
			// 로그인을 했으면
		
			String method = request.getMethod();
			
			
			if("POST".equalsIgnoreCase(method) ) {
			
					// 로그인한 사용자가 자신의 정보를 수정하는 경우
					
					HttpSession session = request.getSession();
					MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
					String pwd = request.getParameter("findPassword");
					
					System.out.println("확인용!!"+pwd);
					Map<String, String> paraMap = new HashMap<>();
					paraMap.put("user_id",loginuser.getUser_id());
					paraMap.put("pwd",pwd);
					
					InterMemberDAO mdao = new MemberDAO();
					boolean pwdcheck = mdao.mypageMemberPwdCheck(paraMap);
					
					if(pwdcheck) {
						
						super.setRedirect(true);
						super.setViewPage(request.getContextPath()+"/mypageMemberChange.ban");
						
					}
					
					else {
						String message = "비밀번호가 틀렸습니다. 다시 입력하세요.";
						String loc = "javascript:history.back()";
						
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/msg.jsp");
					}
				
				
				
				
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
		
		
		
	}

}
