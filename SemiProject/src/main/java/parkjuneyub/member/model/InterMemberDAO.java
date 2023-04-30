package parkjuneyub.member.model;

import java.sql.SQLException;

import sge.member.model.MemberVO;

public interface InterMemberDAO {
	
	// 유저아이디로 회원정보 가져오기
	MemberVO getUserInfo(String userid) throws SQLException ;
	
}
