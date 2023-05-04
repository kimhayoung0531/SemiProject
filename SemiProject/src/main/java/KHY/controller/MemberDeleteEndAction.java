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

public class MemberDeleteEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();

		String message = "";
		String loc = "";

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		try{
			InterMemberDAO mdao = new MemberDAO();
			int n = mdao.deletemember(loginuser.getUser_id());
			 if(n==1) {
				
		            
				 session.invalidate();
				
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
		
		
//		if("GET".equalsIgnoreCase(method)) {
//			this.setRedirect(false);
//			super.setViewPage("/WEB-INF/KHY/mypage_delete.jsp");
//		}
//		else {
//			// post 방식으로 넘어온다면 디비에 저장해줘야한다.
//		    
//					 
//					try{
//						InterMemberDAO mdao = new MemberDAO();
//						int n = mdao.deletemember(loginuser.getUser_id());
//						 if(n==1) {
//							
//					            
//							 session.invalidate();
//							
//							 super.setRedirect(false);
//							 super.setViewPage("/WEB-INF/ojh_home/home.jsp");
//							 
//						 }
//					}catch (SQLException e) {
//						e.printStackTrace();
//						 message = "SQL구문 오류발생";
//						loc = "javascript:history.back()"; //자바스크립트를 이용한 이전 페이지로 이동한다. 암기하기
//						
//						super.setRedirect(false);
//						super.setViewPage("/WEB-INF/msg.jsp");
//					}
//
//			    }
		   }
		}