package jinsol.cart.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InterCartDAO {

	// 장바구니 담기 
    // 장바구니 테이블(tbl_cart)에 해당 제품을 담아야 한다.
    // 장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 tbl_cart 테이블에 insert 를 해야하고, 
    // 장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 tbl_cart 테이블에 update 를 해야한다. 
	int addCart(Map<String, String> paraMap) throws SQLException;
	
	// 로그인한 사용자의 장바구니 목록을 조회하기 
	List<CartVO> selectProductCart(String user_id) throws SQLException;
	
	// 로그인한 사용자 장바구니에 담긴 주문총액 합계 알아오기
	HashMap<String, String> selectCartSumPricePoint(String user_id) throws SQLException;

	
}
