package KHY;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;



public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		

		super.setViewPage("/WEB-INF/KHY/home.jsp"); //this. 써도 되고
		
		
		
	}

}
