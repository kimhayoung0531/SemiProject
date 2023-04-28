package ojh.home.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class HomeDAO implements InterHomeDAO {
		
	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	   private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	
}
