package ojh.home.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import ojh.home.model.ImageVO;
import parkjuneyub.product.model.ProductVO;

public interface InterHomeDAO {

	// 카테고리 상품 가져오기
	List<ProductVO> getProductInfo(String category_num) throws SQLException;
	
	// 카테고리 베스트 상품 데이터 출력
	List<ProductVO> getCatBestItemBysalecount() throws SQLException;
	
	// 메인페이지 베스트 이벤트 데이터 출력
	List<ProductVO> getBestItemBysalecount() throws SQLException;

	// 메인페이지 신상품 이벤트 데이터 출력
	List<ProductVO> getNewProduct() throws SQLException;
	
	
	
	
	
	
	
	

	
}
