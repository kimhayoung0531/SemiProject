package sge.member.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class PwdCertificateNumberAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		HttpSession session = request.getSession();
		
		if("post".equalsIgnoreCase(method)) {
			String userCertificationCode = request.getParameter("userCertificationCode");
			//String user_id = request.getAttribute("user_id");
			
			System.out.println(userCertificationCode);
			//System.out.println(user_id);

			//세션 불러오기 
			
			String certificationCode = (String)session.getAttribute("certificationCode");
			String email = (String)session.getAttribute("email");
			
			
			System.out.println(certificationCode);
		
			String message = "";
			String loc = "";
			
			if( certificationCode.equals(userCertificationCode) ) {
				message = "인증 성공 되었습니다";
				loc = request.getContextPath()+"/pwdChange.ban?email=" + email;
			}
			
			
		    else { 
		    	message = "발급된 인증 코드가 아닙니다.인증코드를 다시 발급받으세요!!"; 
		        loc = request.getContextPath()+"/findPwd.ban";
		    }
			 
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		else {
			 super.setRedirect(false);
			 super.setViewPage("/WEB-INF/sge_login/pwd_certificateNum.jsp");
		}
	

		//!! 중요  !!
		// 세션에 저장된 인증코드 삭제하기 
		/*
		 * if(session.getAttribute("certificationCode") != null) {
		 * session.removeAttribute("certificationCode"); }
		 */
		
	}

}
