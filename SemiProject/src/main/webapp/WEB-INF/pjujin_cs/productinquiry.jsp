<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:include page="../header.jsp" />    
    
   
    
<div id="pjj_container">
                <div id="pjj_contents">
                    <div class="pjj_sub_content">
                        <div class="pjj_side_cont">
                            <div class="pjj_sub_menu_box">
                                <h2>고객센터</h2>
                                <ul class="pjj_sub_menu">
                                    <li style="font-size: 15pt;"><a href="http://localhost:9090/SemiProject/notice.ban" >공지사항</a></li>        
                        			<li style="font-size: 15pt;"><a href="http://localhost:9090/SemiProject/productinquiry.ban" class="pjj_active">상품문의</a></li>
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
        
        <script type="text/javascript">
        // 메뉴 선택
        $('.sub_menu li > a[href*="' + document.location.pathname + '"]').addClass('active');
        </script>
        </div>
                <!-- //pjj_side_cont -->
    </div>
    
    <div class="pjj_board_zone_list">
        
        <table class="pjj_board_list_table" style="width: 68.5%" >
			
            <h2>상품문의</h2>     
            <button type="button" class="pjj_btn_write" onclick=""> <strong><a href="http://localhost:9090/SemiProject/inquiry.ban">1:1 문의하기</a></strong></button> 

            <div class="pjj_date_check_box">
                <form name="frmSearch" method="get" action="list.php">
                    <input type="hidden" name="bdId" value="goodsqa">
                    <input type="hidden" name="memNo" value="">
                    <input type="hidden" name="noheader" value="">
                    <input type="hidden" name="mypageFl" value="">

                    <h3> 조회기간 </h3>
                    <div class="date_check_list" data-target-name="rangDate[]">
                        <button type="button" data-value="0">오늘</button>
                        <button type="button" data-value="7">7일</button>
                        <button type="button" data-value="15">15일</button>
                        <button type="button" data-value="30">1개월</button>
                        <button type="button" data-value="90">3개월</button>
                        <button type="button" data-value="365">1년</button>
                    </div>
                    <!-- //date_check_list -->
                    <div class="pjj_date_check_calendar">
                        <input type="text" id="picker2" name="rangDate[]" class="pjj_anniversary js_datepicker" value="" ><input type="image" src="./image/icon_calendar.png"> ~ <input type="text" name="rangDate[]" class="pjj_anniversary js_datepicker" value=""><input type="image" src="./image/icon_calendar.png">
                        <button type="submit" class="pjj_btn_date_check"><em>조회</em></button>
                    </div>
                    <!-- //date_check_calendar -->
                </form>
            </div>


            <colgroup>
                <col style="width:10%"> <!-- 문의날짜 -->
                <col style="width:15%"> <!-- 카테고리 -->
                <col><!-- 제목 -->
                <col style="width:10%">  <!-- 작성자 -->
                <col style="width:10%"> <!-- 문의상태 -->
                <col style="width:10%"> <!-- 답변시간 -->
            </colgroup>
            
            <thead>
            <tr>
                <th>문의날짜</th>
                <th>카테고리</th>
                <th>제목</th>
                <th>작성자</th>
                <th>문의상태</th>
                <th>답변시간</th>
            </tr>
            </thead>
            <c:if test="${not empty requestScope.inquiryList}">
				<c:forEach var="nvo" items="${requestScope.inquiryList}">
						
						<tr class="pjj_noticeInfo">
						
			              <td class=inquiry_date>${nvo.inquiry_date}</td>
			              <td>${nvo.notice_head}</td>
			              <td><button >${nvo.inquiry_title}</button></td>
			              <td>${nvo.user_id}</td>
			              <td>${nvo.inquiry_state}</td>
			              <td>${nvo.inquiry_answer_time}</td>
			           	
			           </tr>
			            
				</c:forEach>
			</c:if>
			
			<c:if test="${empty requestScope.inquiryList}">
				<tr>
	              <td colspan="6" style="font-size: 20pt; color:red;">작성된 상품문의가 없습니다.</td>
           		</tr>
			</c:if>
                </tbody>
        </table>
    
			<nav class="my-5">
		        <div class="pjj_pagination" style='display:flex; width:100%;'>
		          <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
		        </div>
		        
    		</nav>

    </div>

 </div>
 
</div>    
            
<jsp:include page="../footer.jsp" />            