<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />

<script>

   
	$(document).ready(function(){
		

			$("button#btnFindId").click(function(){
				goFindId();
			});// end of goLogin btn
			
			$("input#email").bind("keydown",function(e){
				if(e.keyCode == 13){// !!keycode 아니고 keyCode이다 암호입력란에 enter을 했을 경우
					goFindId();
				}
			});
		
		
	
	});// end of $(document).ready(function()


			
	//아이디 찾기를 하는 함수
	function goFindId(){
		
		const loginName = $("input#user_name").val().trim();
		const email = $("input#email").val().trim();
		
		if(loginName == ""){ 
			
			alert("이름를 입력하세요!")
			$("input#user_name").val("");
			$("input#user_name").focus();
			return;

		}
		
		if(email == ""){ 
			
			alert("이메일을 입력하세요!")
			$("input#email").val("");
			$("input#email").focus();
			return;

		}
		const frm = document.formFindId;
		frm.action = "<%= ctxPath%>/findId.ban";
		frm.method = "post";
		frm.submit();
		
	}

</script>
	  <div class="sub_content">
         <div class="content_box">
             <div class="member_wrap">
                 <div class="member_title">
                     <h2>아이디 찾기</h2>
                 </div> <!-- // member_title-->

                 <div class="member_cont findPwd_member_cont">
                     <form name="formFindId">
                         <div class="member_login_box">
                             <h3>회원 아이디 찾기</h3>
                             <div class="login_input_sec">
                                 <div>
                                     <input type="text" class="form-control" id="user_name" name="user_name"
                                         value="" placeholder="이름"  aria-required="true">
                                       
                                     <input type="text" class="form-control" id="email"
                                         name="email" value="" placeholder="가입이메일주소" 
                                         aria-required="true">
                                        
                                 </div>
                                 <button type="button" class="member_login_order_btn" id="btnFindId">아이디찾기</button>
                             </div><!-- // login_input_sec-->

                         </div><!--//member_login_box -->
                         <div class="btn_login_box">
                             <ul>
                                 <li>
                                     <button type="button" id="btnfindPwd" class="btn_member_white"  onclick="location.href='<%= ctxPath%>/findPwd.ban'" >비밀번호
                                         찾기</button>
                                 </li>
                                 <li>
                                     <button type="button" herf="" id="btnLogin" class="btn_member_gray" onclick="location.href='<%= ctxPath%>/login.ban'"
                                        >로그인하기</button>
                                 </li>
                             </ul>

                         </div> <!-- // btn_login_box-->
                     </form>
                 </div><!-- // member_content-->
             </div><!-- //  member_wrap-->
         </div>
      </div><!-- // sub_content-->
  
<jsp:include page="../footer.jsp" /> 
