<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		
		$("button#updatePwd").click(function(){
			
			
			const pwd = $("input#pwd").val();	
			const pwd2 = $("input#pwd2").val();
			
			const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
			const bool = regExp.test(pwd); 
			
			if(!bool){
				alert("암호는 8글자 이하에 영문자, 숫자, 특수기호가 혼합되어야만 합니다");
				$("input#pwd").val("");
				$("input#pwd2").val("");
				
				return;//종료
			}
			else if(bool && pwd != pwd2){
				alert("암호가 일치하지 않습니다");
				$("input#pwd").val("");
				$("input#pwd2").val("");
			}
			else{
				const frm = document.pwdUpdateEndFrm;
				frm.action = "<%= ctxPath%>/pwdChange.ban";
				frm.method = "post";
				frm.submit();
			}
			
			
			
		}); // end of $("button#btnUpdate").click(function()
		
		
		
		
		
	});	// end of $(document).ready(function()
	
</script>

 <div class="sub_content">
    <div class="content_box">
        <div class="member_wrap">
            <div class="member_title">
                <h2>비밀번호 찾기</h2>
            </div> <!-- // member_title-->

            <div class="member_cont">
                <form name="pwdUpdateEndFrm">
                    <div class="find_password_box">
                        <h3>비밀번호 변경</h3>
                        <p>새로운 비밀번호를 등록해 주세요.</p>
                        <div class="login_input">
                            <div class="js_input_pw">
                                <div class="member_warning">
                                    <input type="password" class="form-control newPwd" id="pwd"
                                        name="memPw" autocomplete="off" placeholder="새 비밀번호" />
                                    
                                </div>
                            </div>

                            <div class="js_input_pw">
                                <div class="member_warning">
                                    <input type="password" class="form-control" id="pwd2"
                                        name="newPwRe" autocomplete="off" placeholder="새 비밀번호 확인" />
                                  
                                </div>
                            </div>
                        </div><!--//member_login_box -->
                        <div class="btn_center_box">
                            <button type="button" class="btn_member_next" id="updatePwd">비밀번호 바꾸기</button>
                        </div> <!-- // btn_login_box-->
                       </div> <!-- find_password_box  -->
                </form>
            </div><!-- // member_content-->
        </div><!-- //  member_wrap-->
    </div>
</div><!-- // sub_content-->


<jsp:include page="../footer.jsp" />