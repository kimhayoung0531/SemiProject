package ojh.home.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

import ojh.home.model.*;

public class HomeMallAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// === Ajax(JSON)를 사용하여 HIT 상품목록을 "더보기" 방식으로 페이징 처리해서 보여주겠다. === //
		
		InterHomeDAO pdao = new HomeDAO();
		
		int category_num = pdao.category_num("1");  // HIT 상품의 전체개수를 알아온다.
		
		//System.out.println("확인용 totalHITCount : " + totalHITCount);
		
		
		request.setAttribute("category_num", category_num);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ojh_home/homebread.jsp");
		
	}

}
