package pjujin.noticelist.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class NoticeDAO implements InterNoticeDAO{
	
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if(rs != null)    {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close(); conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 생성자
	public NoticeDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");      // lookup(이름) 이 중요한 것이다. web.xml 부분의 이름, context.xml 이름과 모두 같아야 한다. 이 것이 배치 서술자인 web.xml 로 가고 context.xml 로 간다. 
		    
			}catch (NamingException e) {
	             e.printStackTrace();
	        }catch (Exception e) {
	             e.printStackTrace();
	       }
	}	
	
	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 공지사항에 대한 총페이지 알아오기 
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException{
		
		int totalPage = 0;	
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/?) "
	                  + " from tbl_notice ";
	                  
	         String colname = paraMap.get("searchType");
	         String searchWord = paraMap.get("searchWord");
	         
	         
	         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
	            sql += " and " + colname + " like '%'|| ? || '%' " ;
	            
	         }
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, paraMap.get("sizePerPage"));
	         
	         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
	            pstmt.setString(2, searchWord);
	         }
	         
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         
	         totalPage = rs.getInt(1);
			
		} finally {
			close();
		}
		
		return totalPage;
		
	}// end of public int getTotalPage(Map<String, String> paraMap) throws SQLException-----

	
	
	// 페이징 처리를 한 모든 공지사항 또는 검색한 공지사항 목록 보여주기
   @Override
   public List<NoticeVO> selectPagingNotice(Map<String, String> paraMap) throws SQLException{
      
      List<NoticeVO> noticeList = new ArrayList<>();      
      try {
         conn = ds.getConnection();
         
         String sql = " SELECT notice_num, notice_head, notice_title, notice_date, notice_writer, notice_viewcount "
               + " FROM "
               + " ( "
               + " select rownum AS RNO, notice_num, notice_head, notice_title, notice_date, notice_writer, notice_viewcount "
               + " from "
               + "    ( "
               + "    select notice_num, notice_head, notice_title, notice_date, notice_writer, notice_viewcount "
               + "    from tbl_notice ";
               
         
         String colname = paraMap.get("searchType");
         String searchWord = paraMap.get("searchWord");
         

         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
            sql += " and " + colname + " like '%'|| ? || '%' " ;
            // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!! 이다.
            // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!! 
         }
         
         sql += " order by notice_date desc "
            + "    ) V "
            + " ) T "
            + " WHERE RNO between ? and ? ";
            
         pstmt = conn.prepareStatement(sql);
         
         int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo")); // 조회하고자하는 페이지번호
         int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage")); // 한페이지당 보여줄 행의개수
         
         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
            pstmt.setString(1, searchWord);
            pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage -1));
            pstmt.setInt(3, (currentShowPageNo * sizePerPage)); 
         }
         
         else {
            pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage -1));
            pstmt.setInt(2, (currentShowPageNo * sizePerPage));
         }
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            NoticeVO notice = new NoticeVO();
            
            notice.setNotice_num(rs.getInt(1));
            notice.setNotice_head(rs.getString(2));
            notice.setNotice_title(rs.getString(3));
            notice.setNotice_date(rs.getString(4));
            notice.setNotice_writer(rs.getString(5));
            notice.setNotice_viewcount(rs.getInt(6));
            
            System.out.println(notice);
            noticeList.add(notice);
            
         }// end of while(rs.next())----------------
       
      
      } finally {
         close();
      }
      
      return noticeList;
      
      
   }// end of public List<NoticeVO> selectPagingNotice(Map<String, String> paraMap) throws SQLException-----

   // 페이징 처리를 위한 검색이 있는 또는 검색이 없는 상품문의에 대한 총페이지 알아오기
   @Override
   public int inquiryPage(Map<String, String> paraMap) throws SQLException{
		
	   int totalPage = 0;	
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/?) "
	                  + " from tbl_inquiry ";
	                  
	         String colname = paraMap.get("searchType");
	         String searchWord = paraMap.get("searchWord");
	         
	         
	         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
	            sql += " and " + colname + " like '%'|| ? || '%' " ;
	            
	         }
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, paraMap.get("sizePerPage"));
	         
	         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
	            pstmt.setString(2, searchWord);
	         }
	         
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         
	         totalPage = rs.getInt(1);
			
		} finally {
			close();
		}
		
		return totalPage;
	   
   }

   // 페이징 처리를 한 모든 상품문의 또는 검색한 상품문의 목록 보여주기
   @Override
   public List<NoticeVO> selectinquiryPaging(Map<String, String> paraMap) throws SQLException{
	   
	   List<NoticeVO> inquiryList = new ArrayList<>();      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " SELECT inquiry_num, user_id, product_num, inquiry_title, inquiry_text, inquiry_date, inquiry_answer_time, inquiry_view_count "
	               + " FROM "
	               + " ( "
	               + " select rownum AS RNO, inquiry_num, user_id, product_num, inquiry_title, inquiry_text, inquiry_date, inquiry_answer_time, inquiry_view_count "
	               + " from "
	               + "    ( "
	               + "    select inquiry_num, user_id, product_num, inquiry_title, inquiry_text, inquiry_date, inquiry_answer_time, inquiry_view_count "
	               + "    from tbl_inquiry ";
	               
	         
	         String colname = paraMap.get("searchType");
	         String searchWord = paraMap.get("searchWord");
	         

	         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
	            sql += " and " + colname + " like '%'|| ? || '%' " ;
	            // 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!! 이다.
	            // 위치홀더(?)로 들어오는 것은 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다.!!! 
	         }
	         
	         sql += " order by inquiry_date desc "
	            + "    ) V "
	            + " ) T "
	            + " WHERE RNO between ? and ? ";
	            
	         pstmt = conn.prepareStatement(sql);
	         
	         int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo")); // 조회하고자하는 페이지번호
	         int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage")); // 한페이지당 보여줄 행의개수
	         
	         if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
	            pstmt.setString(1, searchWord);
	            pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage -1));
	            pstmt.setInt(3, (currentShowPageNo * sizePerPage)); 
	         }
	         
	         else {
	            pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage -1));
	            pstmt.setInt(2, (currentShowPageNo * sizePerPage));
	         }
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            NoticeVO inquiry = new NoticeVO();
	            
	            inquiry.setNotice_num(rs.getInt(1));
	            inquiry.setNotice_head(rs.getString(2));
	            inquiry.setNotice_title(rs.getString(3));
	            inquiry.setNotice_date(rs.getString(4));
	            inquiry.setNotice_writer(rs.getString(5));
	            inquiry.setNotice_viewcount(rs.getInt(6));
	            
	            System.out.println(inquiry);
	            inquiryList.add(inquiry);
	            
	         }// end of while(rs.next())----------------
	       
	      
	      } finally {
	         close();
	      }
	      
	      return inquiryList;
	   
   }

	
	
}
