<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
	
%>    



<jsp:include page="../header.jsp" />    


<style>
	
    #container {
        width: 80%;
        margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
        
    }
    #contents {
        margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
    }

    .mypage_lately_info .btn_board_more{position:absolute; top:7px; right:5px; font-size:12px;}
    .mypage_lately_info .btn_board_more:hover{text-decoration:underline;}

    .mypage_order_info_cont ol li{display:inline-block; width:15%; min-width:66px; padding:0 10px 0 30px; font-size:13px; background:url('../../img/mypage/mypgae_ing_next_bg.png') no-repeat left 50px; text-align:center;}
    .mypage_order_info_cont ol li:first-child { display: none;}

    
    li {
    float: none;
    list-style: none;
    font-size: 14px;
    display: list-item;
    }

	th {
	    font-size: 12px;
	}
	
	.date_check_calendar{position:relative; float:left; width:30.5%;  height: 50px; }
	.date_check_calendar .anniversary {
	width:45%; height: 62%; background:url('<%=ctxPath%>/image/icon_calendar.png') no-repeat right center;
	font-size: 14px; border: 1px solid #d6d6d6; padding-left : 10px;
	}
	em {
		font-size : 18px;
		font-weight: bold;
		color : white;
		background-color: gray;
		height: 100%;
		display: inline-block;
	    float: left;
	    min-width: 100px;
	    height: 31px;
	    color: #ffffff;
		text-align: center;
	}

	
	
	
</style>


<script type="text/javascript">

$(document).ready(function(){
	
	
    
    // === 전체 datepicker 옵션 일괄 설정하기 ===
    // 한번의 설정으로 $("input#fromDate") , $("input#toDate") 의 옵션을 모두 설정할 수 있다.
    $(function() {
        //모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
             dateFormat: 'yy-mm-dd' //Input Display Format 변경
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
        
	});
 
 
	 $('form[name="frmDateSearch"]').submit(function(e){
         $chekcInputDate = $('input[name="wDate[]"]');
         var startDate = ($($chekcInputDate[0]).val()).split('-');
         startDate = new Date(startDate[0], startDate[1], startDate[2]);
         var endDate = ($($chekcInputDate[1]).val()).split('-');
         endDate = new Date(endDate[0], endDate[1], endDate[2]);

         if (startDate > endDate) {
             alert('종료 날짜가 시작 날짜보다 빠릅니다.\n확인 후 검색기간을 다시 선택해주세요.');
             return false;
         }
     });
 
 
 
});



</script>
     
     

    
</head>

<div id="container" style="margin-left: 12%;">
    <div id="contents">
        <!-- 본문 시작 -->

        
        <div class="sub_content">

            <div class="side_cont">
                <div class="sub_menu_box">
                    <h2>마이페이지</h2>
                    <ul class="sub_menu_mypage">
                        <li>쇼핑정보
                            <ul class="sub_depth1">
                                <li><a href="../mypage/order_list.php">- 주문목록/배송조회</a></li>
                                <li><a href="../mypage/cancel_list.php">- 취소/반품/교환 내역</a></li>
                                <li><a href="../mypage/refund_list.php">- 환불/입금 내역</a></li>
                                <li><a href="../mypage/wish_list.php">- 좋아요리스트</a></li>
                            </ul>
                        </li>
                        <li>고객센터
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_qa.php">- 1:1 문의</a></li>
                            </ul>
                        </li>
                        <li>회원정보
                            <ul class="sub_depth1">
                                <li><a href="../mypage/my_page_password.php">- 회원정보 변경</a></li>
                                <li><a href="../mypage/hack_out.php">- 회원 탈퇴</a></li>
                                <li><a href="../mypage/mileage.php">- 마일리지</a></li>
                            </ul>
                        </li>
                        <li>나의 상품문의
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_goods_qa.php">- 나의 상품문의</a></li>
                            </ul>
                        </li>
                        <li>나의 상품후기
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_goods_review.php">- 나의 상품후기</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- //sub_menu_box -->

            </div>
            <!-- //side_cont -->

            <div class="content">
                <div class="mypage_main">

                     <div class="mypage_lately_info">
                        <div class="mypage_zone_tit">
                            <h3>주문목록/배송조회</h3>
                        </div>

                        <div class="date_check_box">
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
                                <div class="date_check_calendar">
                                    <input type="text" id="fromDate" name="wDate[]" class="anniversary" value="" /> ~ <input type="text" id="toDate" name="wDate[]" class="anniversary" value="" />
                                </div>
                                <!-- //date_check_calendar -->

                                <button type="submit" class="btn_date_check"><em>조회</em></button>
                            </form>

                        </div>
                        <!-- //date_check_box -->

                        <div class="mypage_lately_info_cont">

                            <span class="pick_list_num">
                                주문목록 / 배송조회 내역 총 <strong>0</strong> 건
                            </span>

                            <!-- 주문상품 리스트 -->
                            <div class="mypage_table_type">
                                <table>
                                    <colgroup>
                                        <col style="width:15%"> <!-- 날짜/주문번호 -->
                                        <col> <!-- 상품명/옵션 -->
                                        <col style="width:15%"> <!-- 상품금액/수량 -->
                                        <col style="width:15%"> <!-- 주문상태 -->
                                        <col style="width:15%"> <!-- 확인/리뷰 -->
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>날짜/주문번호</th>
                                            <th>상품명/옵션</th>
                                            <th>상품금액/수량</th>
                                            <th>주문상태</th>
                                            <th>
                                                확인/리뷰
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<tr>
                                            <td colspan="6">
                                                <p class="no_data">조회내역이 없습니다.</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                           

                        </div>
                        <!-- //mypage_lately_info_cont -->
                    </div>
                    <!-- //mypage_lately_info -->


                    <div class="pagination">
                        <div class="pagination">
                            <ul></ul>
                        </div>
                    </div>
                    <!-- //pagination -->

                </div>
                <!-- //mypage_cont -->

            </div>
            <!-- //content -->


        </div>
        <!-- //sub_content -->
    </div>
    <!-- //본문 끝 contents -->
</div>
<!-- //container -->

<jsp:include page="../footer.jsp" />    
