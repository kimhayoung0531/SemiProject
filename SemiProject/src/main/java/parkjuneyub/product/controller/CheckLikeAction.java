package parkjuneyub.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import parkjuneyub.product.model.InterProductDAO;
import parkjuneyub.product.model.ProductDAO;


public class CheckLikeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = (String)request.getParameter("user_id");
		String product_num = (String)request.getParameter("product_num");
		InterProductDAO pdao = new ProductDAO();
		
		int n = pdao.checkLikeList(user_id, product_num);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		String json = jsonObj.toString();
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
