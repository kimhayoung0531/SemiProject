package sge.member.model;

import java.sql.SQLException;

public interface InterMemberDAO {
	
	// 회원가입을 진행시켜주는 메소드
	int registermember(MemberVO member) throws SQLException;

}
