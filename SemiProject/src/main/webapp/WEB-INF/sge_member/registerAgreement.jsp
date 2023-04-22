<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath();
%>
<jsp:include page="../header.jsp" />
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


             <div class="member_cont">
                 <form>
                     <h3>약관동의</h3>
                     <div class="join_agreement_cont">
                         <div class="join_agreement_box">
                             <input type="checkbox" id="all_agree">
                             <label for="all_agree">
                                 <strong>주식회사 카페노리의 모든 약관을 확인하고 전체 동의합니다.</strong>
                             </label>
                             <span>(전체동의,선택항목도 포합됩니다.)</span>
                         </div>

                         <div class="join_agreement_box">
                             <div class="form_element">
                                 <input type="checkbox" id="termAgree1" name="" />
                                 <label for="termAgree1">
                                     <strong>(필수)</strong>
                                     이용약관
                                 </label>
                                 <span><a>전체보기</a></span>
                             </div>
                             <div>
                                 <iframe src="<%= ctxPath %>/sge_iframe/agreement.html" width="85%" height="150px"
                                     class="iframeBox"></iframe>
                             </div>
                         </div>

                         <div class="join_agreement_box">
                             <div class="form_element">
                                 <input type="checkbox" id="termAgree2" name="" />
                                 <label for="termAgree2">
                                     <strong>(필수)</strong>
                                     개인정보 수집 및 이용
                                 </label>
                                 <span><a>전체보기</a></span>
                             </div>
                             <div>
                                 <iframe src="<%= ctxPath %>/sge_iframe/agreement.html" width="85%" height="150px"
                                     class="iframeBox"></iframe>
                             </div>
                         </div>

                         <div class="warning_checkAll">
                             <strong class="important_check_box">(필수)이용약관을 체크해주세요</strong>
                         </div>
                     </div> <!--//join_agreement_cont -->
                     <div class="btn_center_box">
                         <button type="button" id="btnNextStep" class="btn_member_next"  onclick="location.href='<%= ctxPath%>/memberRegister.ban'" >다음단계 </button>
                     </div>
                 </form>
             </div><!--member_cont-->
         </div>
     </div>
 </div> <!--//sub_ contents-->
<jsp:include page="../footer.jsp" />
