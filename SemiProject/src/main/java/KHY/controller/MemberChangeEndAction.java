package KHY.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import sge.member.model.InterMemberDAO;
import sge.member.model.MemberDAO;
import sge.member.model.MemberVO;

public class MemberChangeEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();

		String message = "";
		String loc = "";

		
		if("GET".equalsIgnoreCase(method)) {
			this.setRedirect(false);
			super.setViewPage("/WEB-INF/KHY/mypage_memberchange.jsp");
		}
		else {
			// post 방식으로 넘어온다면 디비에 저장해줘야한다.
			
			System.out.println("제발");
		    
			String user_id = request.getParameter("user_id");
			String pwd = request.getParameter("pwd");
			String user_name = request.getParameter("user_name");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String telephone = request.getParameter("telephone");
			String post_code = request.getParameter("post_code");
			String address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");
			String extraAddress = request.getParameter("extraAddress");

			System.out.println(post_code);
			
		    MemberVO member = new MemberVO(user_id, pwd, user_name, email, mobile,telephone,post_code, address,  detailAddress,  extraAddress);
		
		
			
			
			try{
				InterMemberDAO mdao = new MemberDAO();
				int n = mdao.editmember(member);
				 if(n==1) {
					 
					 	HttpSession session = request.getSession();
			            MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			            
						loginuser.setUser_name(user_name);
						loginuser.setPwd(pwd);
						loginuser.setMobile(mobile);
						loginuser.setPost_code(post_code);
						loginuser.setAddress(address);
						loginuser.setDetailAddress(detailAddress);
						loginuser.setExtraAddress(extraAddress);
												
					
						request.setAttribute("pwd", pwd);
					 
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/ojh_home/home.jsp");
					 
				 }
			}catch (SQLException e) {
				e.printStackTrace();
				 message = "SQL구문 오류발생";
				loc = "javascript:history.back()"; //자바스크립트를 이용한 이전 페이지로 이동한다. 암기하기
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}

	    }
   }
}


