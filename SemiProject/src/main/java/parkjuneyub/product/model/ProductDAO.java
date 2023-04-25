package parkjuneyub.product.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jinsol.cart.model.CartVO;

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
			ds = (DataSource)envContext.lookup("semi_oracle");
			
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
	
}
