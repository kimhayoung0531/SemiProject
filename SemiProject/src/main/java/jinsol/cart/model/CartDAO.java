package jinsol.cart.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import parkjuneyub.product.model.ProductVO;
import sge.member.model.MemberVO;

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
	
	/*
	// test cart select
	public List<CartVO> cartSelectAll() throws SQLException {
					
			List<CartVO> cartList = new ArrayList<>();

			try {
				conn = ds.getConnection();

				String sql = " select cart_num, A.product_num as product_num, product_count, cart_date, product_price "
						+ " from "
						+ " ( "
						+ " select cart_num, product_num, product_count, cart_date "
						+ " from tbl_cart "
						+ " where user_id = 'test' "
						+ " ) A  "
						+ " join "
						+ " (select product_num, product_price from tbl_product ) B "
						+ " on A.product_num = B.product_num ";
				
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						CartVO cartvo = new CartVO();
						cartvo.setCart_num(rs.getLong(1));
						
						ProductVO pvo = new ProductVO();
						cartvo.setPvo(pvo);
						cartvo.setProduct_num(rs.getLong(2));
						cartvo.setProduct_count(rs.getLong(3));
						cartvo.setCart_date(rs.getString(4));
						pvo.setProduct_price(rs.getLong(5));
						cartvo.setPvo(pvo);
						
						cartList.add(cartvo);
					}
					
				} finally {
					close();
				}
			
			return cartList; 
		}//end of public List<CartVO> cartSelectAll()  ---------------
	
	*/
	
}
