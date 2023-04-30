package parkjuneyub.board.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterBoardDAO {
	
	// 상품번호를 가지고 관련 리뷰 글을 가져오는 메소드
	List<ReviewVO> getReivewList(String product_num) throws SQLException;

	// 리뷰를 작성하는 메소드
	int insertReview(Map<String, Object> map) throws SQLException;
	
}
