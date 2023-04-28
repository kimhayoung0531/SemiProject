package sge.member.controller;

import java.util.HashMap;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

import sge.member.model.InterMemberDAO;
import sge.member.model.MemberDAO;

public class FindPwdAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		//"GET" or "POST"
		
		if("POST".equalsIgnoreCase(method)){
			// ㅂㅣ밀번호 모달창에서 찾기 버튼을 클릭 했을 경우
			String user_id = request.getParameter("user_id");
			String email = request.getParameter("email");
			
			InterMemberDAO mdao = new MemberDAO();
			
			Map<String,String> paraMap = new HashMap<>();
			
			paraMap.put("user_id", user_id);
			paraMap.put("email", email);
			
			boolean isUserExist = mdao.isUserExist(paraMap);
			//메일이 정상저으로 전송되었는지 유무를 알아오기 위한 용도
			
			boolean sendMailSuccess = false;
			
			if(isUserExist) {
				
				Random rnd = new Random();
				String certificationCode = "";
				
				for(int i=0; i<5; i++) {
					
					char rndchar = (char)(rnd.nextInt('z' - 'a' + 1) + 'a');
					certificationCode += rndchar;
					
				}//end of for
				
				for(int i=0; i<7; i++) {
					
					int rndnum = rnd.nextInt(9 - 0+ 1) + 0;
					certificationCode += rndnum;
					
				}//end of for

				GoogleMail mail = new GoogleMail();
				try {
					mail.sendmail(email,certificationCode);
					sendMailSuccess = true; 
					// 메일 전송이 성공했음을 기록함
					
					//세션불러오기
					HttpSession session = request.getSession();
					session.setAttribute("certificationCode", certificationCode);
					
					
					// 발급한 인증번호를 세션에 저장시킴 
				
					
				}catch(Exception e){
					
					e.printStackTrace();
					//메일 전송이 실패했음을 기록함 
				}
				
			}// end of if(isUserExist) 
						
			request.setAttribute("isUserExist", isUserExist);
			request.setAttribute("user_id", user_id);			
			request.setAttribute("sendMailSuccess", sendMailSuccess);
			
			System.out.println("처음 유저아이디" + user_id);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/sge_login/pwd_certificateNum.jsp");
		
			
		}// end of if ("POST".equalsIgnoreCase(method))
		
		  request.setAttribute("method", method);
		
		
		  super.setRedirect(false);
		  super.setViewPage("/WEB-INF/sge_login/findPwd.jsp");
		 
		
		
		
		
	}

}
