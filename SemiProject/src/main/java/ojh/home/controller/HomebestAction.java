package ojh.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import ojh.home.model.*;
import parkjuneyub.product.model.ProductVO;

public class HomebestAction extends AbstractController {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String category_num = "1";
		
		InterHomeDAO hdao = new HomeDAO();
		
		List<ProductVO> pvoList = hdao.getProductInfo(category_num);
		
		request.setAttribute("pvoList", pvoList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ojh_home/homebest.jsp");
		
	}

}


