package sge.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO {
	private DataSource ds; // DataSource ds는 아파치톰켓이 제공하는 DBCP (DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	private void close() {

		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 생성자
			public MemberDAO() {
				try {
					Context initContext = new InitialContext();
					Context envContext = (Context) initContext.lookup("java:/comp/env");
					ds = (DataSource) envContext.lookup("jdbc/myoracle");
					
					aes = new AES256(SecretMyKey.KEY);
				
				} catch (NamingException e) {
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					
					e.printStackTrace();
				}
			}
		
	
	@Override
	public int registermember(MemberVO member) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_member(userid, pwd, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday) "
					   + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			
		
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, Sha256.encrypt(member.getPwd())); //암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, aes.encrypt(member.getEmail())); // 이메일을 AES256알고리즘으로 양방향 암호화 시킨다
			pstmt.setString(5, aes.encrypt(member.getMobile())); // 휴대폰번호을 AES256알고리즘으로 양방향 암호화 시킨다
			pstmt.setString(6, member.getPost_code());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getDetailAddress());
			pstmt.setString(9, member.getExtraAddress());
			pstmt.setString(10, member.getGender());
			pstmt.setString(11, member.getBirthday());
			
			result = pstmt.executeUpdate();
			
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
			
		}finally {	
			close();
		}
		return result;
	}

}
