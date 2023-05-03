package KHY.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import KHY.product.model.InterProductDAO;
import KHY.product.model.OrderDeatailVO;
import KHY.product.model.ProductDAO;
import common.controller.AbstractController;
import sge.member.model.MemberVO;




public class MypageOrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String startdate = request.getParameter("wDate1");
		String enddate = request.getParameter("wDate2");
		String currentShowPageNO = request.getParameter("currentShowPageNO");
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("user_id", loginuser.getUser_id());
		paraMap.put("startdate", startdate);
		paraMap.put("enddate", enddate);
		
		
		
		if(loginuser != null)  {
			// 로그인을 했으면
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/KHY/mypage_order_list.jsp");
				InterProductDAO pdao = new ProductDAO(); 
				
				if(currentShowPageNO == null) {
					currentShowPageNO = "1";
				}
				
				try {
					
					if(Integer.parseInt(currentShowPageNO) < 1) {
						currentShowPageNO = "1";
					}
				} catch(NumberFormatException e) {
					currentShowPageNO = "1";
				}
				
				paraMap.put("currentShowPageNO", currentShowPageNO); //조회하고자하는 페이지번호
		         
				int totalPage = pdao.getTotalPageOrder(paraMap);
				
				if( Integer.parseInt(currentShowPageNO) > totalPage) {
					  currentShowPageNO = "1";
					  paraMap.put("currentShowPageNO", currentShowPageNO);
				  }
				

				List<OrderDeatailVO> orderList = pdao.selectPagingOrderList(paraMap);
				
				int count = pdao.selectOrderListCount(paraMap);
				
		        request.setAttribute("orderList", orderList);
		        request.setAttribute("count", count);
			
		        String pageBar = "";
				
				int blockSize = 10;
				// blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다.
				
				int loop = 1;
				// loop는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 개수(지금은 10개)까지만 증가하는 용도이다.
				
				// !!!! 다음은 pageNo를 구하는 공식이다. !!!!//
				int pageNo  = ( ( Integer.parseInt(currentShowPageNO) - 1)/blockSize ) * blockSize + 1; 
				// pageNo 는 페이지바에서 보여지는 첫번째 번호이다.
				
				////////////////////////////////////////////////
				
				// **** [맨처음][이전] 만들기 **** //
				pageBar += "<div class='pagi'><li class='page-item'><a class='page-link' href='mypageOrderList.ban?wDate1="+startdate+"&wDate2="+enddate+"&currentShowPageNO=1'>[맨처음]</a></li>";
				if(pageNo != 1) {
					pageBar += "<li class='page-item'><a class='page-link' href='mypageOrderList.ban?wDate1="+startdate+"&wDate2="+enddate+"&currentShowPageNO="+(pageNo-1)+"'>[이전]</a></li>";
				}
				
				
				
				
				while( !(loop > blockSize || pageNo > totalPage) ) {
					
					if(pageNo == Integer.parseInt(currentShowPageNO) ) {
						pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; // 부트스트랩에 있는 네비게이션 페이지바 사용하는거임
					}
					else {
						pageBar += "<li class='page-item'><a class='page-link' href='mypageOrderList.ban?wDate1="+startdate+"&wDate2="+enddate+"&currentShowPageNO="+pageNo+"'>"+pageNo+"</a></li>"; // 부트스트랩에 있는 네비게이션 페이지바 사용하는거임
					}
					loop++;   // 1 2 3 4 5 6 7 8 9 10
					
					pageNo++; // 1  2  3  4  5  6  7  8  9 10
							  //11 12 13 14	15 16 17 18 19 20
							  //21 22 23 24	25 26 27 28 29 30
							  //
					
				} //end of while 
				
				// **** [다음][마지막] 만들기 **** //
				// pageNo => 11
				// pageNo => 21
				if(pageNo <= totalPage) {
					pageBar += "<li class='page-item'><a class='page-link' href='mypageOrderList.ban?wDate1="+startdate+"&wDate2="+enddate+"&currentShowPageNO="+pageNo+"'>[다음]</a></li>";
						
				}
				pageBar += "<li class='page-item'><a class='page-link' href='mypageOrderList.ban?wDate1="+startdate+"&wDate2="+enddate+"&currentShowPageNO="+totalPage+"'>[마지막]</a></li></div>";
				
				
				
				request.setAttribute("pageBar", pageBar);
				
			
				// 로그인한 사용자가 자신의 마이페이지를 보는 경우
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/KHY/mypage_order_list.jsp");

			
			
		}
		else {
			
			// 로그인을 안했으면
			String message = "회원정보를 수정 하기 위해서는 먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
		}
		
	
	}
}
