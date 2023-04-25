package parkjuneyub.product.model;

import java.sql.*;
import java.util.List;

import jinsol.cart.model.CartVO;

public interface InterProductDAO {
	
	// 상품페이지에 상품에 대한 정보를 출력하기 위한 메소드
	ProductVO showItemInfo(String product_num) throws SQLException;

	// 유저아이디로 장바구니 내용물 가져오는 메소드
	List<CartVO> getCartList(String userid) throws SQLException;
	
	
	
}
