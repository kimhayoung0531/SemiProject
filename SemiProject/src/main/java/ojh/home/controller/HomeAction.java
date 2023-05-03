package ojh.home.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import ojh.home.model.*;
import parkjuneyub.product.model.ProductVO;

public class HomeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		/*
		 * InterHomeDAO hdao = new HomeDAO();
		 * 
		 * List<ProductVO> pvohomeList = hdao.getBestItemBysalecount();
		 * 
		 * request.setAttribute("pvohomeList", pvohomeList);
		 */
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ojh_home/home.jsp");
		
		
	}

}


