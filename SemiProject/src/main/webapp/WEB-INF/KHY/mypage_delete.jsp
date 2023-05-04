<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
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

	.pagination li a, .pagination li span {
    display: block;
    padding: 0 !important;
    height: 30px;
    width: 50px;
    color: #888;
    font-size: 11px;
    line-height: 30px;
    margin-top: 15px;
}

.btn_center_box button {
    margin: 0 2px 0 3px;
}
	
	
</style>


<script type="text/javascript">


$("button.btn_claim_ok").click(function(){
	
	const frm = document.formFind;
	frm.action = "<%= ctxPath%>/mypagememberDeleteEnd.ban";
	frm.method = "post";
	frm.submit();
	
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
                                <li><a href="<%= ctxPath%>/mypageOrderList.ban">- 주문목록/배송조회</a></li>
                                <li><a href="<%= ctxPath%>/mypageLikeList.ban">- 좋아요리스트</a></li>
                            </ul>
                        </li>
                        <li>회원정보
                            <ul class="sub_depth1">
                                <li><a href="<%= ctxPath%>/mypageMemberChangePwdcheck.ban">- 회원정보 변경</a></li>
                                <li><a href="<%= ctxPath%>/mypagememberDeletePwdcheck.ban">- 회원 탈퇴</a></li>
                                <li><a href="<%= ctxPath%>/mypageMileageList.ban">- 마일리지</a></li>
                            </ul>
                        </li>
                        <li>나의 상품후기
                            <ul class="sub_depth1">
                                <li><a href="<%= ctxPath%>/mypageReview.ban">- 나의 상품후기</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- //sub_menu_box -->

            </div>
            <!-- //side_cont -->

            <div class="content">
						    <div class="mypage_cont">
						        <form id="formHackOut" name="formHackOut" action="../mypage/my_page_ps.php" method="post">
						            <input type="hidden" name="mode" value="hackOut"/>
						            <input type="hidden" name="snsType" value=""/>
						            <div class="hack_out">
						
						                <div class="mypage_zone_tit">
						                    <h2>회원탈퇴</h2>
						                </div>
						
						                <div class="mypage_unregister">
						                    <div class="mypage_zone_tit">
						                        <h3>01.회원탈퇴 안내</h3>
						                    </div>
						
						                    <div class="unregister_info">
						                        주식회사 브래드 앤 피트 탈퇴안내<br />
						<br />
						회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.<br />
						불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br />
						<br />
						<br />
						※ 회원 탈퇴 시 유의 사항 ※<br />
						<br />
						- 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객 정보 보호 정책에 따라 관리됩니다.<br />
						- 회원 탈퇴 시, 등급 및 보유 적립금/예치금, 쿠폰 등 모든 혜택이 즉시 소멸되며, 재가입 후 이전 회원 정보 및 등급, 포인트는 이관되지 않습니다. <br />
						- 탈퇴 후 30일 이후부터 재가입이 가능합니다. <br />
						<br />
						<br />
						  감사합니다.
                    </div>
                    <!-- //unregister_info -->

                    <div class="mypage_zone_tit">
                        <h3>02.회원탈퇴 하기</h3>
                    </div>

                    <div class="mypage_table_type">
                        <table class="table_left">
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:85%;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">탈퇴사유</th>
                                <td>
                                    <div class="form_element">
                                        <ul class="hack_out_list"><li><input type="checkbox" id="reasonCd01003001" name="reasonCd[]" class="checkbox" value="01003001"><label for="reasonCd01003001" class="check-s">고객서비스(상담,포장 등) 불만</label></li><li><input type="checkbox" id="reasonCd01003002" name="reasonCd[]" class="checkbox" value="01003002"><label for="reasonCd01003002" class="check-s">배송불만</label></li><li><input type="checkbox" id="reasonCd01003003" name="reasonCd[]" class="checkbox" value="01003003"><label for="reasonCd01003003" class="check-s">교환/환불/반품 불만</label></li><li><input type="checkbox" id="reasonCd01003004" name="reasonCd[]" class="checkbox" value="01003004"><label for="reasonCd01003004" class="check-s">방문 빈도가 낮음</label></li><li><input type="checkbox" id="reasonCd01003005" name="reasonCd[]" class="checkbox" value="01003005"><label for="reasonCd01003005" class="check-s">상품가격 불만</label></li><li><input type="checkbox" id="reasonCd01003006" name="reasonCd[]" class="checkbox" value="01003006"><label for="reasonCd01003006" class="check-s">개인 정보유출 우려</label></li><li><input type="checkbox" id="reasonCd01003007" name="reasonCd[]" class="checkbox" value="01003007"><label for="reasonCd01003007" class="check-s">쇼핑몰의 신뢰도 불만</label></li></ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">남기실 말씀</th>
                                <td><textarea cols="30" rows="5"  name="reasonDesc"></textarea></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //mypage_unregister -->

            </div>
            <!-- //hack_out -->

          
            <div class="btn_center_box">
						    <button type="button" id="btnReset" class="btn_cancle" onclick="location.href='<%= ctxPath%>/mypage.ban'" >이전으로</button>
						    <button type="button" id="goToRegis" class="btn_register btn_claim_ok" onclick="location.href='<%= ctxPath%>/mypagememberDeleteEnd.ban'">탈퇴</button>
			</div>
        </form>
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
