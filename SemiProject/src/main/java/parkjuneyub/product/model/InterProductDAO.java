package parkjuneyub.product.model;

import java.sql.*;

public interface InterProductDAO {
	
	// 상품페이지에 상품에 대한 정보를 출력하기 위한 메소드
	ProductVO showItemInfo(String productNum) throws SQLException;
	
	
	
}
