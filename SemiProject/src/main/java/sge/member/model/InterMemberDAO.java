package sge.member.model;

import java.sql.SQLException;

public interface InterMemberDAO {
	
	// 회원가입을 진행시켜주는 메소드
	int registermember(MemberVO member) throws SQLException;

	// 아이디가 중복된건지 아닌지 확인해주는 메소드
	Boolean idDoubleCheck(String user_id)throws SQLException;

	// 이메일이 중복된건지 아닌지 확인해주는 메소드 
	Boolean emailDoubleCheck(String email)throws SQLException;

}
