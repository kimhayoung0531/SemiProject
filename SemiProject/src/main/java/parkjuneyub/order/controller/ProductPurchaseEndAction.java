package parkjuneyub.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import sge.member.model.MemberVO;



public class ProductPurchaseEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (super.checkLogin(request)) {
			// 로그인을 했으면
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			String userid = request.getParameter("userid");
			
			
			if (loginuser.getUser_id().equals(userid)) {
				// 로그인한 사용자가 자신의 코인을 충전하는 경우
				
				String finalTotalPrice = request.getParameter("finalTotalPrice");
				String productName = "결제";
				int productPrice = 100;
				
				request.setAttribute("productName", productName);
				request.setAttribute("productPrice", productPrice);
				request.setAttribute("email", loginuser.getEmail());
				request.setAttribute("name", loginuser.getUser_name());
				request.setAttribute("mobile", loginuser.getMobile());
				request.setAttribute("userid", userid);
				request.setAttribute("finalTotalPrice", finalTotalPrice);
				
				System.out.println(loginuser.getEmail());
				System.out.println(loginuser.getUser_name());
				System.out.println(userid);
				
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/pjy_order/paymentGateway.jsp");
			} else {
				// 로그인한 사용자가 다른 사용자의 코인을 충전하려고 시도하는 경우
				String message = "다른 사용자의 결제는 허용되지 않습니다.";
				String loc = "javascript:history.back()";

				request.setAttribute("message", message);
				request.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}

		} else {
			String message = "결제를 위해서는 로그인을 먼저 해주세요";
			String loc = "javascript:history.back()";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");

		}
		
	}

}
