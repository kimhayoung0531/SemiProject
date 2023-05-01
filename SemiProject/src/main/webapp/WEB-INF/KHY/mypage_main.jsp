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
    .jb-wrap {
	width: 40%;
	margin: 10px auto;
	border: 0px solid #000000;
	position: relative;
    }

    .jb-wrap img {
	width: 100%;
	vertical-align: middle;
    }

    .jb-wrap span {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
    font-weight: bold;
    font-size:20px;
	top: 47%;
	left: 43%;
    color: white;
    }
    
    li {
    float: none;
    list-style: none;
    font-size: 14px;
    display: list-item;
    }

	th {
	    font-size: 12px;
	}
</style>
    
</head>

<input style="display: none;" name='user_id' value='${sessionScope.loginuser.user_id}' />

<div id="container" style="margin-left: 12%;">
    <div id="contents">
        <!-- 본문 시작 -->

        <div class="location_wrap">
            <div class="location_cont">
                <em><a href="#" class="local_home">HOME</a> > 마이페이지</em>
            </div>
        </div>
        <!-- //location_wrap -->

        <div class="sub_content">

            <div class="side_cont">
                <div class="sub_menu_box">
                    <h2>마이페이지</h2>
                    <ul class="sub_menu_mypage">
                        <li>쇼핑정보
                            <ul class="sub_depth1">
                                <li><a href="<%= ctxPath%>/mypageOrderList.ban">- 주문목록/배송조회</a></li>
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
                                <li><a href="<%= ctxPath%>/mypageMemberChangePwdcheck.ban">- 회원정보 변경</a></li>
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

                    <!-- 마이페이지 회원 요약정보 -->


                    <!--// 마이페이지 회원 요약정보 -->


                    <div class="mypage_order_info">
                        <div class="mypage_zone_tit">
                            <h3>진행 중인 주문<span>최근 30일 내에 진행중인 주문정보입니다.</span></h3>
                        </div>
                        <div class="mypage_order_info_cont">
                            <ol>
                                <li class="jb-wrap">
                                </li>
                                <li class="jb-wrap">
                                    <b>입금대기</b>
                                    <img src="image/mypgae_ing_list_bg.png" alt="">
                                    <span>0</span>

                                </li>
                                <li class="jb-wrap">
                                    <b>결제완료</b>
                                    <img src="image/mypgae_ing_list_bg.png" alt="">
                                    <span>0</span>

                                </li>
                                <li class="jb-wrap">
                                    <b>상품준비중</b>
                                    <img src="image/mypgae_ing_list_bg.png" alt="">
                                    <span>0</span>

                                </li>
                                <li class="jb-wrap">
                                    <b>배송중</b>
                                    <img src="image/mypgae_ing_list_bg.png" alt="">
                                    <span>0</span>
 
                                </li>
                                <li class="jb-wrap">
                                    <b>배송완료</b>
                                    <img src="image/mypgae_ing_list_bg.png" alt="">
                                    <span>0</span>

                                </li>
                                <li class="jb-wrap">
                                    <b>구매확정</b>
                                    <img src="image/mypgae_ing_list_bg.png" alt="">
                                    <span>0</span>

                                </li>
                            </ol>
                            <div class="order_case_list">
                                <ul>
                                    <li>
                                        <b>&bull; 취소</b>
                                        <span>0건</span>
                                    </li>
                                    <li>
                                        <b>&bull; 교환</b>
                                        <span>0건</span>
                                    </li>
                                    <li>
                                        <b>&bull; 반품</b>
                                        <span>0건</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- //mypage_order_info_cont -->
                    </div>
                    <!-- //mypage_order_info -->

                    <div class="mypage_lately_info">
                        <div class="mypage_zone_tit">
                            <h3>최근 주문 정보<span>최근 30일 내에 주문하신 내역입니다.</span></h3>
                        </div>

                        <div class="mypage_lately_info_cont">
                            <!-- 주문상품 리스트 -->
                            <div class="mypage_table_type">
                                <table>
                                    <colgroup>
                                        <col style="width:15%"> <!-- 날짜/주문번호 -->
                                        <col> <!-- 상품명/옵션 -->
                                        <col style="width:15%"> <!-- 상품금액/수량 -->
                                        <col style="width:15%"> <!-- 주문상태 -->
                                        <col style="width:15%"> <!-- 확인/리뷰 -->
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>날짜/주문번호</th>
                                            <th>상품명</th>
                                            <th>상품금액/수량</th>
                                            <th>주문상태</th>
                                            <th>
                                                확인/리뷰
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:if test="${empty requestScope.orderList}">	
	                                        <tr>
	                                            <td colspan="6">
	                                                <p class="no_data">조회내역이 없습니다.</p>
	                                            </td>
	                                        </tr>
	                                    </c:if>
	                                     
	                                    <c:if test="${not empty requestScope.orderList}">
							               <c:forEach var="odvo" items="${requestScope.orderList}" varStatus="status"> 
							                   <tr>
							                        <td> <%-- 체크박스 및 제품번호 --%>
							                             <%-- c:forEach 에서 선택자 id를 고유하게 사용하는 방법  
							                                  varStatus="status" 을 이용하면 된다.
							                                  status.index 은 0 부터 시작하고,
							                                  status.count 는 1 부터 시작한다. 
							                             --%>  <%-- 날짜 및 주문번호 --%> 
							                            <span class="product_title">${odvo.ovo.order_date}</span><br>
							                            <span class="product_title">${odvo.order_details_num}</span>
							                        </td>
							                        <td align="center"> <%-- 상품명 --%> 
							                           <a href="/MyMVC/shop/prodView.up?pnum=${cartvo.pnum}"><!-- 제품상세페이지 링크 -->
							                              <img src="/MyMVC/images/${cartvo.prod.pimage1}" class="img-thumbnail" width="130px" height="100px" />
							                           </a> 
							                           <br/><span class="product_title">${odvo.pvo.product_title}</span> 
							                        </td>
							                        <td align="center"> 
							                            <%-- 상품 금액 및 주문 수량 --%>
							                              <fmt:formatNumber value="${odvo.product_selling_price}" pattern="###,###" /> 원<br>
							                              <span class="order_quantity">${odvo.order_quantity}</span> 개
							                              
							                        </td>
							                        <td align="right"> <%-- 주문상태 --%> 
							                            <span class="order_quantity">${odvo.delivery_status}</span>
							                            
							                        </td>
							                        <td align="right"> <%-- 리뷰 --%> 
							                            
							                            <%-- 리뷰 작성한거 끌어오기 안썼으면 작성하기 버튼 생성 --%>
							                            
							                        </td>
							                      </tr>
							                 </c:forEach>
							            </c:if>    
                                        
                                    </tbody>
                                </table>
                            </div>


                    	</div>
                     	 <!-- //mypage_lately_info_cont -->
                      <a href="../mypage/order_list.php" class="btn_board_more">+ 더보기</a>
                    </div>
                    <!-- //mypage_lately_info -->

                    

                </div>
                <!-- //mypage_main -->

            </div>
            <!-- //content -->

        </div>
        <!-- //sub_content -->
    </div>
    <!-- //본문 끝 contents -->
</div>
<!-- //container -->

<jsp:include page="../footer.jsp" />    
