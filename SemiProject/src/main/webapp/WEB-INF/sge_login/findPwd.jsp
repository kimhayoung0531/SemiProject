<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		$("button.sendMail").click(function(){
			goSendMail();
		});// end of goLogin btn
		
		$("input#email").bind("keydown",function(e){
			if(e.keyCode == 13){// !!keycode 아니고 keyCode이다 암호입력란에 enter을 했을 경우
				goSendMail();
			}
		});
		
		  if(${requestScope.sendMailSuccess == true}){
	           alert("이메일로 인증번호를 발송했습니다!");
	           window.location.href = 'pwdCertificateNumber.ban';
	     }  
		
	
		
	});// end of $(document).ready(function()
			
	// 비밀번호 찾기를 하는 함수
	function goSendMail(){
		
		const user_id = $("input#loginId").val().trim();
		const email = $("input#email").val().trim();
		
		if(user_id == ""){ 
			
			alert("아이디를 입력하세요!")
			$("input#loginId").val("");
			$("input#loginId").focus();
			return;

		}
		
		if(email == ""){ 
			
			alert("이메일을 입력하세요!")
			$("input#email").val("");
			$("input#email").focus();
			return;
		}
		
		 sessionStorage.setItem("user_id", user_id);
		 
		 const frm = document.findPwdForm;
		 frm.action = "<%= ctxPath%>/findPwd.ban";
		 frm.method = "post";
		 frm.submit();
	}
		


</script>
<div class="sub_content">
  <div class="content_box">
      <div class="member_wrap">
          <div class="member_title">
              <h2>비밀번호 찾기</h2>
          </div> <!-- // member_title-->

          <div class="findPwd_member_cont">
              <form name="findPwdForm">
                  <div class="find_password_box">
                      <h3>아이디 입력</h3>
                      <p>비밀번호를 찾고자 하는 아이디를 입력해주세요</p>
                      <div class="login_input">
                          <div class="member_warning">
                              <input type="text" class="form-control" id="loginId" name="user_id"
                                   placeholder="아이디" aria-required="true">
                              <input type="text" class="form-control" id="email"
                                  name="email"  placeholder="이메일" 
                                  aria-required="true">
                              <p class="info_again">아이디를 모르시나요?
                                  <a href="<%=ctxPath %>/findId.ban" class="js_btn_find_id">아이디 찾기</a>
                              </p>
                              <p class="dn" id="errorMessage"></p>
                          </div>

                      </div><!-- // login_input_sec-->
                      <div class="my-3" id="div_findResult">
					       <p class="text-center">
						        <c:if test="${requestScope.isUserExist == false}">
						        	<span style="color: red;">사용자 정보가 없습니다 </span>
						        </c:if>

						        <c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == false}">
						        	<span style="color: red;">메일발송이 실패했습니다.</span><br>
						        </c:if>
					        </p>
					 </div>

                  </div><!--//member_login_box -->
                  <div class="btn_center_box">
                      <button type="button" id="gonext" class="btn_member_next sendMail" >인증메일 보내기</button>                 
                  </div> <!-- // btn_login_box-->
              </form>
              
              
          </div><!-- // member_content-->
      </div><!-- //  member_wrap-->
    </div>
</div><!-- // sub_content-->
  
<jsp:include page="../footer.jsp" /> 
