package sge.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class RegisterAgreementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String method = request.getMethod();
		
		if("GET".equals(method)) {
			this.setRedirect(false);
			this.setViewPage("/WEB-INF/sge_member/registerAgreement.jsp");
		}
		
		
	}
}
