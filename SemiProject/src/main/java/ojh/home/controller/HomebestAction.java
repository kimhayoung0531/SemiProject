package ojh.home.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import ojh.home.model.*;
import parkjuneyub.product.model.ProductVO;

public class HomebestAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		  InterHomeDAO hdao = new HomeDAO();
		  
		  List<ProductVO> pvoCatBestList = hdao.getCatBestItemBysalecount();
		  
		  request.setAttribute("pvoCatBestList", pvoCatBestList);
		
		  
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ojh_home/homebest.jsp");
		
		
	}

}


