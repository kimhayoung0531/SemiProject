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
    	margin: 20px;
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
   
   
   //중복 확인 버튼을 눌렀는지 안눌렀지 여부확인을 위한 FLAG 
   
   let b_flag_emailDuplicate_click = true;
   
   let b_flag_zipcodeSearch_click = false;
   
   ////////////////////////////////////////////
   
   $(document).ready(function(){
   
	   $("input#email").bind("change", function(){
		   b_flag_emailDuplicate_click = false;
				
		});		 
	   
	  
	   
	      $("span.error").hide();
	      
	      
	      
	      
	       
	       //비밀번호 유효성 검사 
	       $("input#pwd").blur( (e) => {
	            
	          const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
	          
	          const bool = regExp.test($(e.target).val());
	          
	          if(!bool){
	             //암호가 정규표현식에 위배된 경우
	             $("table#tblMemberRegister :input").prop("disabled",true);
	             $(e.target).prop("disabled",false);
	            
	             $(e.target).parent().find("span.error").show();
	             $(e.target).focus();
	          }
	          else{
	             //암호가 정규표현식에 맞는 경우
	             $("table#tblMemberRegister :input").prop("disabled",false);
	             $(e.target).parent().find("span.error").hide();
	          }
	       });
	       
	       // 비밀번호 체크
	       $("input#pwdcheck").blur( (e) => {
	            
	            if($("input#pwd").val() != $(e.target).val() ){
	               
	              $(e.target).prop("disabled",false);
	              $("input#pwd").prop("disabled",false);
	            
	               $(e.target).parent().find("span.error").show();
	               $("input#pwd").focus();
	            }
	            else{
	               $("table#tblMemberRegister :input").prop("disabled",false);
	               $(e.target).parent().find("span.error").hide();
	            }
	             
	          });// 비번이 입력한비번과 같은지 체크 
	      
	       //이름
	       $("input#user_name").blur((e) => {
	         if( $(e.target).val().trim() == ""){
	            
	            $("table#tblMemberRegister :input").prop("disabled",true);
	            $(e.target).prop("disabled",false);
	            
	            $(e.target).parent().find("span.error").show();
	            $(e.target).focus();
	
	         }
	         else{
	            // 공백만이 아닌 글자를 입력했을 경우
	            $("table#tblMemberRegister :input").prop("disabled",false);
	            $(e.target).parent().find("span.error").hide();
	         }
	       }); 
	       
	       //이메일
	       $("input#email").blur( (e) => {
	          const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	          const bool = regExp.test($(e.target).val());
	          
	          if(!bool){
	             //암호가 정규표현식에 위배된 경우
	             $("table#tblMemberRegister :input").prop("disabled",true);
	               $(e.target).prop("disabled",false);
	               
	               $(e.target).parent().find("span.error").show();
	               $(e.target).focus();
	          }
	          else{
	             //암호가 정규표현식에 맞는 경우
	             $("table#tblMemberRegister :input").prop("disabled",false);
	             $(e.target).parent().find("span.error").hide();
	          }
	             
	          });
	      // 휴대폰 두번째 칸
	       $("input#hp2").blur( (e) => {
	          const regExp = /^[1-9][0-9]{2,3}$/g; 
	          const bool = regExp.test($(e.target).val());
	          
	          if(!bool){
	             //국번이 정규표현식에 위배된 경우
	             $("table#tblMemberRegister :input").prop("disabled",true);
	               $(e.target).prop("disabled",false);
	               $(e.target).parent().find("span.error").show();
	               $(e.target).focus();
	          }
	          else{
	             //국번이 정규표현식에 맞는 경우
	             $("table#tblMemberRegister :input").prop("disabled",false);
	             $(e.target).parent().find("span.error").hide();
	          }
	             
	        });
	      
	       // 마지막칸  국번
	       $("input#hp3").blur( (e) => {
	         
	          const regExp = /^\d{4}$/g; 
	          const bool = regExp.test($(e.target).val());
	          
	          if(!bool){
	             //국번이 정규표현식에 위배된 경우
	             $("table#tblMemberRegister :input").prop("disabled",true);
	               $(e.target).prop("disabled",false);
	               $(e.target).parent().find("span.error").show();
	               $(e.target).focus();
	          }
	          else{
	             //국번이 정규표현식에 맞는 경우
	             $("table#tblMemberRegister :input").prop("disabled",false);
	             $(e.target).parent().find("span.error").hide();
	          }
	             
	       });
	       
	      
	      //우편번호 
	       $("button#btnPostcode").click(function(){
	           new daum.Postcode({
	               oncomplete: function(data) {
	                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                   let addr = ''; // 주소 변수
	                   let extraAddr = ''; // 참고항목 변수
	
	                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                       addr = data.roadAddress;
	                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                       addr = data.jibunAddress;
	                   }
	
	                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                   if(data.userSelectedType === 'R'){
	                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                           extraAddr += data.bname;
	                       }
	                       // 건물명이 있고, 공동주택일 경우 추가한다.
	                       if(data.buildingName !== '' && data.apartment === 'Y'){
	                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                       }
	                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                       if(extraAddr !== ''){
	                           extraAddr = ' (' + extraAddr + ')';
	                       }
	                       // 조합된 참고항목을 해당 필드에 넣는다.
	                       document.getElementById("extraAddress").value = extraAddr;
	                   
	                   } else {
	                       document.getElementById("extraAddress").value = '';
	                   }
	
	                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                   document.getElementById('post_code').value = data.zonecode;
	                   document.getElementById("address").value = addr;
	                   // 커서를 상세주소 필드로 이동한다.
	                   document.getElementById("detailAddress").focus();
	               }
	           }).open();
	       });// $("button#btnPostcode").click
	       
	   	   $("input:text[id='post_code']").keyup(function(){
	   		   alert(`우편번호 입력은 "우편번호찾기"를 클릭으로만 됩니다`);
	   		   $(this).val("");
	   	   });
       
	   	 //===== jQery UI의 datapicker =====//
	      $("input#datepicker").datepicker({
	        dateFormat: 'yy-mm-dd'  //Input Display Format 변경
	          ,showOtherMonths: true   //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	          ,changeYear: true        //콤보박스에서 년 선택 가능
	          ,changeMonth: true       //콤보박스에서 월 선택 가능                
	         // ,showOn: "both"          //button:버튼을 표시하고,버튼을 눌러야만 달력 표시됨. both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시됨.  
	         // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	         // ,buttonImageOnly: true   //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	         // ,buttonText: "선택"       //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	          ,yearSuffix: "년"         //달력의 년도 부분 뒤에 붙는 텍스트
	          ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	        //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        //,maxDate: "+1M" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)  
	      });
	      //초기값을 오늘 날짜로 설정
	      //$('input#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
	  	   
		    
	  	  // 우편번호 찾기를 클릭했을때 
		  $("button#btn_post_search").click(function(){
		      alert("hi");
		 	  b_flag_zipcodeSearch_click = true;
		  });
	 	   
	 	 // 우편번호를 그냥 입력하려고 할떄 
	 	 $("input:text[id='podt_code']").keyup(function(){
			  alert(`우편번호 입력은 "우편번호검색"를 클릭으로만 됩니다`);
			  $(this).val("");
	  	 });
	  	   
		
	    		
	    // 이메일 중복 체크 
   	   
   		$("button#doubleCheckEmail").click(function(){
   		 	$.ajax({
		    	url:"<%= ctxPath%>/emailDoubleCheck.ban",
		    	data:{"email":$("input#email").val()}, // data는 /MyMVC/member/idDuplicateCheck.up로 전송해야할 데이터를 말한다.
		    	type:"post",// method 를 쓰는 실수 X type을 생략하면 type:"get"이다.
		    
		    	success:function(text){ 
		    
		    		const json = JSON.parse(text); // 객체로 파싱 
		    		if(json.emailExist ) {
		    			// 이미 사용중인 userid라면
		    			$("span#emailCheckResult").html($("input#email").val()+"은 중복된 EMAIL이므로 사용 불가합니다.").css("color","red");
		    			$("input#email").val("");
		    		}
		    		else if(!json.emailExist && $("input#email").val().trim() !="" ){
		    			// 존재하지 않는 경우라면 또는 공백을 입력한 경우
		    			$("span#emailCheckResult").html($("input#email").val()+"은 사용가능합니다.").css("color","blue");
		    			b_flag_emailDuplicate_click = true;
		    		}
		    	},
		    	
		    	error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		          }
		      });
   		});// end of $("button#doublecheckID").click(function()
   	   
	   		
	    		
   
    
   	   

   });// end of document ready()
   
   //====================================================================
	   
    
   // 회원가입 버튼 누를 시 진행되는 메소드
   function goRegister(){
	////***** 필수입력사항에 모두 입력이 되었는지 검사한다 *******//////
		let b_Flag_requiredInfo = false;
		
		$("input.requiredInfo").each( (index,elmt) => {
			if( $(elmt).val().trim() == ""){
				//비어있다면 true
				alert("* 표시된 필수입력사항은 모두 입력하셔야 합니다.");
				b_Flag_requiredInfo = true;
				return false; //break; 라는 뜻이다.
			}
		});
		
		 if(!b_flag_emailDuplicate_click) {
				// "이메일중복확인" 을 클릭 안 했을 경우
				alert("이메일중복확인을 클릭하셔야 합니다.");
				return; // 함수종료
			}	
		
		if(b_Flag_requiredInfo){ // 칸이 비어있다면 가입하기 함수를 실행하지 않고 종료
			return; // 함수종료
		}

		const frm = document.formJoin;
		frm.action="mypagememberChangeEnd.ban";
		frm.method="post";
		frm.submit();
		
   }// end of goRegister

</script>
    
</head>

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
                <link type="text/css" rel="stylesheet" href="/data/skin/front/moment_cafenoli_N/css/member/member.css?ts=1664326506">
                <div class="mypage_cont">

                    <div class="my_page">

                        <div class="mypage_zone_tit">
                            <h2>회원정보 변경</h2>
                        </div>

                        <div class="join_base_wrap">

                            <div class="member_cont">
                                <form id="formJoin" name="formJoin" action="https://www.cafenoli.com/mypage/my_page_ps.php" method="post">
                                    <input type="hidden" name="memNo" value="80676" />
                                    <input type="hidden" name="memberFl" value="personal" />
                                    <input type="hidden" name="dupeinfo" value="MC0GCCqGSIb3DQIJAyEA0z13OoXT6HPZIZ0lRdAtPmdh0sE6XBeEOG1OXvhz2ms=" />
                                    <input type="hidden" name="rncheck" value="authCellphone" />
                                    <input type="hidden" name="mode" value="modify" />

                                    <!-- 회원가입/정보 기본정보 -->
                                    <div class="base_info_box">
                                        <h3>기본정보</h3>
                                        <span class="important">* 표시는 반드시 입력하셔야 하는 항목입니다.</span>
                                        <div class="base_info_sec">
                                            <table border="0" cellpadding="0" cellspacing="0" id="tblMemberRegister">
                                                <colgroup>
                                                    <col width="25%">
                                                    <col width="75%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th><span class="important">아이디</span></th>
                                                        <td>
                                                            <input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}" />
                                                            ${sessionScope.loginuser.user_id}
                                                        </td>

                                                    </tr>
                                                     <tr>
			                                           <th>
			                                               <span class="important">*새 비밀번호</span>
			                                           </th>
			                                           <td>
			                                           	   <input type="password" id="pwd" name="pwd" class="requiredInfo"
			                                                   autocomplete="off" />
			                                               <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
			                                           </td>
			                                       </tr>
			                                       <tr>
			                                           <th>
			                                               <span class="important">*새 비밀번호확인</span>
			                                           </th>
			                                           <td>
			                                           	   <input type="password" id="pwdcheck"  name="pwdcheck" class="requiredInfo"
			                                                   autocomplete="off" />
			                                               <span class="error" style="color:red;">비밀번호가 같지 않습니다.</span>
			                                           </td>
			                                       </tr>
                                                    <tr>
                                                        <th><span class="important">* 이름</span></th>
                                                        <td>
                                                            <div class="member_warning">
                                                                <input type="text" id="user_name" name="user_name" data-pattern="gdMemberNmGlobal" value="${sessionScope.loginuser.user_name}" maxlength="30" />
                                                            </div>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <th><span>* 이메일</span></th>
                                                        <td>
			                                               <input type="text" id="email" name="email" class="requiredInfo"  value="${sessionScope.loginuser.email}" tabindex="-1" />
			                                               <button type="button" class=" btn_double_check" id="doubleCheckEmail" > 이메일 중복 체크</button>
			                                               <span id="emailCheckResult"></span>
			                                               <span class="error">이메일 형식에 맞지 않습니다.</span>
			                                           </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>* 휴대폰번호</span></th>
                                                        <td class="member_address">
                                                            <div class="address_postcode">
                                                                <input type="text" id="cellPhone" name="mobile" maxlength="12" value="${sessionScope.loginuser.mobile}"  placeholder="- 없이 입력하세요." data-pattern="gdNum" value="" />
                                                            </div>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>* 일반번호 </span></th>
                                                        <td>
                                                            <div class="member_warning">
                                                                <input type="text" id="phone" class="requiredInfo" name="telephone" maxlength="12" placeholder="- 없이 입력하세요."  data-pattern="gdNum" value="" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>* 주소</span></th>
                                                        <td class="member_address">
                                                            <div class="address_postcode">
                                                                <input type="text" name="post_code" readonly="readonly" value="${sessionScope.loginuser.post_code}" />
                                                                <button type="button" id="btnPostcode" class="btn_post_search">우편번호검색</button>
                                                                <input type="hidden" name="zipcode" value="-" />
                                                            </div>
                                                            <div class="address_input">
					                   						   <input type="text" id="address" name="address" class="requiredInfo" value="${sessionScope.loginuser.address}" placeholder="주소"/>
			                                                   <input type="text" id="detailAddress" name="detailAddress" value="${sessionScope.loginuser.detailAddress}"
			                                                       class="requiredInfo" placeholder="상세주소" />
															   <span class="error">주소를 입력하세요</span>
			                                                   <input type="text" id="extraAddress" placeholder="부가주소" name="extraAddress" value="${sessionScope.loginuser.extraAddress}"
			                                                       class="extra_address" />
			                                                       
			                                               </div>
                                                        </td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- //base_info_sec -->
                                    </div>
                                    <!-- //base_info_box -->
                                    <!-- 회원가입/정보 기본정보 -->

                                    <div class="btn_center_box">
		                               <button type="button" id="btnReset" class="btn_cancle" onclick="location.href='<%= ctxPath%>/mypage.ban'" >취소</button>
		                               <button type="button" id="goToRegis" onclick="goRegister();" class="btn_register" value="정보수정">정보수정</button>
		                           </div>
		                            <!-- //btn_center_box -->
                                </form>
                            </div>
                            <!-- //member_cont -->
                        </div>
                        <!-- //join_base_wrap -->

                    </div>
                    <!-- //my_page -->

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
