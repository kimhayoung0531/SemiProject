
package ojh.home.model;

import java.sql.*;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import parkjuneyub.product.model.ProductVO;


public class HomeDAO implements InterHomeDAO {
		
	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	   
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	 	private void close() {
	      try {
	         if(rs != null)    {rs.close(); rs=null;}
	         if(pstmt != null) {pstmt.close(); pstmt=null;}
	         if(conn != null)  {conn.close(); conn=null;}
	      } catch(SQLException e) {
	         e.printStackTrace();
	      }
	   }
	   
	 // 생성자
	   public HomeDAO() {
	      try {
	         Context initContext = new InitialContext();
	          Context envContext  = (Context)initContext.lookup("java:/comp/env");
	          ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
	          
	      } catch(NamingException e) {
	         e.printStackTrace();
	      }  
	      
	   }
	
	// 카테고리 상품 가져오기
	@Override
	public List<ProductVO> getProductInfo(String category_num) throws SQLException {
		
		List pvoList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			String sql = " select * "
					   + " from tbl_product "
					   + " where category_num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, Long.parseLong(category_num));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO pvo = new ProductVO();
				
				pvo.setProduct_num(rs.getLong("product_num"));
				pvo.setCategory_num(rs.getLong("category_num"));
				pvo.setProduct_title(rs.getString("product_title"));
				pvo.setMain_image(rs.getString("main_image"));
				pvo.setProduct_price(rs.getLong("product_price"));
				pvo.setProduct_detail(rs.getString("product_detail"));
				pvo.setProduct_inventory(rs.getLong("product_inventory"));
				pvo.setProduct_date(rs.getString("product_date"));
				pvo.setSale_count(rs.getInt("sale_count"));
			
				pvoList.add(pvo);
			
			}
				
			
		} finally {
		  close();	
		} 
		
		return pvoList;
	}

	/*
	 * @Override public List<ProductVO> getBestItemBysalecount() throws SQLException
	 * {
	 * 
	 * List pvohomeList = new ArrayList<>();
	 * 
	 * try { conn = ds.getConnection(); String sql =
	 * " select Rank() over (Order by product_title desc) Rank " +
	 * " from tbl_product " + " where Rank<=6 ";
	 * 
	 * } finally { close(); } return pvohomeList;
	 * 
	 * 
	 * 
	 * } // end of public List<ProductVO> getBestItemBysalecount()
	 */
	   
	
}

