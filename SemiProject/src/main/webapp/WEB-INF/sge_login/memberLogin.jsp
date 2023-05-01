<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
		
		if( ${empty sessionScope.loginuser }){
			const loginUser_id = localStorage.getItem("saveId");
			if(loginUser_id != null){
				$("input#loginId").val(loginUser_id);
				$("input:checkbox[id='saveId']").prop("checked", true);
			}
		}

		$("button#goLogin1").click(function(){
			goLogin();
		});// end of goLogin btn
		
		$("input#loginPwd").bind("keydown",function(e){
			if(e.keyCode == 13){// !!keycode 아니고 keyCode이다 암호입력란에 enter을 했을 경우
				goLogin();
			}
		});// end of $("button#goLogin1").click
	
	});// end of $(document).ready(function()


			
	// 로그인 처리를 하는 함수
	function goLogin(){
		
		const loginUserid = $("input#loginId").val().trim();
		const loginPwd = $("input#loginPwd").val().trim();
		
		if(loginUserid == ""){ // 아이디값이 공백인 경우
			
			alert("아이디를 입력하세요!")
			$("input#loginUserid").val("");
			$("input#loginUserid").focus();
			return;

		}
		
		if(loginPwd == ""){ // 비밀번호값 공백인 경우
			
			alert("비밀번호를 입력하세요!")
			$("input#loginPwd").val("");
			$("input#loginPwd").focus();
			return;

		}
		
		//아이디저장을 한 경우 
		if( $("input:checkbox[id='saveId']").prop("checked")){
			localStorage.setItem("saveId", $("input#loginId").val());
		}
		else{
			localStorage.removeItem("saveId");
		}

		const frm = document.formLogin;
		frm.action = "<%= ctxPath%>/login.ban";
		frm.method = "post";
		frm.submit();
		
	}




</script>

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
                  <form method="post" name="formLogin">
                      <div class="member_login_box">
                          <h3>회원 로그인</h3>
                          <div class="login_input_sec">
                              <div id="inputIdPwd">
                                  <input type="text" class="form-control" id="loginId" name="user_id"
                                      value="" placeholder="아이디" >
                
                                  <input type="password" class="form-control" id="loginPwd"
                                      name="pwd" value="" placeholder="비밀번호" >
                                    
                                      
                              </div>
                              <button type="button" id="goLogin1" class="member_login_order_btn">로그인</button>
                          </div><!-- // login_input_sec-->
                          <div class="id_check">
                              <span class="form_element">
                                  <input type="checkbox" id="saveId" name="saveId" />
                                  <label for="saveId" class="on">아이디 저장</label>
                              </span>
                              <p class="dismatch_id_pwd" style="display: none;">
                                  아이디,비밀번호가 일치하지 않습니다. 올바른 아이디 비밀번호를 입력해주세요
                              </p>
                          </div><!-- // id_check -->
                      </div><!--//member_login_box -->
                      <div class="btn_login_box">
                          <ul>
                              <li>
                                  <button type="button" id="btnJoinMember" class="btn_member_join" onclick="location.href='<%= ctxPath%>/registerAgreement.ban'">회원가입</button>
                              </li>
                              <li>
                                  <button type="button" id="btnfindId" class="btn_member_white" onclick="location.href='<%= ctxPath%>/findId.ban'">아이디 찾기</button>
                              </li>
                              <li>
                                  <button type="button" id="btnFindPwd" class="btn_member_white" onclick="location.href='<%= ctxPath%>/findPwd.ban'">비밀번호 찾기</button>
                              </li>
                          </ul>

                      </div> <!-- // btn_login_box-->
                  </form>
              </div><!-- // member_content-->
          </div><!-- //  member_wrap-->
      </div>
  </div><!-- // sub_content-->
<jsp:include page="../footer.jsp" /> 
