package parkjuneyub.product.model;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

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
	
}
