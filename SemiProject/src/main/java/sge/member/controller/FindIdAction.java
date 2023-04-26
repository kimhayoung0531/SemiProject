package sge.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import sge.member.model.InterMemberDAO;
import sge.member.model.MemberDAO;

public class FindIdAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		if("GET".equalsIgnoreCase(method)) {
			setRedirect(false);
			setViewPage("/WEB-INF/sge_login/findId.jsp");
		}
		else {
			String user_name = request.getParameter("user_name");
			String email = request.getParameter("email");
			
			InterMemberDAO mdao = new MemberDAO();
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("user_name", user_name);			
			paraMap.put("email", email);
			
			String user_id = mdao.findUserId(paraMap);
			
			//System.out.println("user_name" + user_name);
			//System.out.println("email" + email);
			//System.out.println("user_id" + user_id);
			
			if(user_id != null) {
				request.setAttribute("user_id", user_id);
			}
			else {
				request.setAttribute("user_id", "존재하지 않습니다");
			}
			
			request.setAttribute("user_name", user_name);
			request.setAttribute("email", email);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/sge_login/findIdResult.jsp");
		
		}
		
	}

}
