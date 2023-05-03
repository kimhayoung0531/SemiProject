package parkjuneyub.product.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import parkjuneyub.board.model.BoardDAO;
import parkjuneyub.board.model.InterBoardDAO;
import parkjuneyub.board.model.ReviewVO;
import parkjuneyub.product.model.InterProductDAO;
import parkjuneyub.product.model.ProductDAO;
import parkjuneyub.product.model.ProductVO;

public class ProductDetailAction extends AbstractController {
	

	/// http://localhost:9090/SemiProject/productDeatail.ban?product_num=9 이런식으로 입력하셔야 상품 상세페이지 들어가실 수 있습니다.
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String product_num = request.getParameter("product_num");
		if(product_num == null) {
			product_num = "";
		}
		if(product_num.trim().isEmpty()) {
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		if(!product_num.trim().isEmpty()) {
			try {
				long num = Long.parseLong(product_num);
			}
			catch(NumberFormatException e) {
				String message = "비정상적인 경로로 들어왔습니다.";
				String loc = "javascript:history.back()";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
			}
			
			
			
			ProductVO pvo = new ProductVO();
			InterProductDAO pdao = new ProductDAO();
			pvo = pdao.showItemInfo(product_num);
			
			
			List<ReviewVO> reviewList = new ArrayList<>();
			Map<String, String> paraMap = new HashMap<>();
			
			//*** 페이징 처리를 한 회원들 보여주기 *** ////////////////////////////////////////
			String currentShowPageNo = request.getParameter("currentShowPageNo");
			
			// currentShowPageNo 은 사용자가 보고자하는 페이지바의 페이지번호이다.
			// 메뉴에서 회원목록만을 클릭했을 경우에는 currentShowPageNo 는 null이 된다. 그러니 null이라면 1을 줘야 한다.
			if(currentShowPageNo == null) {
				currentShowPageNo = "1";
			}
			
			String sizePerPage = "10";

			// get 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo에 숫자가 아닌 문자를 입력한 경우
			// 사용자가 웹 브라우저에 currentShowPageNo에 int 범위를 초과한 숫자를 입력한 경우 currentShowPageNo 는 1로 만든다.
			// 또한 currentShowPageNo 이 0 이하라면 currentShowPageNo는 1 페이지로 만든다.
			
			try {
				if(Integer.parseInt(currentShowPageNo) < 1 ) {
					currentShowPageNo ="1";
				}
			} catch (NumberFormatException e) {
				currentShowPageNo ="1"; 
			}
			
			// 조회하고자 하는 페이지 번호를 변수로 넘겨준다
			paraMap.put("currentShowPageNo", currentShowPageNo);
			
			// 한 페이지다 조회하고 싶은 개수를 변수로 넘겨준다.
			paraMap.put("sizePerPage", sizePerPage);
			
			// 상품의 번호를 넘겨준다.
			paraMap.put("product_num", product_num);
			
			try {
				InterBoardDAO bdao = new BoardDAO();		
				int totalPage = bdao.getTotalPage(paraMap);
				
				// 사용자가 전체 페이지 수 보다 높은 숫자를 입력할 경우 1페이지로 이동한다.
				 if( Integer.parseInt(currentShowPageNo) > totalPage) { 
					 currentShowPageNo ="1"; 
					 paraMap.put("currentShowPageNo", currentShowPageNo);
				 }
				 
				reviewList = bdao.getReviewList(paraMap);
				
				String pageBar = ""; 
				int blockSize = 10; // 한 블럭당 보여지는 페이지 번호의 개수
				int loop = 1;
				int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
				
				/// **** [맨처음][이전] 만들기 **** //
				pageBar += "<li class='page-item'><a class='page-link' href='productDeatail.ban?product_num="+product_num+"&currentShowPageNo="+1+"#reviews'>[맨처음]</a></li>";
				if(pageNo > 1) {
				pageBar += "<li class='page-item'><a class='page-link' href='productDeatail.ban?product_num="+product_num+"&currentShowPageNo="+(pageNo-1)+"#reviews'>[이전]</a></li>";
				}
				
				while( !(loop > blockSize || pageNo > totalPage) ) {
					
					if(pageNo == (Integer.parseInt(currentShowPageNo))) {
						pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
					}
					else {
						pageBar += "<li class='page-item'><a class='page-link' href='productDeatail.ban?product_num="+product_num+"&currentShowPageNo="+pageNo+"#reviews'>" + pageNo + "</a></li>";
					}
								
					loop++; // 1 2 3 4 5 6 7 8 9 10 
					pageNo++; // 1 2 3 4 5 6 7 8 9 10
							  // 11 12 13 14 15 16 17 18 19 20
					
				} // end of while-------------------------------------------------
				
				if(pageNo <= totalPage) {
					pageBar += "<li class='page-item'><a class='page-link' href='productDeatail.ban?product_num="+product_num+"&currentShowPageNo="+pageNo+"#reviews'>[다음]</a></li>";
				}
				pageBar += "<li class='page-item'><a class='page-link' href='productDeatail.ban?product_num="+product_num+"&currentShowPageNo="+totalPage+"#reviews'>[마지막]</a></li>";
				
				request.setAttribute("reviewList", reviewList);
				request.setAttribute("pageBar", pageBar);
				request.setAttribute("product_num", product_num);
				
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/member/productDetail.jsp");
				
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pvo", pvo);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/pjy_product/productDetail.jsp");
		}
		
		
	}
	
}
