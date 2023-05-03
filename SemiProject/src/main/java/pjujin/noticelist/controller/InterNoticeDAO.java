package pjujin.noticelist.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterNoticeDAO {

	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 공지사항에 대한 총페이지 알아오기 
	int getTotalPage(Map<String, String> paraMap) throws SQLException;
	
	// 페이징 처리를 한 모든 공지사항 또는 검색한 공지사항 목록 보여주기
	List<NoticeVO> selectPagingNotice(Map<String, String> paraMap) throws SQLException;

	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 상품문의에 대한 총페이지 알아오기
	int inquiryPage(Map<String, String> paraMap) throws SQLException;

	// 페이징 처리를 한 모든 상품문의 또는 검색한 상품문의 목록 보여주기
	List<NoticeVO> selectinquiryPaging(Map<String, String> paraMap) throws SQLException;

	// 상품문의 페이지에 문의 등록하기
	int inquiryInsert(NoticeVO nvo) throws SQLException;

	


	

	
	
	
	
	
	
	
	
}
