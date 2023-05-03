<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import= "sge.member.model.MemberVO" %>    
 <%
	String ctxPath = request.getContextPath();
	// SemiProject
	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	String user_id = "";
	if(loginuser != null) {
		user_id = loginuser.getUser_id();
	}
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<!-- Optional JavaScript -->
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	
	
	<!-- jQueryUI CSS 및 JS -->
    <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.css" />
    <script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
    
    <!-- 아이콘 JS-->
    <script src="https://kit.fontawesome.com/b7b1b05ad5.js" crossorigin="anonymous"></script>

	<!-- 구글 icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
    <!-- original css -->
    <link href="<%=ctxPath%>/css/style.css" rel="stylesheet" type="text/css"></style>
    
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
	
<style>

	
</style>
<script>
	
	$(document).ready(function(){
		const user_id = '${user_id}';
		const userid = '<%=user_id%>';

		if(userid == "" || userid != user_id) {	
			alert("올바르지 않은 경로입니다");
			closeWindow();
			return;
		}
	});
	
	function submit_review() {
		const frm = document.review_form;
		const select_order_num = frm.select_order_num.value;

		
		if(select_order_num =="주문번호없음") {
			alert("주문하신 제품이 아니면 후기를 작성하실 수 없습니다");
			window.close();
			return;
		}
		
		if($("textarea.writing_part_poppup").val().length < 20) {
			alert("20 글자 이상 입력해주세요");
			return;
		}
		
		if(confirm("정말 작성하시겠습니까?")) {
			const user_id = '${user_id}';
			const product_num = '${param.product_num}';
			const review_rating = frm.review_rating.value;
			const review_contents = frm.review_contents.value;

 			$.ajax({
				url:"<%= request.getContextPath()%>/board/writeReview.ban",
				type:"POST",
				async:true,
				data:{
					"user_id":user_id,
					"product_num":product_num,
					"select_order_num":select_order_num,
					"review_rating":review_rating,
					"review_contents":review_contents
				},
				dataType:"JSON",
				success:function(json) {
					if(json.n == 1) {
						alert("구매 후기가 정상적으로 작성되었습니다.")
						opener.location.reload();
						window.close();
					}
					if(json.n == 0) {
						alert("구매 후기 작성과정에서 오류가 발생했습니다.")
					}
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});		
		};

	}; // end of fucntion submit_review() 

	function closeWindow() {
		self.opener=self;
		self.close();
		window.opener = window.location.href; self.close();
		window.open('about:blank','_self').close();
		
	}
</script>
</head>
<body>
	<div class="review_poppup_form">
		<h4>구매상품이 어떠셨나요?</h1>
		<div class="review_poppup_body" >
		<form name="review_form" onsubmit="return false">
			<div class="review_title_poppup">주문번호</div>
			<select name="select_order_num">
				<c:if test="${empty requestScope.odrDetailList}">
					<option value="주문번호없음">주문번호없음</option>
				</c:if>
				
				<c:if test="${not empty requestScope.odrDetailList}">
					<c:forEach var="ovo" items="${requestScope.odrDetailList}">
					<option value="${ovo.order_num}">주문번호 : ${ovo.order_num} 주문날짜 : ${ovo.order_date}</option>
					</c:forEach>
				</c:if>
			</select>
		
			<div class="review_title_poppup">구매평점</div>
			<select name="review_rating">
				<option value="5">★★★★★</option>
				<option value="4">★★★★☆</option>
				<option value="3">★★★☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="1">★☆☆☆☆</option>
			</select>
			
			<div class="review_title_poppup">리뷰 내용</div>
			<input type="hidden" name="product_num" />
			<input type="hidden" name="user_id" />
			<textarea class="writing_part_poppup" name="review_contents" maxlength="500"  placeholder="내용을 입력해주세요(500자 이하)" autocomplete="off"></textarea>
			<div class="review_title_bottom">
				<button type="button" class="btn btn-danger btn_review_submit" onclick="submit_review()">리뷰 작성하기</button>
			</div>	
		</form>
		</div>
	</div>
</body>
</html>