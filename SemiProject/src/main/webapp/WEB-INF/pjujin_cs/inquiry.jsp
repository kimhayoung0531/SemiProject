<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<%
   String ctxPath = request.getContextPath();     
%>    
    
<jsp:include page="../header.jsp" />

 <script>
 
    $(document).ready(function(){
    	
    	// 제품이미지 미리 보여주기
		$(document).on("change", "input.img_file", function(e){
        	
        	const input_file = $(e.target).get(0);
                	
            console.log(input_file.files);
        	
            console.log(input_file.files[0]);
           
            
            console.log(input_file.files[0].name);
         	
            const fileReader = new FileReader();
            
            fileReader.readAsDataURL(input_file.files[0]); 
         	
            fileReader.onload = function() { 
               console.log(fileReader.result);
            
               document.getElementById("previewImg").src = fileReader.result;
           };
         	
        }); 
		// == 제품이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 끝 == //
    	
    
 
	// 상품문의 등록하기
	$("input#pjj_btn_write_ok").click(function(){
			
			let flag = false;
			
			$(".pjj_tune").each(function(index, elmt){
				const val = $(elmt).val().trim();
				if(val == "") {
					$(elmt).next().show();
					flag = true;
					return false;
				}
			});
			
			if(!flag) {
				
				if($("[name='user_id']").val()==""){
			         alert("작성자를 입력해주세요.");
			         return false;
			       }
				if($("[name='inquiry_title']").val()==""){
			         alert("제목을 입력해주세요.");
			         return false;
			       }
				if($("[name='inquiry_text']").val()==""){
			         alert("문의내용을 입력해주세요.");
			         return false;
			       }
				
				
				const frm = document.frmWrite;
				frm.submit();
			}
			
		});
 
    });// end of $(document).ready(function()------
    
 </script> 



<div class="pjj_notice">
<div class="pjj_notice_zone_sec">
	<div class="pjj_notice_zone_tit">
		<h2>상품문의</h2>
	</div>
	<div class="pjj_notice_zone_cont">
		<form name="frmWrite" action="<%= request.getContextPath()%>/inquiry.ban" method="post" enctype="multipart/form-data">
			

			
				<div class="pjj_notice_write_box">
					<table class="pjj_notice_write_table">
						<colgroup>
							<col style="width:15%">
							<col style="width:85%">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">작성자</th>
							<td>
								<input type="text" class="text" name="user_id">
							</td>
						</tr>
						
						<tr>
							<th scope="row">상품 선택</th>
							<td>
								<div>
									<span class="js_selected_info_text" name="product_num">선택된 상품이 없습니다.</span>
									<a href="http://localhost:9090/SemiProject/notice.ban" title="찾아보기" class="pjj_btn_goods_select"> 상품 선택 </a>
								</div>
								
							</td>
						</tr>
						<tr>
							<th scope="row">제목
							</th><td><input type="text" name="inquiry_title" value=""></td>
						</tr>
						<tr>
							<th scope="row">본문</th>
							<td>
								
								<textarea id="pjj_editor" name="inquiry_text" cols="30" rows="10"></textarea>
							</td>
						</tr>
			
						<tr>
                            <th class="pjj_file_upload_sec">첨부파일</th>
                            <td>
                                <div class="pjj_btn_upload_box"></div>
                               <input type="file" class="img_file" name="prdmanualFile" />
                                
                            </td>
                         </tr>
                         <tr>	
                         	  
					          <td class="prodInputName" style="padding: 10px 10px 10px 20px; font-weight: 800;">이미지파일 미리보기</td>
					          <td>
					          	 <div class="pjj_btn_upload_box"></div>
					             <img id="previewImg" width="100"/>
					          </td>
					    </tr>
						</tbody>
					</table>
				</div>
				<!-- //pjj_notice_write_box -->
				

			
			

			<div class="pjj_btn_center_box">
				<button type="button" class="pjj_btn_before" onclick="javascript:history.back()"><strong>이전</strong></button>
				<input type="button" value="저장" class="pjj_btn_write_ok" id="pjj_btn_write_ok" />
			</div>

		</form>
	</div>
	<!-- //board_zone_cont -->

</div>
</div>








<jsp:include page="../footer.jsp" /> 
    