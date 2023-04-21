<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
    
<jsp:include page="../header.jsp" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
   
   $(document).ready(function(){
   
      $("span.error").hide();
      $("input#userid").focus();
      
      //아이디를 건너뛸 경우 에러메시지
      $("input#userid").blur( (e) => {
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
       }); // end of userid.BLUR 
       
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
       $("input#name").blur((e) => {
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
                       document.getElementById("extra_address").value = extraAddr;
                   
                   } else {
                       document.getElementById("extra_address").value = '';
                   }

                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('postcode').value = data.zonecode;
                   document.getElementById("address").value = addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("detail_email").focus();
               }
           }).open();
       });// $("button#btnPostcode").click
       
   	   $("input:text[id='podtcode']").keyup(function(){
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
   	   
   	   // 아이디 중복체크
   	   $("img#idcheck").click(function(){
  	   		//b_flag_idDuplicate_click = true;
  	   
	   	$.ajax({
	    	url:"<%= ctxPath%>/member/idDuplicateCheck.up",
	    	data:{"userid":$("input#userid").val()}, // data는 /MyMVC/member/idDuplicateCheck.up로 전송해야할 데이터를 말한다.
	    	type:"post",// method 를 쓰는 실수 X type을 생략하면 type:"get"이다.
	        //	dataType:"json",// T 대문자이다 
	    	success:function(text){ 
	    		
	    		const json = JSON.parse(text); // 객체로 파싱 
	    		
	    		if(json.isExists ) {
	    			// 이미 사용중인 userid라면
	    			$("span#idcheckResult").html($("input#userid").val()+"은 중복된 ID이므로 사용 불가합니다.").css("color","red");
	    			$("input#userid").val("");
	    		}
	    		else if(!json.isExists && $("input#userid").val().trim() !="" ){
	    			// 존재하지 않는 경우라면 또는 공백을 입력한 경우
	    			$("span#idcheckResult").html($("input#userid").val()+"은 사용가능합니다.").css("color","blue");
	    		}
	    	},
	    	
	    	error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
	      }); // end of $.ajax
   	   }); //end of  $("img#idcheck").click(function()
       
   });// end of document ready()
   
   //====================================================================
	   
	   

   // 회원가입 버튼 누를시 진행되는 메소드
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
		
		if(b_Flag_requiredInfo){ // 칸이 비어있다면 가입하기 함수를 실행하지 않고 종료
			return; // 함수종료
		}
		
		//성별 radio 선택유무 검사하기
		const radio_checked_length = $("input:radio[name='gender']:checked").length;
		
		if(radio_checked_length == 0){
			alert("성별을 선택하셔야 합니다");
			return ; // 함수종료
		}
		
		
		const frm = document.formJoin;
		frm.action="memberRegister.ban";
		frm.method="post";
		frm.submit();
		
   }// end of goRegister

</script>

   <div class="sub_content">
       <div class="content_box">
           <div class="join_agreement_wrap">
               <div class="member_title">
                   <h2>회원가입 </h2>
                   <ol>
                       <li>
                           <span>01</span>
                           약관동의
                           <span>
                               <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                   alt="약관동의완료">
                           </span>
                       </li>
                       <li class="page_on">
                           <span>02</span>
                           정보입력
                           <span>
                               <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                   alt="약관동의완료">
                           </span>
                       </li>
                       <li>
                           <span>03</span>
                           가입완료
                           <span>
                               <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                   alt="약관동의완료">
                           </span>
                       </li>
                   </ol>
               </div>

               <div class="member_cont">
                   <form id="formJoin" name="formJoin">
                       <div class="base_info_box">
                           <span class="important">* 표시는 반드시 입력하셔야하는 항목입니다</span>
                           <h3>기본정보</h3>

                           <div class="base_info_sec">
                               <table id="tblMemberRegister">
                                   <colgroup>
                                       <col width="25%">
                                       <col width="75%">
                                   </colgroup>
                                   <tbody>
                                       <tr>
                                           <th>
                                               <span class="important">* 아이디</span>
                                           </th>
                                           <td>
                                                <input type="text" id="userid" name="userid" class="requiredInfo" />
                                                <button class="btn_double_check"> 아이디 중복 체크</button>
                                                <span class="error" style="color:red;">아이디는 필수입력 사항입니다.</span>
                                           </td> 
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 비밀번호</span>
                                           </th>
                                           <td>
                                           	   <input type="password" id="pwd" name="pwd" class="requiredInfo"
                                                   autocomplete="off" />
                                               <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 비밀번호확인</span>
                                           </th>
                                           <td>
                                           	   <input type="password" id="pwdcheck"  name="pwdcheck" class="requiredInfo"
                                                   autocomplete="off" />
                                               <span class="error" style="color:red;">비밀번호가 같지 않습니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 이름</span>
                                           </th>
                                           <td><input type="text" id="name" class="requiredInfo"
                                                   autocomplete="off" />
                                                <span class="error">성명은 필수입력 사항입니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 이메일</span>

                                           </th>
                                           <td>
                                               <input type="text" id="email" class="requiredInfo" />
                                               <button class=" btn_double_check"> 이메일 중복 체크</button>
                                               <span class="error">이메일 형식에 맞지 않습니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 휴대폰 번호</span>
                                           </th>
                                           <td>
                                                <input type="text" id="s_hp1" name="hp1" class="requiredInfo" size="3" maxlength="3" value="010" readonly />&nbsp;-&nbsp;
			    							    <input type="text" id="s_hp2" name="hp2" class="requiredInfo" size="4" maxlength="4" />&nbsp;-&nbsp;
			    							    <input type="text" id="s_hp3" name="hp3" class="requiredInfo" size="4" maxlength="4" />
				    							<span class="error">휴대폰 형식이 아닙니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">유선번호(선택)</span>
                                           </th>
                                           <td>
                                                <input type="text" id="hp1" name="hp1" size="3" maxlength="3" value="02" readonly />&nbsp;-&nbsp;
			    							    <input type="text" id="hp2" name="hp2" size="4" maxlength="4" />&nbsp;-&nbsp;
			    							    <input type="text" id="hp3" name="hp3" size="4" maxlength="4" />
				    							<span class="error">유선번호 형식이 아닙니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 주소</span>
                                           </th>
                                           <td class="member_address">
                                               <div class="address_postcode">
                                                   <input type="text" id="postcode" name="postcode" size="4" class="requiredInfo" />
                                                   <button type="button" id="btnPostcode"
                                                       class="btn_post_search btn_double_check"> 우편번호
                                                       검색</button>
                                                   <span class="error">우편번호 형식이 아닙니다.</span>
                                               </div>
                                               <div class="address_input">
		                   						   <input type="text" id="address" name="address" class="requiredInfo" placeholder="주소"/>
                                                   <input type="text" id="detail_email"
                                                       class="requiredInfo" placeholder="상세주소" />
												   <span class="error">주소를 입력하세요</span>
                                                   <input type="text" id="extra_address" placeholder="부가주소"
                                                       class="extra_address" />
                                                       
                                               </div>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>생일</span>
                                           </th>
                                           <td>
                                               <input type="text" id="datepicker"/>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>성별</span>
                                           </th>
                                           <td>
                                               <div class="from_element">
                                                   <ul id="idle_mem">
                                                       <li>
                                                           <input type="radio" id="male" name="gender"
                                                               value="1" />
                                                           <label for="male" class="">남자</label>
                                                       </li>
                                                       <li>
                                                           <input type="radio" id="female" name="gender"
                                                               value="2" />
                                                           <label for="female" class="">여자</label>
                                                       </li>
                                                
                                                   </ul>
                                               </div>
                                           </td>
                                       </tr>
                                       <!-- <tr>
                                           <th>
                                               <span>휴먼회원 방지기간</span>
                                           </th>
                                           <td>
                                               <div class="from_element">
                                                   <ul id="idle_mem">
                                                       <li>
                                                           <input type="radio" id="idle1" name="idle"
                                                               value="1" />
                                                           <label for="idle1" class="">1년</label>
                                                       </li>
                                                       <li>
                                                           <input type="radio" id="idle3" name="idle"
                                                               value="3" />
                                                           <label for="idle3" class="">3년</label>
                                                       </li>
                                                       <li>
                                                           <input type="radio" id="idle5" name="idle"
                                                               value="5" />
                                                           <label for="idle5" class="">5년</label>
                                                       </li>
                                                   </ul>
                                               </div>
                                           </td>
                                       </tr> -->
                                   </tbody>
                               </table>
                           </div> <!--//join_agreement_cont -->
                           <div class="btn_center_box">
                               <button type="button" id="btnReset" class="btn_cancle">취소
                               </button>
                               <button type="button" id="goToRegis" onclick="goRegister();" class="btn_register">회원가입
                               </button>
                           </div>
                        </div>
                   </form>
               </div><!--member_cont-->
           </div>
       </div>
   </div> <!--//sub_ contents-->
  <jsp:include page="../footer.jsp" />
   
