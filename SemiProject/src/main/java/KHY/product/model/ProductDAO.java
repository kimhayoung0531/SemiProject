package KHY.product.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import KHY.model.ReviewVO;
import sge.member.model.MemberVO;


//

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
			String sql = " select * from tbl_product where product_num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  product_num);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			pvo.setProduct_num(rs.getLong(1));
			pvo.setCategory_num(rs.getLong(2));
			pvo.setProduct_title(rs.getString(3));
			pvo.setMain_image(rs.getLong(4));
			pvo.setProduct_price(rs.getLong(5));
			pvo.setProduct_detail(rs.getString(6));
			pvo.setProduct_inventory(rs.getLong("product_inventory"));
			pvo.setProduct_date(rs.getString(8));
			pvo.setSale_count(rs.getInt(9));
			
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
			System.out.println("n1 " +  n1);
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
			System.out.println("n2 " +  n2);
			// 3. 제품 테이블 재고량 업데이트하기
			if(n2 == 1) {
				String[] productNum_arr = (String[]) paraMap.get("productNum_arr"); 
				String[] productCnt_arr = (String[]) paraMap.get("productCnt_arr"); 
				
				int cnt = 0;
				for(int i = 0; i < productNum_arr.length; i++) {
					sql = " update tbl_product set product_inventory =  product_inventory - ? "
							+ "where product_num = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setLong(1, Long.parseLong(productCnt_arr[i]));
					pstmt.setLong(2, Long.parseLong(productNum_arr[i]));
					
					pstmt.executeUpdate();
					cnt++;
				}
				if(cnt == productNum_arr.length) {
					n3 = 1;
				}
			}
			System.out.println("n3 " +  n3);
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
			System.out.println("n4 " +  n4);
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
				
				System.out.println("주문 완료");
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
				
				
		System.out.println(isSuccess);
		return isSuccess;
	}

	// 주문한 상품 내역 조회하기
	@Override
	public List<OrderDeatailVO> selectOrderList(String user_id) throws SQLException {
		
		List<OrderDeatailVO> orderList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = "select order_details_num, A.order_num as order_num, order_date, B.product_num as product_num, order_name, order_quantity, product_selling_price, product_main_image,\n"+
						"        recipient_name, recipient_mobile, recipient_telephone, forwarded_message, delivery_status,\n"+
						"        orderer_mobile, payment_time, use_mileage, product_title\n"+
						"       \n"+
						"from\n"+
						"(\n"+
						"select order_num, order_date\n"+
						"from tbl_order \n"+
						"where user_id = ? AND sysdate-30 <= order_date AND order_date < sysdate+1 "+
						") A \n"+
						"join \n"+
						"(select order_details_num, order_num, product_num, order_name, order_quantity, product_selling_price, product_main_image,\n"+
						"        recipient_name, recipient_mobile, recipient_telephone, forwarded_message, delivery_status,\n"+
						"        orderer_mobile, payment_time, use_mileage\n"+
						"from tbl_order_detail ) B\n"+
						"on A.order_num = B.order_num\n"+
						"join\n"+
						"(select product_num, product_title from tbl_product) C\n"+
						"on B.product_num = C.product_num ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderDeatailVO odvo = new OrderDeatailVO();
				odvo.setOrder_details_num(rs.getLong("order_details_num"));
				odvo.setOrder_name(rs.getString("order_name"));
				odvo.setOrder_quantity(rs.getInt("order_quantity"));
				odvo.setProduct_selling_price(rs.getInt("product_selling_price"));
				odvo.setProduct_main_image(rs.getString("product_main_image"));
				odvo.setRecipient_name(rs.getString("recipient_name"));
				odvo.setRecipient_mobile(rs.getString("recipient_mobile"));
				odvo.setRecipient_telephone(rs.getString("recipient_telephone"));
				odvo.setForwarded_message(rs.getString("forwarded_message"));
				odvo.setDelivery_status(rs.getString("delivery_status"));
				odvo.setOrderer_mobile(rs.getString("orderer_mobile"));
				odvo.setPayment_time(rs.getString("payment_time"));
				odvo.setUse_mileage(rs.getInt("use_mileage"));
				
				
				OrderVO ovo = new OrderVO();
				ovo.setOrder_num(rs.getString("order_num"));
				ovo.setOrder_date( (rs.getString("order_date")).substring(0, 11) );
				odvo.setOvo(ovo);
				
				ProductVO pvo = new ProductVO();
				pvo.setProduct_title(rs.getString("product_title"));
				pvo.setProduct_num(rs.getLong("product_num"));
				odvo.setPvo(pvo);
				
				orderList.add(odvo);
				
				
			}
		} finally {
			close();
		}
		return orderList;
	}

	//페이징 처리를 위한 회원의 주문에 대한 총페이지 알아오기
	@Override
	public int getTotalPageOrder(Map<String, String> paraMap) throws SQLException {
		
		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			

			String sql = "select ceil( count(*) / 10 ) "+
						"from\n"+
						"(\n"+
						"select order_num, order_date\n"+
						"from tbl_order \n"+
						"where user_id = ? AND ? <= order_date AND order_date < to_date(?) + 1 "+
						") A \n"+
						"join \n"+
						"(select order_details_num, order_num, product_num, order_name, order_quantity, product_selling_price, product_main_image,\n"+
						"        recipient_name, recipient_mobile, recipient_telephone, forwarded_message, delivery_status,\n"+
						"        orderer_mobile, payment_time, use_mileage\n"+
						"from tbl_order_detail ) B\n"+
						"on A.order_num = B.order_num\n"+
						"join\n"+
						"(select product_num, product_title from tbl_product) C\n"+
						"on B.product_num = C.product_num ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setString(2, paraMap.get("startdate"));
			pstmt.setString(3, paraMap.get("enddate"));
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPage = rs.getInt(1);
			
			
			
		}  finally {
			close();
		}
		
		return totalPage;
		
	}//end of public int getTotalPageOrder(Map<String, String> paraMap) throws SQLException 

	//페이징 처리를 한 회원의 주문 목록 알아오기
	@Override
	public List<OrderDeatailVO> selectPagingOrderList(Map<String, String> paraMap) throws SQLException {
		
		List<OrderDeatailVO> orderList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = "select order_details_num, A.order_num as order_num, order_date, B.product_num as product_num, order_name, order_quantity, product_selling_price, product_main_image,\n"+
						"        recipient_name, recipient_mobile, recipient_telephone, forwarded_message, delivery_status,\n"+
						"        orderer_mobile, payment_time, use_mileage, product_title\n"+
						"       \n"+
						"from\n"+
						"(\n"+
						"select rownum AS RNO, order_num, order_date\n"+
						"from tbl_order \n"+
						"where user_id = ? AND ? <= order_date AND order_date < to_date(?) + 1 "+
						") A \n"+
						"join \n"+
						"(select order_details_num, order_num, product_num, order_name, order_quantity, product_selling_price, product_main_image,\n"+
						"        recipient_name, recipient_mobile, recipient_telephone, forwarded_message, delivery_status,\n"+
						"        orderer_mobile, payment_time, use_mileage\n"+
						"from tbl_order_detail ) B\n"+
						"on A.order_num = B.order_num\n"+
						"join\n"+
						"(select product_num, product_title from tbl_product) C\n"+
						"on B.product_num = C.product_num " +
						"WHERE RNO between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNO = Integer.parseInt(paraMap.get("currentShowPageNO")); // 조회하고자하는 페이지번호
			
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setString(2, paraMap.get("startdate"));
			pstmt.setString(3, paraMap.get("enddate"));
			pstmt.setInt(4, (currentShowPageNO * 10) - (10-1));
			pstmt.setInt(5, (currentShowPageNO * 10));
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderDeatailVO odvo = new OrderDeatailVO();
				odvo.setOrder_details_num(rs.getLong("order_details_num"));
				odvo.setOrder_name(rs.getString("order_name"));
				odvo.setOrder_quantity(rs.getInt("order_quantity"));
				odvo.setProduct_selling_price(rs.getInt("product_selling_price"));
				odvo.setProduct_main_image(rs.getString("product_main_image"));
				odvo.setRecipient_name(rs.getString("recipient_name"));
				odvo.setRecipient_mobile(rs.getString("recipient_mobile"));
				odvo.setRecipient_telephone(rs.getString("recipient_telephone"));
				odvo.setForwarded_message(rs.getString("forwarded_message"));
				odvo.setDelivery_status(rs.getString("delivery_status"));
				odvo.setOrderer_mobile(rs.getString("orderer_mobile"));
				odvo.setPayment_time(rs.getString("payment_time"));
				odvo.setUse_mileage(rs.getInt("use_mileage"));
				
				
				OrderVO ovo = new OrderVO();
				ovo.setOrder_num(rs.getString("order_num"));
				ovo.setOrder_date( (rs.getString("order_date")).substring(0, 11) );
				odvo.setOvo(ovo);
				
				ProductVO pvo = new ProductVO();
				pvo.setProduct_title(rs.getString("product_title"));
				pvo.setProduct_num(rs.getLong("product_num"));
				odvo.setPvo(pvo);
				
				orderList.add(odvo);
				
				
			}
		} finally {
			close();
		}
		return orderList;
	}

	//조회 기간 내에 주문 내역 수 알아오기 
	@Override
	public int selectOrderListCount(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select count(*)"+
						"       \n"+
						"from\n"+
						"(\n"+
						"select order_num, order_date\n"+
						"from tbl_order \n"+
						"where user_id = ? AND ? <= order_date AND order_date < to_date(?) + 1 "+
						") A \n"+
						"join \n"+
						"(select order_details_num, order_num, product_num, order_name, order_quantity, product_selling_price, product_main_image,\n"+
						"        recipient_name, recipient_mobile, recipient_telephone, forwarded_message, delivery_status,\n"+
						"        orderer_mobile, payment_time, use_mileage\n"+
						"from tbl_order_detail ) B\n"+
						"on A.order_num = B.order_num\n"+
						"join\n"+
						"(select product_num, product_title from tbl_product) C\n"+
						"on B.product_num = C.product_num ";
						
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setString(2, paraMap.get("startdate"));
			pstmt.setString(3, paraMap.get("enddate"));
			
			
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			n = rs.getInt(1);
			
		} finally {
			close();
		}
		return n;
	}// end of public int selectOrderListCount(Map<String, String> paraMap) throws SQLException
	

	//페이징 처리를 위한 회원의 상품 좋아요에 대한 총페이지 알아오기
	@Override
	public int getTotalPageLike(Map<String, String> paraMap) throws SQLException {
		
		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			

			String sql = "select ceil( count(*) / 10 ) "+
					"from\n"+
					"(\n"+
					"select user_id, product_num\n"+
					"from tbl_product_like\n"+
					"where user_id = ?\n"+
					") A \n"+
					"join \n"+
					"(select product_num, product_title, main_image, product_price, product_detail\n"+
					"from tbl_product ) B\n"+
					"on A.product_num = B.product_num\n" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("user_id"));
			
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPage = rs.getInt(1);
			
			
			
		}  finally {
			close();
		}
		
		return totalPage;
	}// end of public int getTotalPageLike(Map<String, String> paraMap) throws SQLException

	
	//페이징 처리를 한 회원의 좋아요 목록 알아오기
	@Override
	public List<ProductVO> selectPagingLikeList(Map<String, String> paraMap) throws SQLException {
		
		List<ProductVO> likeList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = "select A.user_id as user_id, A.product_num as product_num, product_title, main_image, product_price, product_detail, product_inventory \n"+
					"from\n"+
					"(\n"+
					"select rownum AS RNO, user_id, product_num\n"+
					"from tbl_product_like\n"+
					"where user_id = ?\n"+
					") A \n"+
					"join \n"+
					"(select product_num, product_title, main_image, product_price, product_detail, product_inventory \n"+
					"from tbl_product ) B\n"+
					"on A.product_num = B.product_num\n"+
					"WHERE RNO between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNO = Integer.parseInt(paraMap.get("currentShowPageNO")); // 조회하고자하는 페이지번호
			
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setInt(2, (currentShowPageNO * 10) - (10-1));
			pstmt.setInt(3, (currentShowPageNO * 10));
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO pvo = new ProductVO();
				pvo.setProduct_num(rs.getLong("product_num"));
				pvo.setProduct_title(rs.getString("product_title"));
				pvo.setMain_image(rs.getLong("main_image"));
				pvo.setProduct_price(rs.getLong("product_price"));
				pvo.setProduct_detail(rs.getString("product_detail"));
				pvo.setProduct_inventory(rs.getLong("product_inventory"));
				
				
				MemberVO mvo = new MemberVO();
				mvo.setUser_id(rs.getString("user_id"));
				pvo.setMvo(mvo);
				
				
				likeList.add(pvo);
				
				
			}
		} finally {
			close();
		}
		return likeList;
	}// end of public List<ProductVO> selectPagingLikeList(Map<String, String> paraMap) throws SQLException

	//좋아요 한 총 내역 수 알아오기
	@Override
	public int selectLikeListCount(Map<String, String> paraMap) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select count(*)"+
						"from\n"+
						"(\n"+
						"select rownum AS RNO, user_id, product_num\n"+
						"from tbl_product_like\n"+
						"where user_id = ?\n"+
						") A \n"+
						"join \n"+
						"(select product_num, product_title, main_image, product_price, product_detail\n"+
						"from tbl_product ) B\n"+
						"on A.product_num = B.product_num\n" ;
						
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("user_id"));
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			n = rs.getInt(1);
			
		} finally {
			close();
		}
		return n;
	}// end of public int selectLikeListCount(Map<String, String> paraMap) throws SQLException

	//페이징 처리를 위한 회원의 상품 후기에 대한 총페이지 알아오기
	@Override
	public int getTotalPageReview(Map<String, String> paraMap) throws SQLException {
		
		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			

			String sql = "select ceil( count(*) / 10 ) "+
						"from\n"+
						"(\n"+
						"select purchase_review_id, product_num, review_content, review_date\n"+
						"from tbl_purchase_review\n"+
						"where userid = ? \n"+
						") A \n"+
						"join \n"+
						"(select product_num, product_title, main_image\n"+
						"from tbl_product ) B\n"+
						"on A.product_num = B.product_num";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("user_id"));
			
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPage = rs.getInt(1);
			
			
			
		}  finally {
			close();
		}
		
		return totalPage;
		
	} // end of public int getTotalPageReview(Map<String, String> paraMap) throws SQLException

	//페이징 처리를 한 회원의 리뷰 목록 알아오기
	@Override
	public List<ReviewVO> selectPagingReviewList(Map<String, String> paraMap) throws SQLException {
		
		List<ReviewVO> reviewList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = "select purchase_review_id, A.product_num as product_num, review_content, \n"+
					"    review_date, product_title, main_image \n"+
					"from\n"+
					"(\n"+
					"select rownum AS RNO, purchase_review_id, product_num, review_content, review_date\n"+
					"from tbl_purchase_review\n"+
					"where userid = ? \n"+
					") A \n"+
					"join \n"+
					"(select product_num, product_title, main_image \n"+
					"from tbl_product ) B\n"+
					"on A.product_num = B.product_num " +
					"WHERE RNO between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNO = Integer.parseInt(paraMap.get("currentShowPageNO")); // 조회하고자하는 페이지번호
			
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setInt(2, (currentShowPageNO * 10) - (10-1));
			pstmt.setInt(3, (currentShowPageNO * 10));
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				
				
				ReviewVO rvo = new ReviewVO();
				rvo.setPurchase_review_id(rs.getInt("purchase_review_id"));
				rvo.setProduct_num(rs.getLong("product_num"));
				rvo.setReview_content(rs.getString("review_content"));
				rvo.setReview_date(rs.getString("review_date"));
				
				
				ProductVO pvo = new ProductVO();
				pvo.setProduct_title(rs.getString("product_title"));
				pvo.setMain_image(rs.getLong("main_image"));
				rvo.setPvo(pvo);
				
				
				reviewList.add(rvo);
				
				
			}
		} finally {
			close();
		}
		return reviewList;
		
	}// end of public List<ReviewVO> selectPagingReviewList(Map<String, String> paraMap) throws SQLException
	
}
