<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />

<script>
	$(document).ready(function(){
		
		  $("span.error").hide();
		
		  // === 체크박스 전체선택/전체해제 === // 
		   $("input:checkbox[id='checkall']").click(function(){

		  	   const bool = $(this).prop("checked"); 

			   $("input:checkbox[name='termAgree']").prop("checked", bool);
			

		   });// end of $("input:checkbox[id='checkall']").click(function()
				   
				   
		   $("input:checkbox[name='termAgree']").click(function(event){
			   
			   const bool = $(event.target).prop("checked");
			   // 클릭한 체크박스의 체크유무를 알아온다.
			   
			   if(!bool) {
				   $("input:checkbox[id='checkall']").prop("checked", false);
			   }
			   
			   else {
				  
				   let b_flag = false;
				   $("input:checkbox[name='termAgree']").each(function(i, element) {
				   	
					   if( !$(element).prop("checked") ) {
					       // 반복을 하면서 해당 체크박스가 체크가 되었는지 체크가 해제 되었는지를 알아온다.
					       // 해당 체크박스가 체크가 해제되어진 경우이라면 
						   b_flag = true;
					       return false;  
					   }
					   
				   }); // end of $("input:checkbox[name='termAgree']").each(function(i, element) {})-------------
				   
				   if(!b_flag) {
					   // "전체선택/전체해제 체크박스"에 체크를 넣고자 한다.
					   $("input:checkbox[id='checkall']").prop("checked", true);
					   
				   }
			   } 
		   });// end of $("input:checkbox[name='termAgree']").click(function(){})-----
		   

	});// end of $(document).ready(function()
			
	function goNext(){
		if( $("input:checkbox[id='checkall']").prop("checked") == false){
			  alert("이용약관에 동의해주세요");	 
			  
		}
		else{
			const frm = document.agreementAll;
			frm.action = "<%= ctxPath%>/memberRegister.ban";
			frm.method = "get";
			frm.submit();
			
		}
		
	}// end of goNext
			
</script>
 <div class="sub_content">
     <div class="content_box">
         <div class="join_agreement_wrap">
             <div class="member_title">
                 <h2>회원가입 </h2>

                 <ol>
                     <li class="page_on">
                         <span>01</span>
                         약관동의
                         <span>
                             <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                 alt="약관동의완료">
                         </span>
                     </li>
                     <li>
                         <span>02</span>
                         정보입력
                         <span>
                             <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                 alt="약관동의완료">
                         </span>
                     </li>
                     <li>
                         <span>03</span>
                         가입완료
                         <span>
                             <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                 alt="약관동의완료">
                         </span>

                     </li>
                 </ol>
             </div>


             <div class="member_cont" id="agreement_content">
                 <form name="agreementAll">
                     <h3>약관동의</h3>
                     <div class="join_agreement_cont">
                         <div class="form_element checkAll_box">
                             <input type="checkbox" id="checkall" name="checkall">
                             <label for="checkall" class="em_strong">
                                 <em>주식회사 카페노리의 모든 약관을 확인하고 전체 동의합니다.</em>
                             </label>
                             <span>(전체동의,선택항목도 포합됩니다.)</span>
                         </div>

                         <div class="join_agreement_box">
                             <div class="form_element">
                                 <input type="checkbox" id="termAgree1" name="termAgree" />
                                 <label for="termAgree1">
                                     <strong>(필수)</strong>
                                     이용약관
                                 </label>
                                 
                             </div>
                             <div>
                                 <iframe src="<%= ctxPath %>/sge_iframe/agreement.html" width="85%" height="150px"
                                     class="iframeBox"></iframe>
                             </div>
                         </div>

                         <div class="join_agreement_box">
                             <div class="form_element">
                                 <input type="checkbox" id="termAgree2" name="termAgree" />
                                 <label for="termAgree2">
                                     <strong>(필수)</strong>
                                     개인정보 수집 및 이용
                                 </label>
                                 
                             </div>
                             <div>
                                 <iframe src="<%= ctxPath %>/sge_iframe/agreement.html" width="85%" height="150px"
                                     class="iframeBox"></iframe>
                             </div>
                         </div>

                    
                     	
                   
                     </div> <!--//join_agreement_cont -->
                     <div class="btn_center_box">
                         <span class="error">모든약관을 동의 해주세요</span>
                         <button type="button" id="btnNextStep" class="btn_member_next"  onclick="goNext();" >다음단계 </button>
                     </div>
                 </form>
             </div><!--member_cont-->
         </div>
     </div>
 </div> <!--//sub_ contents-->
<jsp:include page="../footer.jsp" />
