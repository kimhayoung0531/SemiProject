package jinsol.cart.model;

import java.sql.*;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CartDAO implements InterCartDAO {

	private DataSource ds;    // DataSource ds 는 아파치톰켓이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	

	// 사용한 자원을 반납하는 close() 매소드 생성하기
	private void close() {
		try {
			if(rs != null) { rs.close(); rs=null;}
			if(pstmt != null) { pstmt.close(); pstmt=null;}
			if(conn != null) { conn.close(); conn=null;}
		} catch(SQLException e) { 
			e.printStackTrace();
		}
	}	//end of private void close()--------------------------

	// 생성자
	public CartDAO() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");      // lookup(이름) 이 중요한 것이다. web.xml 부분의 이름, context.xml 이름과 모두 같아야 한다. 이 것이 배치 서술자인 web.xml 로 가고 context.xml 로 간다. 
		    
		} catch(NamingException e) {
			e.printStackTrace();
		}
	    
	}	//end of public CartDAO() --------------------------------

	//http://localhost:9090/SemiProject/cart.ban?item_cnt=1&product_num=12
	
	
	
	
	// 장바구니 담기 ~
    // 장바구니 테이블(tbl_cart)에 해당 제품을 담아야 한다.
    // 장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 tbl_cart 테이블에 insert 를 해야하고, 
    // 장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 tbl_cart 테이블에 update 를 해야한다. 
	@Override
	public int addCart(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		// user_id == user_id ,  product_count == item_cnt(int) , product_num == pnum(Long)
		try {
	         conn = ds.getConnection();
	         
	         String sql = " select cart_num "
	                  + " from  "
	                  + " ( "
	                  + " select cart_num, product_num, product_count, cart_date "
	                  + " from tbl_cart "
	                  + " where user_id = 'test' and product_num = ? "
	                  + " ) A "
	                  + " join "
	                  + " (select product_num, product_price from tbl_product ) B "
	                  + " on A.product_num = B.product_num ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, paraMap.get("product_num"));  
	         
	         rs = pstmt.executeQuery();
	         if(rs.next()) {	
	        	 // 어떤 제품을 추가로 장바구니에 넣고자 하는경우
	        	  Long cart_num = rs.getLong("cart_num");
	        	  
	        	  sql = " update tbl_cart set product_count = product_count + ? " +
		                  " where cart_num = ? ";

	        	  pstmt = conn.prepareStatement(sql);
	        	  pstmt.setLong(1, Long.parseLong(paraMap.get("item_cnt")) );         
	        	  pstmt.setLong(2, cart_num);         
	            
	        	  n= pstmt.executeUpdate();
	         }
	         else {
	        	 // 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우

	        	 sql = " insert into tbl_cart (cart_num, user_id, product_num, product_count, cart_date) "
	        	 		+ " values (seq_cart_cart_num.nextval, ? , ? , ? , sysdate) " ;
	        	 
	        	 pstmt = conn.prepareStatement(sql);
	        	 
	        	 pstmt.setString(1, paraMap.get("user_id"));
		         pstmt.setLong(2, Long.parseLong(paraMap.get("product_num")) );  
		         pstmt.setLong(3, Long.parseLong(paraMap.get("item_cnt")) );         
	         
	         
		         n = pstmt.executeUpdate(); 
	         }
	         
		}
		finally {
			close();
		}
		
		return n;
	}	//end of public int addCart(Map<String, String> paraMap) ----------------
	
	
	
}
