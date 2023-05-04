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
	
	th > span {
	    font-size: 15px;
	}
	
	td:last-child {
    	text-align: left;
	}
	
	.member_cont {
    margin: 62px auto;
    padding: 70px 60px;
    border: 0px solid #dbdbdb;
	}

	.btn_center_box button {
    	margin: 0px 20px 0px 20px;
	}
	
	.btn_post_search {
    margin-left: 10px;
    width: 85px;
    height: 20px;
    font-size: 11px;
    border-radius: 5px;
    border: 1px solid #cccccc;
    color: #3e3d3c;
    cursor: pointer;
	}
	
	table#tblMemberRegister td input {
    font-size: 14px;
    color: #000;
    border-radius: 5px;
    padding: 0 10px;
    outline: none;
    border: 1px solid #dcdcdc;
    line-height: 31px;
	}	
	
	.address_input {
    float: left;
    width: 80%;
	}
	
	.error {
	display: none;
	color: red;
	}
	
	.member_birthday select {
	font-size: 14px;
    color: #000;
    padding: 0 10px;
    outline: none;
    line-height: 31px;
	}
	
</style>

<script type="text/javascript">
    $(document).ready(function () {
    	
    	$("div.text_warning").hide();
    	
        $('.btn_cancle').click(function () {
        	window.location.href = 'mypage.ban';
        });
        
        
        $("input#findPassword").blur( (e) => {
			if( $(e.target).val().trim() == ""){
				
				$(e.target).parent().find(".text_warning").show();
				$(e.target).focus();
			}
			else{
				$(e.target).parent().find(".text_warning").hide();	
			}
		 }); 
		

		
		$("input#findPassword").bind("keydown",function(e){
			if(e.keyCode == 13){// !!keycode 아니고 keyCode이다 암호입력란에 enter을 했을 경우
				goLogin();
			}
		});
        
		$("button#goToRegis").click(function(){
			
			const frm = document.formFind;
			frm.action = "<%= ctxPath%>/mypagememberDelete.ban";
			frm.method = "post";
			frm.submit();
			
		});
       


    }); // end of documnet
    
</script>


    
</head>
<input style="display: none;" name='user_id' value='${sessionScope.loginuser.user_id}' />
<div id="container" style="margin-left: 12%;">
    <div id="contents">
        <!-- 본문 시작 -->

        <div class="location_wrap">
            <div class="location_cont">
                <em><a href="#" class="local_home">HOME</a> > 마이페이지 > 내정보수정</em>
            </div>
        </div>
        <!-- //location_wrap -->

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

					<div class="my_page_password">
					
					<div class="mypage_zone_tit">
					<h2>회원탈퇴</h2>
					</div>
					
					<p><strong>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해 주세요.</strong></p>
					
					<form id="formFind" name="formFind">
						<div class="id_pw_cont">
						    <dl>
						        <dt>아이디</dt>
	
						        <dd><strong>${sessionScope.loginuser.user_id}</strong></dd>
	
						    </dl>
						    <dl>
						        <dt>비밀번호</dt>
						        <dd>
						            <div class="member_warning">
						                <input type="password" name="findPassword" id="findPassword"/>
						                <div class="text_warning">
						                    비밀번호를 입력해주세요.
						            	</div>
	
						            </div>
						        </dd>
						    </dl>
						</div>
						<div class="btn_center_box">
						    <button type="button" id="btnReset" class="btn_cancle">취소</button>
						    <button type="button" id="goToRegis" class="btn_register">인증하기</button>
						</div>
					</form>
					
					</div>
					<!-- //my_page_password -->
					
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
