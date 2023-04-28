<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />

 <div class="sub_content">
     <div class="content_box">
         <div class="member_wrap">
             <div class="member_title">
                 <h2>본인인증</h2>
             </div> <!-- // member_title-->

             <div class="member_cont">
                 <form action="" name="formAuth" id="formAuth" method="post" id="formLogin">
                     <div class="find_password_box">
                         <h3>인증번호 입력</h3>
                         <p>수신된 이메일의 인증번호를 입력해 주세요.</p>
                         <div class="login_input">
                             <div class="member_warning">
                                 <input type="text" class="form-control" id="inputCertify"
                                     name="inputCertify" class="text" placeholder="인증번호 입력" />
                                 <p>남은 인증시간:<span></span></p>
                                 <div class="guideMsg"></div>
                                 <div class="errorMessage">
                                     <p class="info_again">잘못된 인증번호 입니다. 다시 입력해 주세요.</p>
                                 </div>
                             </div><!-- // login_input_sec-->

                         </div><!--//member_login_box -->
                         <div class="btn_center_box">
                             <button type="button" id="btnCancel" class="btn_member_prev"
                                  onclick="location.href='<%= ctxPath%>/pwdCertification.ban'">이전</button>
                             <button type="button" class="btn_member_next" onclick="location.href='<%= ctxPath%>/pwdChange.ban'">확인</button>
                         </div> <!-- // btn_login_box-->
                 </form>
             </div><!-- // member_content-->
         </div><!-- //  member_wrap-->
     </div>
</div><!-- // sub_content-->