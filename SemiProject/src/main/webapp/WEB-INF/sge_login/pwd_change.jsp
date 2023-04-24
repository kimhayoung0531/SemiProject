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
                <h2>비밀번호 찾기</h2>
            </div> <!-- // member_title-->

            <div class="member_cont">
                <form action="" name="formReset" id="formReset" method="post" id="formLogin">
                    <div class="find_password_box">
                        <h3>비밀번호 변경</h3>
                        <p>새로운 비밀번호를 등록해 주세요.</p>
                        <div class="login_input">
                            <div class="js_input_pw">
                                <div class="member_warning">
                                    <input type="password" class="form-control" id="passwordMsg"
                                        name="memPw" autocomplete="off" placeholder="새 비밀번호" />
                                </div>
                            </div>

                            <div class="js_input_pw">
                                <div class="member_warning">
                                    <input type="password" class="form-control" id="newPwRe"
                                        name="newPwRe" autocomplete="off" placeholder="새 비밀번호 확인" />
                                </div>
                            </div>


                        </div><!--//member_login_box -->
                        <div class="btn_center_box">
                            <button type="submit" class="btn_member_next" onclick="">확인</button>
                        </div> <!-- // btn_login_box-->
                </form>
            </div><!-- // member_content-->
        </div><!-- //  member_wrap-->
    </div>
</div><!-- // sub_content-->


<jsp:include page="../footer.jsp" />