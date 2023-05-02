<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
<jsp:include page="../header.jsp" />

 <script>
 
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
			const frm = document.frmWrite;
			frm.submit();
		}
		
	});
 
 
 </script> 



<div class="pjj_notice">
<div class="pjj_notice_zone_sec">
	<div class="pjj_notice_zone_tit">
		<h2>상품문의</h2>
	</div>
	<div class="pjj_notice_zone_cont">
		<form name="frmWrite" id="frmWrite" action="<%= request.getContextPath()%>/inquiry.ban" method="post" enctype="multipart/form-data" class="frmWrite" >
			

			<div>
				<div class="pjj_notice_write_box">
					<table class="pjj_notice_write_table">
						<colgroup>
							<col style="width:15%">
							<col style="width:85%">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">말머리</th>
							<td>
								<div class="pjj_category_select">
									<select class="pjj_tune" id="category" name="category" style="width:127px;"><option value="">문의내용</option><option value="상품">상품</option><option value="배송">배송</option><option value="반품/환불">반품/환불</option><option value="교환/변경">교환/변경</option><option value="기타">기타</option></select>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>
								<input type="text" class="text" name="writerNm" value="">
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" class="text" name="writerPw"></td>
						</tr>
						<tr>
							<th scope="row">상품 선택</th>
							<td>
								<div>
									<span class="js_selected_info_text">선택된 상품이 없습니다.</span>
									<a href="" title="찾아보기" class="pjj_btn_goods_select"> 상품 선택 </a>
									
								</div>
								
							</td>
						</tr>
						<tr>
							<th scope="row">제목
							</th><td><input type="text" name="subject" value=""></td>
						</tr>
						<tr>
							<th scope="row">본문</th>
							<td>
								<div>
									<input type="checkbox" id="secret1" name="isSecret" value="n">
									<label  for="secret1">비밀글</label>
								</div>
								<textarea id="pjj_editor" name="contents" cols="30" rows="10"></textarea>
							</td>
						</tr>
			
						<tr>
                            <th class="pjj_file_upload_sec">첨부파일</th>
                            <td>
                                <div class="pjj_btn_upload_box"></div>
                               <input type="file" class="pjj_file_text" name="prdmanualFile" />
                                
                            </td>
                         </tr>
						</tbody>
					</table>
				</div>
				<!-- //pjj_notice_write_box -->
				

			</div>
			<!-- //board_zone_write -->

			<div class="pjj_btn_center_box">
				<button type="button" class="pjj_btn_before" onclick="javascript:history.back()"><strong>이전</strong></button>
				<button type="button" class="pjj_btn_write_ok" id="pjj_btn_write_ok"><strong>저장</strong></button>
			</div>

		</form>
	</div>
	<!-- //board_zone_cont -->

</div>
</div>








<jsp:include page="../footer.jsp" /> 
    