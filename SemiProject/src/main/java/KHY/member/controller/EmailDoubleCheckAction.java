package KHY.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import sge.member.model.InterMemberDAO;
import sge.member.model.MemberDAO;

public class EmailDoubleCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			String email = request.getParameter("email");
			
			InterMemberDAO mdao = new MemberDAO();
			Boolean emailExist = mdao.emailDoubleCheck(email);
			
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("emailExist", emailExist);
			
			String json = jsonobj.toString();
			
			request.setAttribute("json", json);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");

		}
		
		
	}

}
