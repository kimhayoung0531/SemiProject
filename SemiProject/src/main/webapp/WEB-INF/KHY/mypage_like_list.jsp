<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%
	String ctxPath = request.getContextPath();
	
%>    



<jsp:include page="../header.jsp" />    


<style>
	
    #container {
        width: 80%;
        margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
        
    }
    #contents {
        margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
    }

    .mypage_lately_info .btn_board_more{position:absolute; top:7px; right:5px; font-size:12px;}
    .mypage_lately_info .btn_board_more:hover{text-decoration:underline;}

    .mypage_order_info_cont ol li{display:inline-block; width:15%; min-width:66px; padding:0 10px 0 30px; font-size:13px; background:url('../../img/mypage/mypgae_ing_next_bg.png') no-repeat left 50px; text-align:center;}
    .mypage_order_info_cont ol li:first-child { display: none;}

    
    li {
    float: none;
    list-style: none;
    font-size: 14px;
    display: list-item;
    }

	th {
	    font-size: 12px;
	}
	
	.date_check_calendar{position:relative; float:left; width:30.5%;  height: 50px; }
	.date_check_calendar .anniversary {
	width:45%; height: 62%; background:url('<%=ctxPath%>/image/icon_calendar.png') no-repeat right center;
	font-size: 14px; border: 1px solid #d6d6d6; padding-left : 10px;
	}
	em {
		font-size : 18px;
		font-weight: bold;
		color : white;
		background-color: gray;
		height: 100%;
		display: inline-block;
	    float: left;
	    min-width: 100px;
	    height: 31px;
	    color: #ffffff;
		text-align: center;
	}

	.pagination li a, .pagination li span {
    display: block;
    padding: 0 !important;
    height: 30px;
    width: 50px;
    color: #888;
    font-size: 11px;
    line-height: 30px;
    margin-top: 15px;
}
	
	
</style>


<script type="text/javascript">

</script>
     
     

    
</head>

<div id="container" style="margin-left: 12%;">
    <div id="contents">
        <!-- 본문 시작 -->

        
        <div class="sub_content">

            <div class="side_cont">
                <div class="sub_menu_box">
                    <h2>마이페이지</h2>
                    <ul class="sub_menu_mypage">
                        <li>쇼핑정보
                            <ul class="sub_depth1">
                                <li><a href="../mypage/order_list.php">- 주문목록/배송조회</a></li>
                                <li><a href="../mypage/cancel_list.php">- 주문취소</a></li>
                                <li><a href="../mypage/wish_list.php">- 좋아요리스트</a></li>
                            </ul>
                        </li>
                        <li>고객센터
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_qa.php">- 1:1 문의</a></li>
                            </ul>
                        </li>
                        <li>회원정보
                            <ul class="sub_depth1">
                                <li><a href="../mypage/my_page_password.php">- 회원정보 변경</a></li>
                                <li><a href="../mypage/hack_out.php">- 회원 탈퇴</a></li>
                                <li><a href="../mypage/mileage.php">- 마일리지</a></li>
                            </ul>
                        </li>
                        <li>나의 상품문의
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_goods_qa.php">- 나의 상품문의</a></li>
                            </ul>
                        </li>
                        <li>나의 상품후기
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_goods_review.php">- 나의 상품후기</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- //sub_menu_box -->

            </div>
            <!-- //side_cont -->

            <div class="content">
                <div class="mypage_main">

                     <div class="mypage_lately_info">
                        <div class="mypage_zone_tit">
                            <h3>좋아요 내역</h3>
                        </div>

						    <span class="pick_list_num">
                                좋아요 내역 총 <strong>${requestScope.count}</strong> 건
                            </span>

                            <!-- 좋아요 리스트 -->
                            <div class="mypage_lately_info_cont">
                            <!-- 좋아요 리스트 -->
                            <div class="mypage_table_type">
                                <table>
                                    <colgroup>
                                        <col> <!-- 상품명 -->
                                        <col style="width:19%"> <!-- 상품금액-->
                                        <col style="width:19%"> <!-- 재고 -->
                                        <col style="width:19%"> <!-- 적립마일리지 -->
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>상품명</th>
				                            <th>상품금액</th>
				                            <th>재고</th>
				                            <th>적립마일리지</th>
				                        </tr>
                                    </thead>
                                    <tbody>
										<c:if test="${empty requestScope.likeList}">	
	                                        <tr>
	                                            <td colspan="6">
	                                                <p class="no_data">조회내역이 없습니다.</p>
	                                            </td>
	                                        </tr>
	                                    </c:if>
	                                     
	                                    <c:if test="${not empty requestScope.likeList}">
							               <c:forEach var="pvo" items="${requestScope.likeList}" varStatus="status"> 
							                   <tr>
							                        <td> <%-- 체크박스 및 제품번호 --%>
							                             <%-- c:forEach 에서 선택자 id를 고유하게 사용하는 방법  
							                                  varStatus="status" 을 이용하면 된다.
							                                  status.index 은 0 부터 시작하고,
							                                  status.count 는 1 부터 시작한다. 
							                             --%>  <%-- 상품명 --%> 
							                            <a href="/MyMVC/shop/prodView.up?pnum=${cartvo.pnum}"><!-- 제품상세페이지 링크 -->
							                              <img src="/MyMVC/images/${cartvo.prod.pimage1}" class="img-thumbnail" width="130px" height="100px" />
							                           </a> 
							                           <br/><span class="product_title">${pvo.product_title}</span> 
							                        </td>
							                        <td align="center"> <%-- 상품금액 --%> 
							                           <fmt:formatNumber value="${pvo.product_price}" pattern="###,###" /> 원<br>
							                        </td>
							                        <td align="center"> 
							                            <%-- 재고--%>
							                              <span class="order_quantity">${pvo.product_inventory}</span> 개
							                        </td>
							                       <td align="center"> <%-- 적립마일리지 --%> 
							                            <fmt:formatNumber value="${pvo.product_price*0.01}" pattern="###,###" /> 원<br>
							                        </td>
							                      </tr>
							                 </c:forEach>
							            </c:if>    
                                        
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <!-- //mypage_lately_info_cont -->
                    </div>
                    <!-- //mypage_lately_info -->


                    <div class="pagination">
                        <div class="pagination">
                            <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
                        </div>
                    </div>
                    <!-- //pagination -->

                </div>
                <!-- //mypage_cont -->

            </div>
            <!-- //content -->


        </div>
        <!-- //sub_content -->
    </div>
    <!-- //본문 끝 contents -->
</div>
<!-- //container -->

<jsp:include page="../footer.jsp" />    
