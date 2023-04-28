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
                 <h2>회원가입</h2>

             </div> <!-- // member_title-->

             <div class="sub_content">
                    <div class="content_box">
                        <div class="member_wrap">
                            <div class="member_title">
                                <h2>아이디 찾기</h2>
                            </div> <!-- // member_title-->

                            <div class="member_cont">
                                <div class="find_password_complete_box">
                                    <p>회원님 아이디 :  ${requestScope.user_id}</p>
                                    <div class="btn_center_box">
                                        <button type="button" class="btn_confirm_js_btn_login" onclick="location.href='<%= ctxPath%>/login.ban'"> 
                                            로그인
                                        </button>
                                        <button class="btn_confirm_js_btn_login" onclick="location.href='<%= ctxPath%>/findPwd.ban'">
                                            비밀번호 찾기
                                        </button>
                                    </div>
                                </div>
                            </div><!-- // member_content-->
                        </div><!-- //  member_wrap-->
                    </div>
                </div><!-- // sub_content-->


         </div><!-- //  member_wrap-->
     </div>
 </div><!-- // sub_content-->
<jsp:include page="../footer.jsp" />