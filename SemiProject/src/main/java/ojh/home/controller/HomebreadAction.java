package ojh.home.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import ojh.home.model.HomeDAO;
import ojh.home.model.InterHomeDAO;
import parkjuneyub.product.model.*;

public class HomebreadAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String category_num = "1";
		
		InterHomeDAO hdao = new HomeDAO();
		
		List<ProductVO> pvoList = hdao.getProductInfo(category_num);
		
		request.setAttribute("pvoList", pvoList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ojh_home/homebread.jsp");
		
		
	}
	
}
