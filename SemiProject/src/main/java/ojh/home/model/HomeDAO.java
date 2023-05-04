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
	
	
	// 카테고리 베스트 상품 데이터 출력
	@Override
	public List<ProductVO> getCatBestItemBysalecount() throws SQLException {
		
		List pvoCatBestList = new ArrayList<>();
		 
		try {
			conn = ds.getConnection();
			String sql = " select Row_number() over(order by sale_count desc) AS Rank "
					   + " , sale_count "
					   + " , product_num "
					   + " , product_title "
					   + " , product_detail "
					   + " , product_price "
					   + " , category_num "
					   + " , main_image "
					   + " from tbl_product "
					   + " where sale_count >= 500 ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setSale_count(rs.getInt("sale_count"));
				pvo.setProduct_num(Long.parseLong(rs.getString("product_num")));
				pvo.setProduct_title(rs.getString("product_title"));
				pvo.setProduct_detail(rs.getString("product_detail"));
				pvo.setProduct_price(Long.parseLong(rs.getString("product_price")));
				pvo.setCategory_num(rs.getLong("category_num"));
				pvo.setMain_image(rs.getString("main_image"));
				
				
				pvoCatBestList.add(pvo);
				
				
				
			}
			
		} finally {
			close();
		}
		
		return pvoCatBestList;
		
		
	}
	
	// 메인페이지 베스트 이벤트 데이터 출력
		@Override
		public List<ProductVO> getBestItemBysalecount() throws SQLException {
			
			List pvohomeList = new ArrayList<>();
			 
			try {
				conn = ds.getConnection();
				String sql = " select * "
						+ " from( select Row_number() over(order by sale_count desc) AS sale_rank "
						+ "					    , sale_count "
						+ "					    , product_title "
						+ "					    , product_detail "
						+ "					    , product_price "
						+ "                     , product_num "
						+ "					    , category_num "
						+ "                     , main_image "
						+ "					   from tbl_product ) "
						+ " where sale_rank <= 8 ";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ProductVO pvo = new ProductVO();
					pvo.setSale_count(rs.getInt("sale_count"));
					pvo.setProduct_num(Long.parseLong(rs.getString("product_num")));
					pvo.setProduct_title(rs.getString("product_title"));
					pvo.setProduct_detail(rs.getString("product_detail"));
					pvo.setProduct_price(Long.parseLong(rs.getString("product_price")));
					pvo.setCategory_num(rs.getLong("category_num"));
					pvo.setMain_image(rs.getString("main_image"));
					
					pvohomeList.add(pvo);
					
					
					
				}
				
			} finally {
				close();
			}
			
			return pvohomeList;
			
		} // end of public List<ProductVO> getBestItemBysalecount()
		
		// 메인페이지 신상품 이벤트 데이터 출력
		@Override
		public List<ProductVO> getNewProduct() throws SQLException {
			
			List pvoNewList = new ArrayList<>();
			
			try {
				conn = ds.getConnection();
				
				String sql = " select * "
						   + " from( select Row_number() over(order by product_date desc) AS Date_rank "
						   + "                      , product_date  "
						   + "                      , product_num "
						   + "					    , product_title "
						   + "					    , product_detail "
						   + "					    , product_price "
						   + "					    , category_num "
						   + "                      , main_image "
						   + "					   from tbl_product ) "
						   + " where Date_rank  <= 8 ";
							
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					ProductVO pvo = new ProductVO();
					
					pvo.setProduct_date(rs.getString("product_date"));
					pvo.setProduct_num(Long.parseLong(rs.getString("product_num")));
					pvo.setProduct_title(rs.getString("product_title"));
					pvo.setProduct_detail(rs.getString("product_detail"));
					pvo.setProduct_price(Long.parseLong(rs.getString("product_price")));
					pvo.setCategory_num(rs.getLong("category_num"));
					pvo.setMain_image(rs.getString("main_image"));
					
					pvoNewList.add(pvo);
					
					System.out.println(rs.getString("product_date"));
					System.out.println(Long.parseLong(rs.getString("product_num")));
					
				}
				
				
			} finally {
				close();
			}
			
			return pvoNewList;
		}
		
		// 메인페이지 초코파티 이벤트 데이터 출력
		@Override
		public List<ProductVO> getChocoProduct() throws SQLException {
			
			List pvoChocoList = new ArrayList<>();
			
			try {
				conn = ds.getConnection();

				String sql = " select * "
						   + " from tbl_product "
						   + " where product_title like '%초코%' "
						   + " order by product_num desc ";	
				
				pstmt = conn.prepareStatement(sql);
				
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
				
					pvoChocoList.add(pvo);
				
				}
				
				
				
			} finally {
				close();
			}
			
			return pvoChocoList;
		}
	
}
