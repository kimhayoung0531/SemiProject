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
                       <li>
                           <span>01</span>
                           약관동의
                           <span>
                               <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                   alt="약관동의완료">
                           </span>
                       </li>
                       <li class="page_on">
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
                   <form id="formJoin" name="formJoin">
                       <div class="base_info_box">
                           <span class="important">* 표시는 반드시 입력하셔야하는 항목입니다</span>
                           <h3>기본정보</h3>

                           <div class="base_info_sec">
                               <table id="tblMemberRegister">
                                   <colgroup>
                                       <col width="25%">
                                       <col width="75%">
                                   </colgroup>
                                   <tbody>
                                       <tr>
                                           <th>
                                               <span class="important">* 아이디</span>
                                           </th>
                                           <td>
                                               <div>
                                                   <input type="text" id="userid" name="userid" class="requiredInfo" />
                                                   <button class="btn_double_check"> 아이디 중복 체크</button>
                                                   <span class="error" style="color:red;">아이디는 필수입력 사항입니다.</span>
                                               </div>
                                           </td> 
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 비밀번호</span>
                                           </th>
                                           <td><input type="password" id="pwd" name="pwd" class="requiredInfo"
                                                   autocomplete="off" />
                                               <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 비밀번호확인</span>
                                           </th>
                                           <td>
                                           	<input type="password" id="pwdcheck"  name="pwdcheck" class="requiredInfo"
                                                   autocomplete="off" />
                                               <span class="error" style="color:red;">비밀번호가 같지 않습니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 이름</span>
                                           </th>
                                           <td><input type="text" id="name" class="requiredInfo"
                                                   autocomplete="off" />
                                                <span class="error">성명은 필수입력 사항입니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 이메일</span>

                                           </th>
                                           <td>
                                               <input type="text" id="email" class="requiredInfo" />
                                               <button class=" btn_double_check"> 이메일 중복 체크</button>
                                               <span class="error">이메일 형식에 맞지 않습니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 휴대폰 번호</span>
                                           </th>
                                           <td>
                                               <input type="text" id="hp1" name="hp1" size="3" maxlength="3" value="010" readonly />&nbsp;-&nbsp;
			    							    <input type="text" id="hp2" name="hp2" size="4" maxlength="4" />&nbsp;-&nbsp;
			    							    <input type="text" id="hp3" name="hp3" size="4" maxlength="4" />
				    							<span class="error">휴대폰 형식이 아닙니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">유선번호(선택)</span>
                                           </th>
                                           <td>
                                               <input type="text" id="hp1" name="hp1" size="3" maxlength="3" value="02" readonly />&nbsp;-&nbsp;
			    							    <input type="text" id="hp2" name="hp2" size="4" maxlength="4" />&nbsp;-&nbsp;
			    							    <input type="text" id="hp3" name="hp3" size="4" maxlength="4" />
				    							<span class="error">유선번호 형식이 아닙니다.</span>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span class="important">* 주소</span>
                                           </th>
                                           <td class="member_address">
                                               <div class="address_postcode">
                                                   <input type="text" id="postcode" name="postcode" size="4" class="requiredInfo" />
                                                   <button type="button" id="btnPostcode"
                                                       class="btn_post_search btn_double_check"> 우편번호
                                                       검색</button>
                                                   <span class="error">우편번호 형식이 아닙니다.</span>
                                               </div>
                                               <div class="address_input">
		    <input type="text" id="address" name="address" class="requiredInfo" placeholder="주소"/>
                                                   <input type="text" id="detail_email"
                                                       class="requiredInfo" placeholder="상세주소" />
						<span class="error">주소를 입력하세요</span>
                                                   <input type="text" id="extra_address" placeholder="부가주소"
                                                       class="extra_address" />
                                                       
                                               </div>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>생일</span>
                                           </th>
                                           <td>
                                               <input type="text" id="birthday" class="birthday" />
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>성별</span>
                                           </th>
                                           <td>
                                               <div class="from_element">
                                                   <ul id="genderList">
                                                       <li>
                                                           <input type="radio" id="male" name="male"
                                                               value="1" />
                                                           <label for="idle1" style="margin-right:28px;">남자</label>
                                                       </li>
                                                       <li>
                                                           <input type="radio" id="female" name="female"
                                                               value="3" />
                                                           <label for="idle3" >여자</label>
                                                       </li>
                                                
                                                   </ul>
                                               </div>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>휴먼회원 방지기간</span>
                                           </th>
                                           <td>
                                               <div class="from_element">
                                                   <ul id="idle_mem">
                                                       <li>
                                                           <input type="radio" id="idle1" name="idle"
                                                               value="1" />
                                                           <label for="idle1" class="">1년</label>
                                                       </li>
                                                       <li>
                                                           <input type="radio" id="idle3" name="idle"
                                                               value="3" />
                                                           <label for="idle3" class="">3년</label>
                                                       </li>
                                                       <li>
                                                           <input type="radio" id="idle5" name="idle"
                                                               value="5" />
                                                           <label for="idle5" class="">5년</label>
                                                       </li>
                                                   </ul>
                                               </div>
                                           </td>
                                       </tr>
                                   </tbody>
                               </table>
                           </div> <!--//join_agreement_cont -->
                           <div class="btn_center_box">
                               <button type="button" id="btnReset" class="btn_cancle">취소
                               </button>
                               <button type="button" id="goToRegis" class="btn_register">회원가입
                               </button>
                           </div>
                        </div>
                   </form>
               </div><!--member_cont-->
           </div>
       </div>
   </div> <!--//sub_ contents-->
  <jsp:include page="../footer.jsp" />
   
