package ojh.home.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import ojh.home.model.*;
import parkjuneyub.product.model.*;

public class HomedrinkAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cartegory_num = "4";
		
		InterHomeDAO hdao = new HomeDAO();
		
		List<ProductVO> pvoList = hdao.getProductInfo(cartegory_num);
		
		request.setAttribute("pvoList", pvoList);
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ojh_home/homedrink.jsp");
		
	}

}
