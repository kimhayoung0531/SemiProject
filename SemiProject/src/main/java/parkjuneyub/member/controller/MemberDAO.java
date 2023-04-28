package parkjuneyub.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import sge.member.model.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class MemberDAO implements InterMemberDAO {
	
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
	
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
	
	public MemberDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("semi_oracle");
			aes = new AES256(SecretMyKey.KEY);
		}
		catch(NamingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용자 아이디를 가지고 주문을 위한 사용자의 정보를 가져오는 메소드
	@Override
	public MemberVO getUserInfo(String userid) throws SQLException {
		
		MemberVO mvo = new MemberVO();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select * from tbl_member where user_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			rs.next();
			mvo.setUser_id(rs.getString("user_id"));
			mvo.setUser_name(rs.getString("user_name"));
			mvo.setEmail(aes.decrypt(rs.getString( "email")));	
			mvo.setAddress(rs.getString("address"));
			mvo.setMobile(aes.decrypt(rs.getString("mobile")));
			mvo.setTelephone(aes.decrypt(rs.getString("telephone")));
			mvo.setMileage(rs.getInt("mileage"));
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return mvo;
	}
	
}
