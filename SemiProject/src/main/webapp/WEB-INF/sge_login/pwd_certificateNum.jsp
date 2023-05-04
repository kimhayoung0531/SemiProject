<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />
<script>

	$(document).ready(function(){

		 $("span.time_error").hide();
	 // const timerDiv = document.querySelector("span.timer");// 타이머를 보여줄 장소

	    const timerDiv = $("span#timer");// 타이머를 보여줄 장소
	    
		let time = 14;
		
		//타이머 함수 만들기
		
		
		const timer = function(){
			if(time == -1){
	             clearInterval(timer);
	             //alert("인증 시간이 만료되었습니다!");
	             $("span.time_error").show();
	             window.location.href = 'findPwd.ban?finish=1';
           }
			else{
				
				let minute;
				let second;
				
				minute = Math.floor(time/60); // 소수부 말고 정수만 
				
				if(minute < 10){
					minute = "0"+minute;
				}
				second = time%60;
				if(second < 10){
					second = "0"+second;
				}
			
				
				let html = minute + ":" + second;
				timerDiv.html(html);
				
				time --;

			}

		};
	
		const setTimer = setInterval(timer, 1000);
		

		// 인증하기 
		$("button.btn_member_next").click(function(){
			const frm = document.verifyCertificationFrm;
			frm.userCertificationCode.value = $("input#input_confirmCode").val();
			frm.action = "<%= ctxPath%>/pwdCertificateNumber.ban";
			frm.method = "post";
			frm.submit(); 
			
			
		});// end of $("button#btnConfirmCode").click(function()
	})
</script>
 <div class="sub_content">
     <div class="content_box">
         <div class="member_wrap">
             <div class="member_title">
                 <h2>본인인증</h2>
             </div> <!-- // member_title-->

             <div class="member_cont">
                 <form name="verifyCertificationFrm">
                     <div class="find_password_box">
                         <h3>인증번호 입력</h3>
                         <p>수신된 이메일의 인증번호를 입력해 주세요.</p>
                         <div class="login_input">
                             <div class="member_warning">
                                 <input type="text" class="form-control" id="input_confirmCode"
                                     name="userCertificationCode" class="text" placeholder="인증번호 입력" />

                                 <input type="hidden" id="user_id" name="user_id" value="${requestScope.user_id}" />
                                  <c:if test="${sessionScope.certificationCode != null}">
                                  	 <p>남은 인증시간:<span id="timer">00:15</span></p>
                                  	 <span class="time_error">인증시간이 만료되었습니다</span>
                                  	 
                                  </c:if>

                              
                             </div><!-- // login_input_sec-->

                         </div><!--//member_login_box -->
                         <div class="btn_center_box">
                             <button type="button" id="btnCancel" class="btn_member_prev"
                                  onclick="location.href='<%= ctxPath%>/findPwd.ban'">이전</button>
                             <button type="button" class="btn_member_next" id="btnSubmit" onclick="location.href='<%= ctxPath%>/pwdChange.ban'">확인</button>
                         </div> <!-- // btn_login_box-->
                      </div> <!-- find_password_box  -->
                 </form>
             </div><!-- // member_content-->
         </div><!-- //  member_wrap-->
     </div>
</div><!-- // sub_content-->


