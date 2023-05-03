package jinsol.cart.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import parkjuneyub.product.model.ProductVO;

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

	
	
	// 장바구니 담기 ~
    // 장바구니 테이블(tbl_cart)에 해당 제품을 담아야 한다.
    // 장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 tbl_cart 테이블에 insert 를 해야하고, 
    // 장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 tbl_cart 테이블에 update 를 해야한다. 
	@Override
	public int addCart(Map<String, String> paraMap) throws SQLException {
		int n = 0;

		try {
	         conn = ds.getConnection();
	         
	         String sql = " select cart_num "
	                  + " from  "
	                  + " ( "
	                  + " select cart_num, product_num, product_count, cart_date "
	                  + " from tbl_cart "
	                  + " where user_id = ? and product_num = ? "
	                  + " ) A "
	                  + " join "
	                  + " (select product_num, product_price from tbl_product ) B "
	                  + " on A.product_num = B.product_num ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, paraMap.get("user_id"));
	         pstmt.setString(2, paraMap.get("product_num"));  
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {	
	        	 // 어떤 제품을 추가로 장바구니에 넣고자 하는경우
	        	 long cart_num = rs.getLong("cart_num");
	        	  
	        	  sql = " update tbl_cart set product_count = product_count + ? " +
		                  " where cart_num = ? ";

	        	  pstmt = conn.prepareStatement(sql);
	        	  pstmt.setLong(1, Long.parseLong(paraMap.get("cart_cnt")));
	        	  pstmt.setLong(2, cart_num);         
	            
	        	  n= pstmt.executeUpdate();
	         }
	         else {
	        	 // 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
	        	 sql = " insert into tbl_cart(cart_num, user_id, product_num, product_count, cart_date) "
			         + " values(seq_cart_cart_num.nextval, ?, ?, ?, sysdate) ";
	        	 
	        	 pstmt = conn.prepareStatement(sql);
	        	 
	        	 pstmt.setString(1, paraMap.get("user_id"));
		         pstmt.setLong(2, Long.parseLong(paraMap.get("product_num")));  
		         pstmt.setLong(3, Long.parseLong(paraMap.get("cart_cnt")) );         
	         
	         
		         n = pstmt.executeUpdate(); 
	         }
	         
		}
		finally {
			close();
		}
		
		return n;
	}	//end of public int addCart(Map<String, String> paraMap) ----------------

	
	
	// 로그인한 사용자의 장바구니 목록을 조회하기 
	@Override
	public List<CartVO> selectProductCart(String user_id) throws SQLException {

		List<CartVO> cartList = null;		//장바구니에 아무것도 없을 경우
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select A.cart_num, A.user_id, A.product_num, "+
	                    "  		   B.product_title, B.main_image, B.product_price, A.product_count "+
	                    " from tbl_cart A join tbl_product B "+
	                    " on A.product_num = B.product_num "+
	                    " where A.user_id = ? "+
	                    " order by A.cart_num desc ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, user_id);
	         
	         rs = pstmt.executeQuery();
	         
	         int cnt = 0;
	         while(rs.next()) {
	            cnt++;
	            
	            if(cnt==1) {
	               cartList = new ArrayList<>();
	            }
	            
	            long cart_num = rs.getLong("cart_num");
	            String fk_user_id = rs.getString("user_id");
	            long product_num = rs.getLong("product_num");
	            String product_title = rs.getString("product_title");
	            long main_image = rs.getLong("main_image");
	            long product_price = rs.getLong("product_price");
	            long product_count = rs.getLong("product_count");  // 주문량 
	                        
	            ProductVO pvo = new ProductVO();
	            pvo.setProduct_num(product_num);
	            pvo.setProduct_title(product_title);
	            pvo.setMain_image(main_image);
	            pvo.setProduct_price(product_price);

	            //pvo.setTotalPriceTotalPoint((int)product_count); 
	            
	            CartVO cvo = new CartVO();
	            cvo.setCart_num(cart_num);
	            cvo.setUser_id(fk_user_id);
	            cvo.setProduct_num(product_num);
	            cvo.setProduct_count(product_count);
	            cvo.setProduct_price(product_price);
	            cvo.setMain_image(main_image);
	            
	            cvo.setTotalPriceTotalMileage(product_count);
	            
	            // 위에서 set 해온 prodvo들을 cvo에 set해줌
	            cvo.setPvo(pvo);
	            
	            cartList.add(cvo);
	         }// end of while---------------------------------
	                  
	      } finally {
	         close();
	      }
	      
	      return cartList;
		
	}	// end of public List<CartVO> selectProductCart(String user_id)-------------------

	
	
	// 로그인한 사용자 장바구니에 담긴 주문총액 합계 알아오기
	@Override
	public HashMap<String, String> selectCartSumPricePoint(String user_id) throws SQLException{
		
		HashMap<String, String> sumMap = new HashMap<>();

		   try {
		         conn = ds.getConnection();
		         
		         // DB에서 그냥 계산해줌
		         String sql =  " select nvl(sum(B.product_price *  A.product_count), 0) AS SUMTOTALPRICE "
		         		+ " from tbl_cart A join tbl_product B "
		         		+ " on A.product_num = B.product_num "
		         		+ " where A.user_id = ? ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, user_id);
		         
		         rs = pstmt.executeQuery();
		         rs.next();
		         
		         sumMap.put("SUMTOTALPRICE", rs.getString("SUMTOTALPRICE"));		//Map<String > 이기때문에 getString
		                  
		      } finally {
		         close();
		      }
		      
		
		return sumMap;
	}	// end of public HashMap<String, String> selectCartSumPricePoint(String user_id) ------------

	
	//장바구니 테이블에서 개별 제품을 삭제
	@Override
	public int deleteCart(String cart_num) throws SQLException {

		int n = 0;
		
		   try {
			   conn = ds.getConnection();
		         
		         String sql = " delete from tbl_cart "
		         		+ " where cart_num = ? ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, cart_num);
		         
		         n = pstmt.executeUpdate();
		                  
		      } finally {
		         close();
		      }
		      
		return n;
		
	}
	
	//장바구니 테이블에서 선택 제품을 삭제
	@Override
	public int choiseDeleteCart(String pnumes) throws SQLException {
		int n = 0;
		
		   try {
			   conn = ds.getConnection();
		         
		         String sql = " delete from tbl_cart "
			               + " where product_num in ("+pnumes+") ";
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         n = pstmt.executeUpdate();
		         
		      } finally {
		         close();
		      }
		      
		return n;
		
	}
	
	
	
	//장바구니 테이블에서 특정 제품의 주문량 변경
	@Override
	public int updateCart(String cart_num, String cart_cnt)throws SQLException {

		int n = 0;
		
		   try {
		         conn = ds.getConnection();
		         
		         String sql = " update tbl_cart set product_count = ? "
		         		+ " where cart_num = ? ";
		         
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, cart_cnt);
		         pstmt.setString(2, cart_num);
		         
		         n = pstmt.executeUpdate();
		                  
		      } finally {
		         close();
		      }
		      
		return n;
	}

	
}
