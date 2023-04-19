package sge.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MemberRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//String method = request.getMethod();
		this.setRedirect(false);
		this.setViewPage("/WEB-INF/member/memberRegister.jsp");
		
	}

}
