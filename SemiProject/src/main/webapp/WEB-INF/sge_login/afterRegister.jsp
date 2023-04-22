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

             <div class="member_cont">
                 <div class="register_success">
                     <p>회원가입이 <strong>완료</strong> 되었습니다</p>
                     <span>님의 회원가입을 축하드립니다.</span>
                     <p>알차고 실속있는 서비스로 찾아뵙겠습니다.</p>
                 </div>

                 <div class="btn_register_box">
                     <ul>
                         <li>
                             <button id="goToMain" class="btn_member_white" >홈으로</button>
                         </li>
                         <li>
                             <button id="btn_login" class="btn_member_gray" href="<%= ctxPath%>/sge_login/memberLogin.jsp">로그인</button>
                         </li>
                     </ul>
                 </div> <!-- // btn_login_box-->
             </div><!-- // member_content-->


         </div><!-- //  member_wrap-->
     </div>
 </div><!-- // sub_content-->
<jsp:include page="../footer.jsp" />