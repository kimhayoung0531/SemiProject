<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />
<script>

</script>
     <div class="sub_content">
	       <div class="content_box">
	           <div class="member_wrap">
	               <div class="member_title">
	                   <h2>비밀번호 찾기</h2>
	               </div> <!-- // member_title-->
	
	               <div class="member_cont">
	                   <form action="" name="formAuth" id="formAuth" method="post" id="formLogin">
	                       <div class="find_password_box">
	                           <h3>인증수단 선택</h3>
	                           <p>본인인증 방법을 선택해 주세요</p>
	                           <div class="login_input">
	                               <div class="form_element">
	                                   <ul class="user_certify_list">
	                                       <li>
	                                           <input type="radio" id="authEmail" name="authType"
	                                               value="authEmail">
	                                           <label class="choice" for="authEmail">이메일 인증</label>
	                                           <strong>사용자 이메일</strong>
	                                           <span>가입시 등록한 이메일로 인증번호가 발송됩니다.</span>
	                                       </li>
	                                       <li>
	                                           <input type="radio" id="authSms" name="authType" value="authSms" ">
	                                           <label class=" choice" for="authSms">SMS 인증</label>
	                                           <strong>사용자 번호</strong>
	
	                                       </li>
	                                       <p class="dn" id="errorMessage"></p>
	
	                                   </ul>
	
	                               </div>
	
	                           </div><!-- // login_input_sec-->
	
	                       </div><!--//member_login_box -->
	                       <div class="btn_center_box">
	                           <button type="button" id="gonext" class="btn_member_next" onclick="location.href='<%= ctxPath%>/pwdCertificateNumber.ban'">다음</button>
	                       </div> <!-- // btn_login_box-->
	                   </form>
	               </div><!-- // member_content-->
	           </div><!-- //  member_wrap-->
	       </div>
       </div><!-- // sub_content-->
       
   <jsp:include page="../footer.jsp" />