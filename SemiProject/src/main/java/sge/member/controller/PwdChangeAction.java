package sge.member.controller;

import java.util.HashMap;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import sge.member.model.InterMemberDAO;
import sge.member.model.MemberDAO;

public class PwdChangeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  String method = request.getMethod(); 
		  String user_id = request.getParameter("user_id");
		  
		  System.out.println(user_id);
			
		  if("POST".equalsIgnoreCase(method)) { //암호변경하길을 클릭한 경우
		      String message = "";
		      String loc = "";
		  
			  String pwd = request.getParameter("pwd");
			  System.out.println(pwd);
			  
			  Map<String, String> paraMap = new HashMap<>(); 
			  paraMap.put("pwd", pwd);
			  paraMap.put("user_id", user_id);
			  
			  InterMemberDAO mdao = new MemberDAO(); 

			  int n = mdao.pwdUpdate(paraMap);
			  
			  if(n == 1) {
				  message = "비밀번호 변경에 성공하셨습니다!";
				  loc = request.getContextPath()+"/home.ban";
			  }
			  else {
				  message = "비밀번호 변경에 실패!";
				  loc = request.getContextPath()+"/pwdChange.ban";
			  }
			  
			  request.setAttribute("n", n); 
			  request.setAttribute("message", message);
			  request.setAttribute("loc", loc);
			  request.setAttribute("user_id", user_id);
				
			  super.setRedirect(false);
			  super.setViewPage("/WEB-INF/msg.jsp");

		  }
		  else {
			  super.setRedirect(false); 
			  super.setViewPage("/WEB-INF/sge_login/pwd_change.jsp");
		  }
			 
		 
		
	}
	
	}


