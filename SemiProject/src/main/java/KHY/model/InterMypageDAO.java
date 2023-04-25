package KHY.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface InterMypageDAO {

	public abstract void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
}
