package ojh.home.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import ojh.home.model.ImageVO;
import parkjuneyub.product.model.ProductVO;

public interface InterHomeDAO {

	// 카테고리 상품 가져오기
	List<ProductVO> getProductInfo(String category_num) throws SQLException;
	
	
	List<ProductVO> getBestItemBysalecount() throws SQLException;
	
	
	
	

	
}
