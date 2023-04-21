package parkjuneyub.product.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import parkjuneyub.product.model.InterProductDAO;
import parkjuneyub.product.model.ProductDAO;
import parkjuneyub.product.model.ProductVO;

public class ProductDetailAction extends AbstractController {
	


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String product_num = request.getParameter("product_num");
		System.out.println("상품번호 테스트" + product_num);
		ProductVO pvo = new ProductVO();
		
		InterProductDAO pdao = new ProductDAO();
		
		pvo = pdao.showItemInfo(product_num);
		
		request.setAttribute("pvo", pvo);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pjy_product/productDetail.jsp");
	}
	
}
