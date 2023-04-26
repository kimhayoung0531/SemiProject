package sge.member.model;

import java.io.UnsupportedEncodingException;

import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Map;

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
	
	// 이메일이 중복된건지 아닌지 확인해주는 메소드 
	@Override
	public Boolean emailDoubleCheck(String email)throws SQLException {
		
		Boolean emailExist = false;
		 try {
			conn = ds.getConnection();
			
			String sql = " select * " +
					     " from tbl_member " +
						 " where email = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aes.encrypt(email));
			
			rs = pstmt.executeQuery();
			emailExist = rs.next();
			
		}catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
			
		}finally {
			close();
		}
		return emailExist;
	}// end of public Boolean emailDoubleCheck(String email)

	
	//로그인을 위해 가입된 회원인지 알아보는 메소드 
	@Override
	public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException {
		MemberVO member = null;
		
		try {
			
			conn = ds.getConnection();
			

			String sql = " SELECT user_id, user_name, email, telephone, mobile, post_code, address, detailAddress, extraAddress, gender,"+
					     " birthday, mileage, registerday, pwdchangegap, NVL(lastlogingap, trunc( months_between(sysdate, registerday)) ) AS lastlogingap "+
						 " FROM "+
						 " ( "+
						 "		select user_id, user_name, email, telephone, mobile, post_code, address, detailAddress, extraAddress, gender, birthday "+
						 "		,mileage, to_char(registerday, 'yyyy-mm-dd') AS registerday "+
						 "      ,trunc( months_between(sysdate, lastPwdChange) ) AS pwdchangegap "+
						 "		from tbl_member "+
						 "      where status = 1 and user_id = ? and pwd = ?"+
						 " ) M "+
						 " CROSS JOIN "+
						 " ( " +
						 "		select trunc( months_between(sysdate, max(login_date)) ) AS lastlogingap "+
						 "      from tbl_login_history "+
						 "      where fk_user_id = ? "+
						 " ) H ";

			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")));
			pstmt.setString(3, paraMap.get("user_id"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 member = new MemberVO();
				 
				 member.setUser_id(rs.getString(1));
				 member.setUser_name(rs.getString(2));
				 member.setEmail( aes.decrypt(rs.getString(3)) );  // 복호화 
				 member.setTelephone(aes.decrypt(rs.getString(4))); // 복호화 
				 member.setMobile( aes.decrypt(rs.getString(5)) ); // 복호화 
				 member.setPost_code(rs.getString(6));
				 member.setAddress(rs.getString(7));
				 member.setDetailAddress(rs.getString(8));
				 member.setExtraAddress(rs.getString(9));
				 member.setGender(rs.getString(10));
				 member.setBirthday(rs.getString(11));
				 member.setMileage(rs.getInt(12));
				 member.setRegisterday(rs.getString(13));
				 
				 if( rs.getInt(14) >= 3 ) { 
						 
						member.setRequirePwdChange(true); // 로그인시 암호를 변경해라는 alert 를 띄우도록 할때 사용한다.  
				 }
				 
				 if ( rs.getInt(15) >= 12 ) { // 또는 rs.getInt("LASTLOGINGAP")
					 // 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정  
					 
					 member.setIdle(1); 
					 
					 // === tbl_member 테이블의 idle 컬럼의 값을 1 로 변경하기 === //
					 sql = " update tbl_member set idle = 1 "
					 	 + " where user_id = ? "; 
					 
					 pstmt = conn.prepareStatement(sql); 
					 pstmt.setString(1, paraMap.get("user_id"));
					 
					 pstmt.executeUpdate();
				 }
				 
				 // === tbl_loginhistory(로그인기록) 테이블에 insert 하기 === // 
				 if(member.getIdle() != 0) {
				
					 sql = " insert into tbl_login_history(fk_user_id, clientip) "
					 	 + " values(?, ?) "; 
					 
					 pstmt = conn.prepareStatement(sql);
					 pstmt.setString(1, paraMap.get("user_id"));
					 pstmt.setString(2, paraMap.get("clientip"));
					 
					 pstmt.executeUpdate();
				 }
				
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return member;
		
	}// end of  end of public MemberVO selectOneMember(Map<String, String> paraMap)

	//아이디를 찾아주는 메소드
	@Override
	public String findUserId(Map<String, String> paraMap) throws SQLException{
		
		String user_id = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select user_id " +
						 " from tbl_member " +
						 " where status = 1 and user_name = ? and email = ? ";
			
			pstmt = conn.prepareStatement(sql);	
			
			pstmt.setString(1, paraMap.get("user_name"));
			pstmt.setString(2, aes.encrypt(paraMap.get("email")));
		
			
			rs = pstmt.executeQuery();
			//행이없으면 false;
			
			if(rs.next()) {
				user_id = rs.getString(1);
			}
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		
		return user_id;
	}

	
	// 비밀번호를 찾기위해서 있는 회원인지 알아보는 메소드
	@Override
	public boolean isUserExist(Map<String, String> paraMap) throws SQLException {
		boolean isExist = false; 
		
		try {
			conn = ds.getConnection();
			String sql = " select user_id " +
						 " from tbl_member " +
						 " where status = 1 and user_id = ? and email = ? ";
			
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, paraMap.get("user_id"));
			pstmt.setString(2, aes.encrypt(paraMap.get("email")) );
			
			rs = pstmt.executeQuery();
			
			isExist = rs.next(); // 그러한 아이디의 존재유무
			
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}

		return isExist;
	}

	

}
