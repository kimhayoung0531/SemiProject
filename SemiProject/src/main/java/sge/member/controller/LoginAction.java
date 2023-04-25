package sge.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import sge.member.model.InterMemberDAO;
import sge.member.model.MemberDAO;
import sge.member.model.MemberVO;

public class LoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String method = request.getMethod();
		
        if("GET".equalsIgnoreCase(method)) {
			this.setRedirect(false);
			super.setViewPage("/WEB-INF/sge_login/memberLogin.jsp");
		}
        else{
		//Post 방식으로 넘어온 것이라면 
		String user_id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");
		
		
		// ==> 클라이언드의 IP주소를 알아오는 것 <==
		String clientip = request.getRemoteAddr();
		Map<String, String> paraMap = new HashMap<>();
		
		paraMap.put("user_id",user_id);
		paraMap.put("pwd",pwd);
		paraMap.put("clientip",clientip);
		
		InterMemberDAO mdao = new MemberDAO();
		
		MemberVO loginuser = mdao.selectOneMember(paraMap);
		
		if(loginuser != null) {
			if(loginuser.getIdle() == 1) {
				String message = "로그인을 한지 1년이 지나서 휴면상태로 되었습니다. 관리자에게 문의하세요";
				String loc = "";
				
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return; //메소드 종료
			}
			// 로그인 성공시 
			  System.out.println(">> 확인용 로그인 사용자명 " + loginuser.getUser_name());
			
			
			  HttpSession session = request.getSession();
			  //was 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			  
			  session.setAttribute("loginuser", loginuser);
			  //session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser"으로 저장시켜두는 것이다.
			  
			  if(loginuser.isRequirePwdChange() == true) {
				  String message = "비밀번호를 변경하신지 3개월이 지났습니다. 암호를 변경하세요!!";
				  String loc = request.getContextPath()+"/passwordChange.up";

				  request.setAttribute("message", message);
				  request.setAttribute("loc", loc);
				
				  super.setRedirect(false);
				  super.setViewPage("/WEB-INF/msg.jsp");
			  }
			  else {
				  
				  super.setRedirect(true);
				  super.setViewPage("/WEB-INF/msg.jsp");
			  }
			  super.setRedirect(true);
			  super.setViewPage("/WEB-INF/ojh_home/home.jsp");
			  
			  
		}
		else {
			String message = "로그인 실패";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
		}
	}
  }

}
