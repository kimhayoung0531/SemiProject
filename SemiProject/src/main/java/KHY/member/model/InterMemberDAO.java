package KHY.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {
	
	// 회원가입을 진행시켜주는 메소드
	int registermember(MemberVO member) throws SQLException;

	// 아이디가 중복된건지 아닌지 확인해주는 메소드
	Boolean idDoubleCheck(String user_id)throws SQLException;

	// 이메일이 중복된건지 아닌지 확인해주는 메소드 
	Boolean emailDoubleCheck(String email)throws SQLException;
	
	//로그인을 위해 가입된 회원인지 알아보는 메소드 
	MemberVO selectOneMember(Map<String, String> paraMap)throws SQLException;

	// 회원의 아이디를 찾아주는 메소드 
	String findUserId(Map<String, String> paraMap)throws SQLException;

	// 마이페이지 회원정보 변경시 패스워드 확인 메소드
	boolean mypageMemberPwdCheck(Map<String, String> paraMap) throws SQLException;

	
	

}
