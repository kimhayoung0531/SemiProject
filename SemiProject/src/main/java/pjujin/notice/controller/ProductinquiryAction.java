package pjujin.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import pjujin.noticelist.controller.InterNoticeDAO;
import pjujin.noticelist.controller.NoticeDAO;
import pjujin.noticelist.controller.NoticeVO;

public class ProductinquiryAction extends AbstractController {

	InterNoticeDAO ndao = new NoticeDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*** 페이징처리 ***/
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");

		if (searchType == null || (!"notice_title".equals(searchType) && !"notice_content".equals(searchType)
				&& !"notice_writer".equals(searchType))) {
			searchType = "";
		}

		if (searchWord == null || (searchWord != null && searchWord.trim().isEmpty())) {
			searchWord = "";
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);

		String currentShowPageNo = request.getParameter("currentShowPageNo");
		String sizePerPage = request.getParameter("sizePerPage");

		if (currentShowPageNo == null) {
			currentShowPageNo = "1";
		}

		if (sizePerPage == null || 
		    !("1".equals(sizePerPage) || "2".equals(sizePerPage) || "3".equals(sizePerPage))) {
			sizePerPage = "3";
		}

		try {
			if (Integer.parseInt(currentShowPageNo) < 1) {
				currentShowPageNo = "1";
			}
		} catch (NumberFormatException e) {
			currentShowPageNo = "1";
		}

		paraMap.put("currentShowPageNo", currentShowPageNo);
		paraMap.put("sizePerPage", sizePerPage);

		int totalPage = ndao.inquiryPage(paraMap);

		
		if (Integer.parseInt(currentShowPageNo) > totalPage) {
			currentShowPageNo = "1";
			paraMap.put("currentShowPageNo", currentShowPageNo);
		}
		
		List<NoticeVO> inquiryList = ndao.selectinquiryPaging(paraMap);
		
		request.setAttribute("inquiryList", inquiryList);

		request.setAttribute("searchType", searchType);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("sizePerPage", sizePerPage);

		/*** 페이지바 ***/

		String pageBar = "";

		int blockSize = 10;

		int loop = 1;

		int pageNo = ((Integer.parseInt(currentShowPageNo) - 1) / blockSize) * blockSize + 1;

		pageBar += "<li class='page-item'><a class='page-link' href='notice.ban?searchType=" + searchType
				+ "&searchWord=" + searchWord + "&currentShowPageNo=1&sizePerPage=" + sizePerPage + "'>[맨처음]</a></li>";
		if (pageNo != 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='notice.ban?searchType=" + searchType
					+ "&searchWord=" + searchWord + "&currentShowPageNo=" + (pageNo - 1) + "&sizePerPage=" + sizePerPage
					+ "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='notice.ban?searchType=" + searchType
						+ "&searchWord=" + searchWord + "&currentShowPageNo=" + pageNo + "&sizePerPage=" + sizePerPage
						+ "'>" + pageNo + "</a></li>";
			}

			loop++;

			pageNo++;

		} // end of while---------------------------

		// *** [다음][마지막] 만들기 *** //
		// pageNo ==> 11
		if (pageNo <= totalPage) {
			pageBar += "<li class='page-item'><a class='page-link' href='notice.ban?searchType=" + searchType
					+ "&searchWord=" + searchWord + "&currentShowPageNo=" + pageNo + "&sizePerPage=" + sizePerPage
					+ "'>[다음]</a></li>";
		}
		pageBar += "<li class='page-item'><a class='page-link' href='notice.ban?searchType=" + searchType
				+ "&searchWord=" + searchWord + "&currentShowPageNo=" + totalPage + "&sizePerPage=" + sizePerPage
				+ "'>[마지막]</a></li>";

		request.setAttribute("pageBar", pageBar);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pjujin_cs/productinquiry.jsp");
		
	}

}
