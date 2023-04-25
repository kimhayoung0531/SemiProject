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
                     <h2>아이디 찾기</h2>
                 </div> <!-- // member_title-->

                 <div class="member_cont">
                     <form action="" method="post" id="formLogin">
                         <div class="member_login_box">
                             <h3>회원 아이디 찾기</h3>
                             <div class="login_input_sec">
                                 <div>
                                     <input type="text" class="form-control" id="loginId" name="loginId"
                                         value="" placeholder="이름" required="true" aria-required="true">
                                     <input type="password" class="form-control" id="loginPwd"
                                         name="loginPwd" value="" placeholder="가입이메일주소" required="true"
                                         aria-required="true">
                                 </div>
                                 <button type="submit" class="member_login_order_btn">아이디찾기</button>
                             </div><!-- // login_input_sec-->

                         </div><!--//member_login_box -->
                         <div class="btn_login_box">
                             <ul>
                                 <li>
                                     <button id="btnfindPwd" class="btn_member_white" onclick="">비밀번호
                                         찾기</button>
                                 </li>
                                 <li>
                                     <button herf="" id="btnLogin" class="btn_member_gray"
                                         onclick="">로그인하기</button>
                                 </li>
                             </ul>

                         </div> <!-- // btn_login_box-->
                     </form>
                 </div><!-- // member_content-->
             </div><!-- //  member_wrap-->
         </div>
      </div><!-- // sub_content-->
  
<jsp:include page="../footer.jsp" /> 
