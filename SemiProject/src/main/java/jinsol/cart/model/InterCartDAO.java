package jinsol.cart.model;

import java.sql.SQLException;
import java.util.List;

import sge.member.model.MemberVO;

public interface InterCartDAO {

	public List<CartVO> cartSelectAll() throws SQLException;
	
}
