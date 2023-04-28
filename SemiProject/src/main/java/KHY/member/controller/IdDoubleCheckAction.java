package KHY.member.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import sge.member.model.InterMemberDAO;
import sge.member.model.MemberDAO;

public class IdDoubleCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			String user_id = request.getParameter("user_id");
			
			InterMemberDAO mdao = new MemberDAO();
			
			// 존재하는지 아닌지를 판명하는 메소드 이기때문에 boolean 
			Boolean idExist = mdao.idDoubleCheck(user_id);
			
			//아이디를 JSON OBJECT으로 보냈음 
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("idExist", idExist);
			
			String json = jsonobj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");

		}
		
	}

} 
