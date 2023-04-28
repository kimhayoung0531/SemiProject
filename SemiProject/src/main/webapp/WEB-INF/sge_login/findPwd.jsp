<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		
		
	});// end of $(document).ready(function()








</script>
<div class="sub_content">
                    <div class="content_box">
                        <div class="member_wrap">
                            <div class="member_title">
                                <h2>비밀번호 찾기</h2>
                            </div> <!-- // member_title-->

                            <div class="findPwd_member_cont">
                                <form action="" method="post" id="formLogin">
                                    <div class="find_password_box">
                                        <h3>아이디 입력</h3>
                                        <p>비밀번호를 찾고자 하는 아이디를 입력해주세요</p>
                                        <div class="login_input">
                                            <div class="member_warning">
                                                <input type="text" class="form-control" id="loginId" name="loginId"
                                                    value="" placeholder="아이디" aria-required="true">
                                                <input type="password" class="form-control" id="loginPwd"
                                                    name="loginPwd" value="" placeholder="이름" 
                                                    aria-required="true">
                                                <p class="info_again">아이디를 모르시나요?
                                                    <a href="<%=ctxPath %>/findId.ban" class="js_btn_find_id">아이디 찾기</a>
                                                </p>
                                                <p class="dn" id="errorMessage"></p>
                                            </div>

                                        </div><!-- // login_input_sec-->

                                    </div><!--//member_login_box -->
                                    <div class="btn_center_box">
                                        <button type="button" id="gonext" class="btn_member_next" onclick="location.href='<%= ctxPath%>/pwdCertification.ban'">다음</button>
                                    </div> <!-- // btn_login_box-->
                                </form>
                            </div><!-- // member_content-->
                        </div><!-- //  member_wrap-->
                    </div>
                </div><!-- // sub_content-->
  
<jsp:include page="../footer.jsp" /> 
