<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<script>

$(document).ready(function(){
	
			if("${requestScope.searchType}" != "" &&
			   "${requestScope.searchWord}" != "") {
			$("select#searchType").val("${requestScope.searchType}");
			$("input#searchWord").val("${requestScope.searchWord}");
		}
		
		$("select#sizePerPage").val("${requestScope.sizePerPage}");
		
		$("input#searchWord").bind("keyup", (e) => {
			if(e.keyCode == 13) { 
				goSearch();
			}
		});

		$("select#sizePerPage").bind("change", function(){
			goSearch();
		});
		
		
		
	});// end of $(document).ready(function(){}----------
		
			
	function goSearch() {
		const frm = document.pjj_searchFrm;	
		
		
		frm.action = "notice.ban";
		frm.method = "get";
		frm.submit();
	}			

	function goNotice() {
		
		
		
	}
	
	
</script>


<div id="pjj_container">
    <div id="pjj_contents">
        <div class="pjj_sub_content">
            <div class="pjj_side_cont">
                <div class="pjj_sub_menu_box">
                    <h2>고객센터</h2>
                    <ul class="pjj_sub_menu">
                        <li style="font-size: 15pt;"><a href="http://localhost:9090/SemiProject/notice.ban" class="pjj_active">공지사항</a></li>
                        <li style="font-size: 15pt;"><a href="http://localhost:9090/SemiProject/productinquiry.ban">상품문의</a></li>
                    </ul>
                </div>
                <!-- //pjj_sub_menu_box -->
                
                <div class="pjj_info_box">
                    <dl>
                        <dt>고객상담센터</dt>
                        <dd>
                            <strong class="pjj_info_num">1588-9384</strong><br>
                            <a href="mailto:help@.com" class="info_mail_link">help@.com</a>
                            <p>오전 10:00~오후 17:00</p>
                        </dd>
                    </dl>
                    <dl>
                        <dt>은행계좌 안내</dt>
                        <dd>
                            기업은행 : 12017675204029<br>
                            국민은행 : 59510101603493<br>
                            농협 : 3557868939333<br>
                            [예금주 : 주식회사]
                        </dd>
                    </dl>
                </div>
                <!-- //pjj_info_box -->
                
            </div>
            <!-- //pjj_side_cont -->
        </div>



        <div class="pjj_board_zone_list">
            <table class="pjj_board_list_table">
                <div class="pjj_board_zone_tit">
                    <h2>공지사항</h2>
                </div>
                <colgroup>
                    <col style="width:6%">
                    <col style="width:10%">
                    <col style="width:37%;">
                    <col style="width:12%">
                    <col style="width:7%">
                    <col style="width:15%">
                    <col style="width:6%">
                </colgroup>
                
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>말머리</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>작성자</th>
                        <th>조회</th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:if test="${not empty requestScope.noticeList}">
				<c:forEach var="nvo" items="${requestScope.noticeList}">
						
						<tr class="pjj_noticeInfo">
						
			              <td class="notice_num">${nvo.notice_num}</td>
			              <td>${nvo.notice_head}</td>
			              <td><button class="admin_notice" style="font-size: 13pt" onclick="goNotice();">${nvo.notice_title}</button></td>
			              <td>${nvo.notice_date}</td>
			              <td>${nvo.notice_writer}</td>
			              <td>${nvo.notice_viewcount}</td>
			           	
			           </tr>
			            
				</c:forEach>
			</c:if>
			
			<c:if test="${empty requestScope.noticeList}">
				<tr>
	              <td colspan="6" style="font-size: 20pt; color:red;">작성된 공지사항이 없습니다.</td>
           		</tr>
			</c:if>
                </tbody>
            </table>
			<!-- //pjj_board_list_table -->
			
		    
		    <nav class="my-5">
		        <div class="pjj_pagination" style='display:flex; width:100%;'>
		          <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
		        </div>
    		</nav>
		      
            <div class="pjj_search">
                <div class="pjj_search_box">
                
                    <form name="pjj_searchFrm">
	                    <select id="searchType" name="searchType" style="font-size: 15px;">
							<option value="">선택하세요</option>
							<option value="notice_title">제목</option>
							<option value="notice_content">내용</option>
							<option value="notice_writer">작성자</option>
						</select>
						<input type="text" id="searchWord" name="searchWord" />
						
						<input type="text" style="display: none;">  
						
						<button type="button" class="btn btn-secondary" style="margin-left: 10px; margin-right: 30px;" onclick="goSearch();">검색</button>
						
						<span style="color: red; font-weight: bold; font-size: 12pt;">공지사항 개수</span>
				     	 <select id="sizePerPage" name="sizePerPage" style="font-size: 12pt">
					         <option value="3">3개</option>
					         <option value="2">2개</option>
					         <option value="1">1개</option>
				      	 </select>

                    </form>
                    
                </div>
            </div> 
              
        </div>
    </div>
</div>











<jsp:include page="../footer.jsp" />   