<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>
    
<jsp:include page="../header.jsp" />

<script type="text/javascript">

$(document).ready(function(){

	     // 제품 재고량에 스피너 달아주기 
	      $("input#spinnerPqty").spinner({
	         spin:function(event,ui){
	            if(ui.value > 100) {
	               $(this).spinner("value", 100);
	               return false;
	            }
	            else if(ui.value < 1) {
	               $(this).spinner("value", 1);
	               return false;
	            }
	         }
	      });// end of $("#spinnerPqty").spinner()--------
	      
	      //제품 등록하기 
	      $("input#btnRegister").click(function(){
	    	  
	    	  let flag = false;
	    	  
	    	  
	    	  $(".infoData").each(function(index, elmt){
	    		  const val = $(elmt).val().trim();
	    		  if(val == ""){
	    			  $(elmt).next().show();
	    			  flag = true;
	    			  return false;
	    		  }
	    		  
	    	  });
	    	  if(!flag) {
	    		  const frm = document.prodInputFrm;
	    		  frm.submit();
	    	  }
	      });
	      
	      // 취소
	      $("input[type='reset']").click(function(){
	    	  $("span.error").hide();
	    	  $("div#divfileattach").empty();  
	      });

});// end of document ready()

</script>
   <div class="sub_content">
       <div class="content_box">
           <div class="join_agreement_wrap">
               <div class="member_title">
                   <h2>제품 등록하기(관리자 전용) </h2> 
               </div>

               <div class="member_cont">
                   <form id="formJoin" name="prodInputFrm" action="<%= request.getContextPath()%>/shop/admin/productRegister.up"  method="POST" enctype="multipart/form-data" >
                       <div class="base_info_box">
                           <div class="base_info_sec">
                               <table id="tblMemberRegister">
                                   <colgroup>
                                       <col width="25%">
                                       <col width="75%">
                                   </colgroup>
                                   <tbody>
                                       <tr>
                                           <th>
                                               <span>카테고리</span>
                                           </th>
                                           <td>
                                           		<select name="fk_cnum" class="infoData">
										            <option value="">선택하세요</option>
										            
										            <c:forEach var="cvo" items="${requestScope.categoryList}">
										             	<option value="${cvo.category_num}">${cvo.category_name}</option>
										            </c:forEach>
										         </select>
                                           </td> 
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>상품명</span>
                                           </th>
                                           <td>
                                           	   <input type="text" id="prodName" name="prodName"/> 
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>상품 대표 이미지</span>
                                           </th>
                                           <td >
									         <input type="file" name="pimage1" style="border: none;" class="infoData img_file" accept='image/*'  />			   
									      </td>
                                       </tr>
                                
                                       <tr>
                                           <th>
                                               <span>제품 판매가</span>
                                           </th>
                                           <td >
									         <input type="text" name="saleprice" class="box infoData" /> 원
								
									      </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>제품 재고량</span>
                                           </th>
                                           <td>
                                              <input id="spinnerPqty" name="pqty" value="1" style="border: none;"> 개
                                           </td>
                                       </tr>
                                       <tr>
                                           <th>
                                               <span>상품 상세</span>
                                           </th>
                                           <td>
			    							    <textarea name="pcontent" rows="5" cols="60"></textarea>
                                           </td>
                                       </tr>
                                     
                                       

                                   </tbody>
                               </table>
                           </div> <!--//join_agreement_cont -->
                           <div class="btn_center_box">
                               <button type="reset" id="btnReset" class="btn_cancle">취소
                               </button>
                               <button type="button" id="goToRegis" onclick="goRegister();" class="btn_register">등록하기
                               </button>
                           </div>
                        </div>
                   </form>
               </div><!--member_cont-->
           </div>
       </div>
   </div> <!--//sub_ contents-->
  <jsp:include page="../footer.jsp" />
   
