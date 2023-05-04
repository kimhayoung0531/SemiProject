package ojh.home.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import ojh.home.model.*;
import parkjuneyub.product.model.*;


public class HomecakeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String catrgory_Num = "2";
		
		InterHomeDAO hdao = new HomeDAO();
		
		List<ProductVO> pvoList = hdao.getProductInfo(catrgory_Num);
		
		request.setAttribute("pvoList", pvoList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ojh_home/homecake.jsp");
		
	}

}
