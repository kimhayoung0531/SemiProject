package parkjuneyub.product.model;

import java.sql.*;
import java.util.HashMap;
import java.util.List;

import parkjuneyub.product.model.*;
import sge.admin.controller.CategoryVO;

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

	//카테고리 리스트를 조회해오는 메소드
	List<CategoryVO> selectCategoryList()throws SQLException;

	//상품번호 채번해오기
	int getPnumOfProduct()throws SQLException;

	//상품테이블에 상품 추가하기
	int productInsert(ProductVO pvo)throws SQLException;
	
	
	
}
