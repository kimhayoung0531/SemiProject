<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

 <div class="reviews_cont">
     <div class="review_header">
         <div class="review_header_tit">
             <span class="title">REVIEW</span>
         </div>
         <div class="review_header_description">
         	 <a id="writeReviewButton" class="review_header_description_link" onclick=writeReview>리뷰 작성</a>
             <a class="review_header_description_link" href="#">전체 상품 리뷰 보기</a>
         </div>
     </div>

     <table class="review_table table table-hover">
         <thead>
             <tr>
                 <th>작성자</th>
                 <th>내용</th>
                 <th>작성일</th>
             </tr>
         </thead>

         <tbody>
             <tr>
                 <td>테스트1</td>
                 <td>테스트 내용</td>
                 <td>태스트 날짜</td>
             </tr>
         </tbody>
     </table>

 </div>

<jsp:include page="../footer.jsp" />