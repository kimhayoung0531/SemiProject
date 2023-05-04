<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:include page="../header.jsp" />


<div class="pjj_notice">
<div class="pjj_notice_zone_sec">
	<div class="pjj_notice_zone_tit">
		<h2>공지사항</h2>
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
							<th scope="row">본문</th>
							<td>
								<div>
									
									
								</div>
								<textarea id="pjj_editor" name="contents" cols="30" rows="10"></textarea>
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
				
			</div>

		</form>
	</div>
	<!-- //board_zone_cont -->

</div>
</div>





<jsp:include page="../footer.jsp" />    