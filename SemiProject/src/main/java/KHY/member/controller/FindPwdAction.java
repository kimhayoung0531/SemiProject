package KHY.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class FindPwdAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		setRedirect(false);
		setViewPage("/WEB-INF/sge_login/findPwd.jsp");
		
	}

}
