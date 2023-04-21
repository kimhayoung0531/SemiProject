package sge.member.model;

import java.io.UnsupportedEncodingException;


import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
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
					ds = (DataSource) envContext.lookup("jdbc/semi_oracle");
					
					aes = new AES256(SecretMyKey.KEY);
				
				} catch (NamingException e) {
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					
					e.printStackTrace();
				}
			}
		
	
	@Override
	public int registermember(MemberVO member) throws SQLException {
	
		System.out.println("~~~~~~ 요기요2 ~~~~~"); 
	 	
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_member(user_id, pwd, user_name, email, mobile, telephone, post_code, address, detailAddress, extraAddress, gender, birthday) "
					   + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			
		
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, Sha256.encrypt(member.getPwd())); //암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, aes.encrypt(member.getEmail())); // 이메일을 AES256알고리즘으로 양방향 암호화 시킨다
			pstmt.setString(5, aes.encrypt(member.getMobile())); // 휴대폰번호을 AES256알고리즘으로 양방향 암호화 시킨다
			pstmt.setString(6, aes.encrypt(member.getTelephone())); // 휴대폰번호을 AES256알고리즘으로 양방향 암호화 시킨다.
			pstmt.setString(7, member.getPost_code());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getDetailAddress());
			pstmt.setString(10, member.getExtraAddress());
			pstmt.setString(11, member.getGender());
			pstmt.setString(12, member.getBirthday());
			
			result = pstmt.executeUpdate();
			
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {	
			close();
		}
		return result;
	}// end of public int registermember(MemberVO member)
	
	// 아이디가 중복된건지 아닌지 확인해주는 메소드
	@Override
	public Boolean idDoubleCheck(String user_id) throws SQLException {
		 Boolean idExist = false;
		 try {
			conn = ds.getConnection();
			
			String sql = " select * " +
					     " from tbl_member " +
						 " where user_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			idExist = rs.next();
			
		} finally {
			close();
		}
	
		return idExist;
	}// end of idDoubleCheck

}
