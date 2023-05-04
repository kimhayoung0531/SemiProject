<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
	
%>   
    
<jsp:include page="../header.jsp" />    
 
    
<script type="text/javascript">


	


$(document).ready(function(){
	
	var startdate = $.datepicker.formatDate("yy/mm/dd",$( "input#fromDate" ).datepicker( "getDate" ));
    var enddate = $.datepicker.formatDate("yy/mm/dd",$( "input#toDate" ).datepicker( "getDate" ));
    
    
    
    // === 전체 datepicker 옵션 일괄 설정하기 ===
    // 한번의 설정으로 $("input#fromDate") , $("input#toDate") 의 옵션을 모두 설정할 수 있다.
    $(function() {
        //모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
             dateFormat: 'yy/mm/dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
         // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시됨. both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시됨.  
         // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
         // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
         // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
        });

        //input을 datepicker로 선언
        $("input#fromDate").datepicker();                    
        $("input#toDate").datepicker();
        
        //From의 초기값을 오늘 날짜로 설정
        
        
        $('input#fromDate').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
        
        //To의 초기값을 3일후로 설정
        $('input#toDate').datepicker('setDate', 'sysdate'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
    
        if( localStorage.getItem('startdate') != null) {
       
            document.querySelector("#fromDate").value = localStorage.getItem('startdate');
            document.querySelector("#toDate").value = localStorage.getItem('enddate');
        }
        
	
    
    });
	
 	// 검색 기간을 정하는 버튼
 	
 
	$(".date_check_list button").click(function(e){
		
       
        
		$('.date_check_list button').removeClass('on');
        $(this).addClass('on');

        
        switch( $(this).val() ){
        case "sysdate" :
        	$('input#fromDate').datepicker('setDate', 'sysdate');
        	break;
        case "-7D" :
        	$('input#fromDate').datepicker('setDate', '-7D');
        	break;
		case "-15D" :
	    	$('input#fromDate').datepicker('setDate', '-15D');
	    	break;
		case "-1M" :
	    	$('input#fromDate').datepicker('setDate', '-1M');
	    	break;
		case "-3M" :
			$('input#fromDate').datepicker('setDate', '-3M');
			break
		case "-1Y" :
			$('input#fromDate').datepicker('setDate', '-1Y');
			break;
        }
        
        $('input#toDate').datepicker('setDate', 'sysdate');
       
       startdate = $.datepicker.formatDate("yy/mm/dd",$( "input#fromDate" ).datepicker( "getDate" ));
       enddate = $.datepicker.formatDate("yy/mm/dd",$( "input#toDate" ).datepicker( "getDate" ));
	
       
       
        
	});
 
	//$(".date_check_calendar").change
 
 
	 $('form[name="frmDateSearch"]').submit(function(e){ 

		 /* $chekcInputDate = $('input[name="wDate[]"]');
         var startDate = ($($chekcInputDate[0]).val()).split('-');
         startDate = new Date(startDate[0], startDate[1], startDate[2]);
         var endDate = ($($chekcInputDate[1]).val()).split('-');
         endDate = new Date(endDate[0], endDate[1], endDate[2]); */
         
         var startdate = $.datepicker.formatDate("yy/mm/dd",$( "input#fromDate" ).datepicker( "getDate" ));
         var enddate = $.datepicker.formatDate("yy/mm/dd",$( "input#toDate" ).datepicker( "getDate" ));
       
         document.querySelector("#fromDate").value = startdate;
         document.querySelector("#toDate").value = enddate;
         
         localStorage.setItem('startdate', startdate);
         localStorage.setItem('enddate', enddate);
       
         //alert(document.querySelector("#toDate").value);
         //alert(document.querySelector("#fromDate").value);
         
         
         if (startdate > enddate) {
             alert('종료 날짜가 시작 날짜보다 빠릅니다.\n확인 후 검색기간을 다시 선택해주세요.');
             return false;
         }
         else {
        
 				const frm = document.frmDateSearch;
 				frm.action = "<%= ctxPath%>/productinquiry.ban?wDate1="+startdate+"&wDate2="+enddate;
 				frm.method = "get";
 				frm.submit();
 		
         }
	 
	 });
 
 
 
});


</script>
    
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
        
        
        </div>
                <!-- //pjj_side_cont -->
    </div>
    
    <div class="pjj_board_zone_list">
        
        <table class="pjj_board_list_table" style="width: 68.5%" >
			
            <h2>상품문의</h2>     
            <button type="button" class="pjj_btn_write" onclick=""><strong><a href="http://localhost:9090/SemiProject/inquiry.ban">1:1 문의하기</a></strong></button> 

            <div class="pjj_date_check_box">
                <form method="get" name="frmDateSearch">

                    <h3> 조회기간 </h3>
                    <div class="date_check_list">
                        <button type="button" value="sysdate">오늘</button>
                        <button type="button" value="-7D" >7일</button>
                        <button type="button" value="-15D">15일</button>
                        <button type="button" value="-1M">1개월</button>
                        <button type="button" value="-3M">3개월</button>
                        <button type="button" value="-1Y">1년</button>
                    </div>
                 <!-- //date_check_list -->

                    <div class="pjj_date_check_calendar">
                     <input type="text" id="fromDate" name="wDate[] wDate1" class="pjj_anniversary js_datepicker" value="" /> ~ <input type="text" id="toDate" name="wDate[] wDate2" class="pjj_anniversary" value="" />
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
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>답변시간</th>
            </tr>
            </thead>
            <c:if test="${not empty requestScope.inquiryList}">
				<c:forEach var="nvo" items="${requestScope.inquiryList}">
						
						<tr class="pjj_noticeInfo">
			              <td class=inquiry_date>${nvo.inquiry_date}</td>
			              <td>${nvo.inquiry_num}</td>
			              <td><button style="font-weight: 800; font-size:15px">${nvo.inquiry_title}</button></td>
			              <td>${nvo.user_id}</td>
			              <td>${nvo.inquiry_view_count}</td>
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