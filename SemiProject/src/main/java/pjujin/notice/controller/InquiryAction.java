package pjujin.notice.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import pjujin.noticelist.controller.InterNoticeDAO;
import pjujin.noticelist.controller.NoticeDAO;
import pjujin.noticelist.controller.NoticeVO;
import sge.member.model.MemberVO;

public class InquiryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MultipartRequest mtrequest = null;
		
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if( loginuser != null ) {
			
			String method = request.getMethod();
			
			if(!"POST".equalsIgnoreCase(method)) {
				
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/pjujin_cs/inquiry.jsp");
			}
			
			else {
		        ServletContext svlCtx = session.getServletContext();
				String uploadFileDir = svlCtx.getRealPath("/image");
				
				
				try {
					mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
					} catch(IOException e) {
					request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
					request.setAttribute("loc", request.getContextPath()+"/inquiry.ban");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/pjujin_cs/msg.jsp");
					return;
					
				}
				  
				
					
				String inquiry_title = mtrequest.getParameter("inquiry_title");
				String inquiry_text = mtrequest.getParameter("inquiry_text");
				inquiry_text = inquiry_text.replaceAll("<", "&lt;");
		        inquiry_text = inquiry_text.replaceAll(">", "&gt;");
		        inquiry_text = inquiry_text.replaceAll("\r\n", "<br>");
				
				
				System.out.println(mtrequest);
				
				InterNoticeDAO ndao = new NoticeDAO();
				NoticeVO nvo = new NoticeVO();
				
				
				
				
				nvo.setUser_id(loginuser.getUser_id());
				nvo.setInquiry_title(inquiry_title);
		        nvo.setInquiry_text(inquiry_text);
		        

		         
		        String message = "";
		        String loc = "";
				
		        try {
			        if(nvo != null) {
			        	ndao.inquiryInsert(nvo);
			        	
			        	message = "상품문의 성공!!";
			        	loc = request.getContextPath()+"/productinquiry.ban";
			        }
					
		        } catch (SQLException e) {
		       	 	e.printStackTrace();
		    	 
		       	 	message = "상품문의 실패!!";
		       	 	loc = request.getContextPath()+"/inquiry.ban";
		        } 
		        
		        request.setAttribute("message", message);
		        request.setAttribute("loc", loc);
		        
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/pjujin_cs/msg.jsp");
				}
		
			}
			else {
				
				String message = "상품문의는 로그인이 필요합니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				}
			}
		}
