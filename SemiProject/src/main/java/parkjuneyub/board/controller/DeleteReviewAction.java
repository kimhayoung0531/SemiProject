package parkjuneyub.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import parkjuneyub.board.model.BoardDAO;
import parkjuneyub.board.model.InterBoardDAO;

public class DeleteReviewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String purchase_review_id = request.getParameter("purchase_review_id");
		
		InterBoardDAO bdao = new BoardDAO();
		int n = bdao.deleteReviewByReviewId(purchase_review_id);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		String json = jsonObj.toString();
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
