<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

   <div class="login_sub_content">
       <div class="content_box">
           <div class="login_right">
               <img src="https://cafenoli605.hgodo.com/data/renewal_nodelete/login_banner/login_fix.jpg" />
               <img
                   src="https://cafenoli605.hgodo.com/data/renewal_nodelete/login_banner/login_fix_01.jpg" />
               <img
                   src="https://cafenoli605.hgodo.com/data/renewal_nodelete/login_banner/login_fix_02.jpg" />
               <img
                   src="https://cafenoli605.hgodo.com/data/renewal_nodelete/login_banner/login_fix_03.jpg" />


           </div>
           <div class="member_wrap">
               <div class="member_title">
                   <h2>로그인</h2>
               </div> <!-- // member_title-->

               <div class="member_cont">
                   <form action="" method="post" id="formLogin">
                       <div class="member_login_box">
                           <h3>회원 로그인</h3>
                           <div class="login_input_sec">
                               <div id="inputIdPwd">
                                   <input type="text" class="form-control" id="loginId" name="loginId"
                                       value="" placeholder="아이디" required="true" aria-required="true">
                                   <input type="password" class="form-control" id="loginPwd"
                                       name="loginPwd" value="" placeholder="비밀번호" required="true"
                                       aria-required="true">
                               </div>
                               <button type="submit" class="member_login_order_btn">로그인</button>
                           </div><!-- // login_input_sec-->
                           <div class="id_check">
                               <span class="form_element">
                                   <input type="checkbox" id="saveId" name="saveId" />
                                   <label for="saveId" class="on">아이디 저장</label>
                               </span>
                               <p class="dismatch_id_pwd" style="display: none;">아이디,비밀번호가 일치하지 않습니다. 다시
                                   입력해주세요
                               </p>
                           </div><!-- // id_check -->
                       </div><!--//member_login_box -->
                       <div class="btn_login_box">
                           <ul>
                               <li>
                                   <button id="btnJoinMember" class="btn_member_join">회원가입</button>
                               </li>
                               <li>
                                   <button id="btnfindId" class="btn_member_white">아이디 찾기</button>
                               </li>
                               <li>
                                   <button id="btnFindPwd" class="btn_member_white">비밀번호 찾기</button>
                               </li>
                           </ul>

                       </div> <!-- // btn_login_box-->
                   </form>
               </div><!-- // member_content-->
           </div><!-- //  member_wrap-->
       </div>
   </div><!-- // sub_content-->
<jsp:include page="../footer.jsp" /> 
