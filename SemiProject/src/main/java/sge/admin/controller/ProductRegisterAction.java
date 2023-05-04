package sge.admin.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import sge.member.model.MemberVO;
import parkjuneyub.product.model.*;


public class ProductRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   // == 관리자로 로그인 햇을 때만 제품 등록이 가능하도록 == //
	      
	      HttpSession session = request.getSession();
	      MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	      
	      if(loginuser != null && loginuser.getUser_id().equals("admin")) {
	         //관리자로 로그인 했을 때만
	         String method = request.getMethod();
	         
	         if(!"POST".equalsIgnoreCase(method)) {
	        	 
        	    // category 목록을 조회해오기   VO 사용
                InterProductDAO pdao = new ProductDAO();
                List<CategoryVO> categoryList = pdao.selectCategoryList();
                
                request.setAttribute("categoryList", categoryList);

	            super.setRedirect(false);
	            super.setViewPage("/WEB-INF/sge_admin/productRegister.jsp");
	         }
	         else {   
	            MultipartRequest mtrequest = null;

	            // 1.첨부되어진 파일을 디스크의 어느 경로에 업로드 할 것인지 경로를 설정해야한다
	            ServletContext svlCtx =  session.getServletContext();
	            String uploadFileDir = svlCtx.getRealPath("/image");

	          // 파일을 업로드 해준다. 
	            try {
	            	 mtrequest = new  MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
					
				} catch (IOException e) {
					request.setAttribute("message","업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
					request.setAttribute("loc",request.getContextPath()+"/productRegister.ban");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					return; // 종료
				}
	           
	            
	            // === 첨부이미지파일,제품설명서 파일을 올렸으니 그 다음으로 제품정보(제품명,정가,수량)DB의 tbl_peoduct테이블에 insert 해주어야 한다. === //
	            
	            // 새로운 제품 등록시 form태그에서 입력한 값 가져오기
	            
	            int fk_cnum = Integer.parseInt(mtrequest.getParameter("fk_cnum"));
	            String prodName = mtrequest.getParameter("prodName");
	          
	          
	            
	            // 업로드되어진 시스템의 첨부파일 이름(파일서버에 업로드 되어진 실제파일명)을 얻어 올때는 
	            // cos.jar 라이브러리에서 제공하는 MultipartRequest 객체의 getFilesystemName("form에서의 첨부파일 name명") 메소드를 사용 한다. 
	            // 이때 업로드 된 파일이 없는 경우에는 null을 반환한다.
	            
	            String pimage1 = mtrequest.getFilesystemName("pimage1"); 
	            String price = mtrequest.getParameter("price");
	            String pqty = mtrequest.getParameter("pqty");
	            //그로스 사이트 스크립트 공격 막기(시큐어 코드)
	            
	            String pcontent = mtrequest.getParameter("pcontent");
	            pcontent =  pcontent.replaceAll("<","&lt");
	            pcontent =  pcontent.replaceAll(">","&gt");
	            pcontent = pcontent.replaceAll("\r\n", "<br>");
	            String sale_count = mtrequest.getParameter("saleCount");
	           
	            
	            InterProductDAO pdao = new ProductDAO();
	            
	            // 제품번호 채번해오기 
	            
	            long pnum = pdao.getPnumOfProduct();
	            ProductVO pvo = new ProductVO();
	            pvo.setProduct_num(pnum);
	            pvo.setCategory_num(fk_cnum);
	            pvo.setProduct_title(prodName);
	            pvo.setMain_image(pimage1);
	            pvo.setProduct_price(Integer.parseInt(price));
	            pvo.setProduct_inventory(Integer.parseInt(pqty));
	            pvo.setProduct_detail(pcontent);
	            pvo.setSale_count(Integer.parseInt(sale_count));
	           

	            String message = "";
	            String loc = "";
	            try {

		           // tbl_product 테이블에 insert 하기
		           pdao.productInsert(pvo);

		           message = "제품등록 성공!";
		           loc = request.getContextPath()+"/productRegister.ban";
	         }catch(SQLException e) {
	        	 e.printStackTrace();
	             
	             message = "제품등록 실패!!";
	             loc = request.getContextPath()+"/home.ban";
	        	 
	         }
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	            super.setRedirect(false);
	            super.setViewPage("/WEB-INF/msg.jsp");
	           
	         }
	      }
	      else {
	         //로그인을 안한경우 or 일반사용자일 경우
	            String message = "관리자만 접근가능";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);

	            super.setRedirect(false);
	            super.setViewPage("/WEB-INF/msg.jsp");
	                     
	      }   //end of else ------------------------------
	      
		
	}

}
