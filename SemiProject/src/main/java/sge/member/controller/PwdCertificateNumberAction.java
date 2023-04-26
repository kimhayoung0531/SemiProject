package sge.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class PwdCertificateNumberAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userCertificationCode = request.getParameter("userCertificationCode");
		String user_id = request.getParameter("user_id");
		
		//세션 불러오기 
		HttpSession session = request.getSession();
		String certificationCode = (String)session.getAttribute("certificationCode");	
	
		String message = "";
		String loc = "";
		
		if( certificationCode.equals(userCertificationCode) ) {
			message = "인증 성공 되었습니다";
			loc = request.getContextPath()+"/pwdChange.ban.up?user_id="+user_id;
		}
		/*
		 * else { message = "발급된 인증 코드가 아닙니다.인증코드를 다시 발급받으세요!!"; loc =
		 * request.getContextPath()+"/findPwd.ban"; }
		 */
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/msg.jsp");
		
		//!! 중요  !!
		// 세션에 저장된 이증코드 삭제하기 
		session.removeAttribute("certificationCode");

		
	}

}
