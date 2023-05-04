package parkjuneyub.product.model;

import java.sql.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import sge.admin.controller.CategoryVO;



public class ProductDAO implements InterProductDAO  {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private void close() {
		try {
			if(rs != null) {
				rs.close();
				rs=null;
			}
			
			if(pstmt != null) {
				pstmt.close();
				pstmt=null;
			}
			
			if(conn != null) {
				conn.close();
				conn=null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ProductDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
			
		}
		catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public ProductVO showItemInfo(String product_num) throws SQLException {
		
		conn = ds.getConnection();
		ProductVO pvo = new ProductVO();
		
		try {
			String sql = " select * from tbl_product A join tbl_addimage B on A.product_num= B.product_num join tbl_category C on A.category_num = C. category_num where A.product_num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  product_num);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			pvo.setProduct_num(rs.getLong(1));
			pvo.setCategory_num(rs.getLong(2));
			pvo.setProduct_title(rs.getString(3));
			pvo.setMain_image(rs.getString(4));
			pvo.setProduct_price(rs.getLong(5));
			pvo.setProduct_detail(rs.getString(6));
			pvo.setProduct_inventory(rs.getLong("product_inventory"));
			pvo.setProduct_date(rs.getString("product_date"));
			pvo.setSale_count(rs.getInt("sale_count"));
			
			AddImageVO aivo = new AddImageVO();
			aivo.setImage_name(rs.getString("image_name"));
			pvo.setAivo(aivo);
			
			parkjuneyub.product.model.CategoryVO cvo = new parkjuneyub.product.model.CategoryVO();
			
			cvo.setCategory_name(rs.getString("category_name"));
			pvo.setCvo(cvo);
			
		}
		finally {
			close();
		}
		
		
		return pvo;
	}

	@Override
	public List<CartVO> getCartList(String userid) throws SQLException {
		
		List<CartVO> cartList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = " select cart_num, A.product_num as product_num, product_count, cart_date, product_price "+
					" from "+
					" ( "+
					" select cart_num, product_num, product_count, cart_date "+
					" from tbl_cart "+
					" where user_id = ? "+
					" ) A "+
					" join "+
					" (select product_num, product_price from tbl_product ) B "+
					" on A.product_num = B.product_num ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CartVO cvo = new CartVO();
				ProductVO pvo = new ProductVO();
				pvo.setProduct_num(rs.getLong("product_num"));
				pvo.setProduct_price(rs.getLong("product_price"));;
				cvo.setCart_num(rs.getLong("cart_num"));
				cvo.setProduct_count(rs.getLong("product_count"));
				cvo.setCart_date(rs.getString("cart_date"));
				
				
				cartList.add(cvo);
			}
		} finally {
			close();
		}
		return cartList;
		
	} // end of public List<CartVO> getCartList(String userid)

	@Override
	public int getSeq_tbl_order() throws SQLException {
		
		int seq = 0;

		try {
			conn = ds.getConnection();
			String sql = " select seq_tbl_order.nextval as seq from dual ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			seq = rs.getInt("seq");
		}
		finally {
			close();
		}
		
		return seq;
	}

	@Override
	public int orderAdd(HashMap<String, Object> paraMap) throws SQLException {
		
		int isSuccess = 0;
		int n1 = 0, n2 = 0, n3= 0, n4 = 0, n5 = 0;
		
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
			// 1. 주문 테이블에 데이터 넣기
			String sql = " insert into tbl_order( order_num, user_id, order_price_total, order_mileage_total, order_date ) "
					+ " values( ?, ?, ?, ?, sysdate) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)paraMap.get("oderNum") );
			pstmt.setString(2, (String)paraMap.get("userid") );
			pstmt.setLong(3, Long.parseLong((String)paraMap.get("finalTotalPrice")) );
			pstmt.setLong(4, Long.parseLong((String)paraMap.get("useMileage")) );
			
			n1 = pstmt.executeUpdate();
			//System.out.println("n1 " +  n1);
			// 2. 주문 상세 테이블에 주문 id 와 그 이외에 데이터 넣기
			if(n1 == 1) {
				String[] productNum_arr = (String[]) paraMap.get("productNum_arr"); 
				String[] productCnt_arr = (String[]) paraMap.get("productCnt_arr"); 
				String[] productPrice_arr = (String[]) paraMap.get("productPrice_arr"); 
				
				int cnt = 0;
				
				for(int i = 0; i < productNum_arr.length; i++) {
					sql = " insert into tbl_order_detail(order_details_num, order_num, product_num, order_name, "
							+ "order_quantity, product_selling_price, recipient_name, recipient_mobile, "
							+ "recipient_telephone, forwarded_message, orderer_mobile, "
							+ "delivery_status, payment_time, use_mileage, postcode, address, detailAddress, extraAddress) "
							+ " values(seq_order_detail.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', sysdate, ?, ?, ?,?,? )";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, (String)paraMap.get("oderNum"));
					pstmt.setLong(2, Long.parseLong(productNum_arr[i]));
					pstmt.setString(3, (String)paraMap.get("order_name"));
					pstmt.setLong(4, Long.parseLong(productCnt_arr[i]));
					pstmt.setLong(5, Long.parseLong(productPrice_arr[i]));
					pstmt.setString(6, (String)paraMap.get("receive_name"));
					pstmt.setString(7, (String)paraMap.get("receive_mobile"));
					pstmt.setString(8, (String)paraMap.get("receive_phone"));
					pstmt.setString(9, (String)paraMap.get("receive_last_say"));
					pstmt.setString(10, (String)paraMap.get("order_mobile"));
					pstmt.setLong(11, Long.parseLong((String)paraMap.get("useMileage")));
					
					pstmt.setString(12, (String)paraMap.get("postcode"));
					pstmt.setString(13, (String)paraMap.get("address"));
					pstmt.setString(14, (String)paraMap.get("detailAddress"));
					pstmt.setString(15, (String)paraMap.get("extraAddress"));
					
					pstmt.executeUpdate();
					cnt++;		
				}
				
				if(cnt == productNum_arr.length) {
					n2 = 1;
				}
			}
			//System.out.println("n2 " +  n2);
			// 3. 제품 테이블 재고량 업데이트하기
			if(n2 == 1) {
				String[] productNum_arr = (String[]) paraMap.get("productNum_arr"); 
				String[] productCnt_arr = (String[]) paraMap.get("productCnt_arr"); 
				
				int cnt = 0;
				for(int i = 0; i < productNum_arr.length; i++) {
					sql = " update tbl_product set product_inventory = (product_inventory - ?) "
							+ "where product_num = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setLong(1, Long.parseLong(productCnt_arr[i]));
					pstmt.setLong(2, Long.parseLong(productNum_arr[i]));
					
					pstmt.executeUpdate();

					sql = " update tbl_product set sale_count = (sale_count + ?) "
							+ "where product_num = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(productCnt_arr[i]));
					pstmt.setLong(2, Long.parseLong(productNum_arr[i]));
					
					pstmt.executeUpdate();
					cnt++;
				}
				if(cnt == productNum_arr.length) {
					n3 = 1;
				}
			}
			//System.out.println("n3 " +  n3);
			// 4. cartno가 null이 아니면 장바구니 테이블에서 해당 행들을 삭제하기
			if(n3 == 1) {
				if(paraMap.get("carno_arr") != null & n3 == 1) {
					
					String cartno_join = String.join("','", (String[])paraMap.get("cartno_arr"));
					
					cartno_join = "'"+cartno_join+"'";
					sql = " delete from tbl_cart where cartno in (" + cartno_join +") ";
					pstmt = conn.prepareStatement(sql);
					n4 = pstmt.executeUpdate();
				}
				if(paraMap.get("carno_arr") == null & n3 == 1) {
					n4 = 1;
				}
			}
			//System.out.println("n4 " +  n4);
			if(n4 > 0) {
				sql = " update tbl_member set mileage = mileage - ? + ? "
						+ " where user_id = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setLong(1, Long.parseLong((String)paraMap.get("useMileage")));
				pstmt.setLong(2, Long.parseLong((String)paraMap.get("save_mileage")));
				pstmt.setString(3, (String)paraMap.get("userid"));
				
				n5 = pstmt.executeUpdate();
			}
			
			if((n1 * n2 * n3 * n4 * n5) > 0) {
				conn.commit();
				conn.setAutoCommit(true);
				
				//System.out.println("주문 완료");
				isSuccess = 1;
			}
			
			
			// 5. 회원테이블에 마일리지 업데이트하기
		} 
		catch(SQLException e) {
			e.printStackTrace();
			conn.rollback();
			conn.setAutoCommit(true);
			isSuccess = 0;
		}
		finally {
			close();
		}
				
				
		//System.out.println(isSuccess);
		return isSuccess;
	}

	@Override
	public int updateLikeProduct(String user_id, String product_num) throws SQLException {
		int n = 0;
		try {
			conn = ds.getConnection();
			String sql = " select count(*) from tbl_product_like where user_id = ? and product_num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setLong(2, Long.parseLong(product_num));
			
			rs = pstmt.executeQuery();
			rs.next();
			n = rs.getInt(1);
			if(n == 0) {
				sql = " insert into tbl_product_like(user_id, product_num) values(?, ?) ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setLong(2, Long.parseLong(product_num));
				n = pstmt.executeUpdate();
			}
			else {
				sql = " delete from tbl_product_like where user_id = ? and product_num = ?  ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setLong(2, Long.parseLong(product_num));
				n = pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		
		return n;
	}

	@Override
	public int checkLikeList(String user_id, String product_num) throws SQLException {
		int n = 0;
		try {
			conn = ds.getConnection();
			String sql = " select count(*) from tbl_product_like where user_id = ? and product_num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setLong(2, Long.parseLong(product_num));
			
			rs = pstmt.executeQuery();
			rs.next();
			n = rs.getInt(1);
			
		} finally {
			close();
		}
		return n;
	}

	//카테고리 리스트를 조회해오는 메소드
	@Override
	public List<CategoryVO> selectCategoryList() throws SQLException{
		
		List<CategoryVO> categoryList = new ArrayList<>();
			
		try {
			conn = ds.getConnection();

			String sql = " select category_num, category_name "
					   + " from tbl_category "
					   + " order by category_num asc ";
			
		    pstmt = conn.prepareStatement(sql);
		    
			rs = pstmt.executeQuery();

			while(rs.next()) {
				CategoryVO cvo = new CategoryVO();
				cvo.setCategory_num(rs.getInt(1));
				cvo.setCategory_name(rs.getString(2));
				
				categoryList.add(cvo);
			}// end of while

		} finally {
			close();
		}
		return categoryList;
	}
	
	//상품번호 채번하기
	@Override
	public int getPnumOfProduct() throws SQLException {
		int pnum = 0;
		
		try {
			conn = ds.getConnection();

			String sql = " select seq_product_product_num.nextval AS PNUM  "
					   + " from dual ";
					 
			
		    pstmt = conn.prepareStatement(sql);
		    
			rs = pstmt.executeQuery();

			rs.next();
			pnum = rs.getInt(1);
		} finally {
			close();
		}
		return pnum;
	}//end of public int getPnumOfProduct()
    
	// 상품 테이블에 상품 추가하기
	@Override
	public int productInsert(ProductVO pvo) throws SQLException {
		
		
		 int result = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " insert into tbl_product(product_num, category_num, product_title, main_image, product_price, product_detail, sale_count, product_inventory) " +  
	                      " values(?,?,?,?,?,?,?,?) ";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setLong(1, pvo.getProduct_num());
	         pstmt.setLong(2, pvo.getCategory_num());
	         pstmt.setString(3, pvo.getProduct_title());    
	         pstmt.setString(4,  pvo.getMain_image()); 
	         pstmt.setLong(5,  pvo.getProduct_price());    
	         pstmt.setString(6, pvo.getProduct_detail()); 
	         pstmt.setLong(7, pvo.getSale_count());
	         pstmt.setLong(8, pvo.getProduct_inventory());
 
	         result = pstmt.executeUpdate();

	         
	      } finally {
	      
	         close();
	      }
	      
	      return result;

	}

	@Override
	public List<ProductVO> getPvoListByPnum(String[] pnum_join) throws SQLException {
		List<ProductVO> pvoList = new ArrayList<>();

		for(int i = 0; i<pnum_join.length; i++) {
			try {
				conn = ds.getConnection();

		         String sql = " select product_num, product_title, main_image "
		         		+ " from tbl_product where product_num = ? ";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, pnum_join[i]);
		         rs = pstmt.executeQuery();

		         ProductVO pvo = new ProductVO();
		         rs.next();
		         pvo.setProduct_num(rs.getLong(1));
		         pvo.setProduct_title(rs.getString(2));
		         pvo.setMain_image((rs.getString(3)));

		         pvoList.add(pvo);

			} finally {
				close();
			}
		}


		return pvoList;
	}




	
	
}
