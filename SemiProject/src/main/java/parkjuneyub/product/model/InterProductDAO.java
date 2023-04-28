package parkjuneyub.product.model;

import java.sql.*;
import java.util.HashMap;
import java.util.List;

import parkjuneyub.product.model.*;

public interface InterProductDAO {
	
	// 상품페이지에 상품에 대한 정보를 출력하기 위한 메소드
	ProductVO showItemInfo(String product_num) throws SQLException;

	// 유저아이디로 장바구니 내용물 가져오는 메소드
	List<CartVO> getCartList(String userid) throws SQLException;
	
	// 주문코드를 위한 시퀀스 가져오기
	int getSeq_tbl_order() throws SQLException;
	
	// 트랜잭션을 처리해주는 메소드
	int orderAdd(HashMap<String, Object> paraMap) throws SQLException;
	
	// 상품 좋아요 업데이트
	int updateLikeProduct(String user_id, String product_num) throws SQLException;

	// 좋아요를 눌렀는지 확인하기
	int checkLikeList(String user_id, String product_num) throws SQLException;
	
	
	
}
