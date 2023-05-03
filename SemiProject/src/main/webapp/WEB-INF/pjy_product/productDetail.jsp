<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import= "parkjuneyub.board.model.ReviewVO" %>    
<%@ page import= "parkjuneyub.member.model.*" %> 
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
<jsp:include page="../header.jsp" />
	 
	<style>
	  a#writeReviewButton {
	  	margin-right:75px;
	  	cursor: pointer;
	  }
	</style> 
	 
<script type="text/javascript">
	
	$(document).ready(function(){

		$("div.add_cart_layer_popup").hide();		//팝업창 가리기
		
		
		////////////////////준엽님 한 부분 ///////////////////
		
		const user_id = "<%= user_id%>";
		const product_num = "${requestScope.pvo.product_num}";
		// 좋아요 리스트에 등록되어 있는지 체크
		$.ajax({
	        	url:"<%= request.getContextPath()%>/product/checkLike.ban",
	        	type:"POST",
	        	data: {
	        		"user_id":user_id,
	        		"product_num":product_num
	        	},
	        	dataType: "JSON",
	        	success:function(json){
	        		if(json.n == '1') {
	        			$("button.btn_add_wish").css("background-color","rgba(rgba(156, 84, 64, 0.62))");
	        		}
	        		if(json.n == '0') {
	        			$("button.btn_add_wish").css("background-color","");
	        		}
	        	}, 	
	            error: function(request, status, error){
                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		          }
	           });    
		
		
		var count = Number($("input#item_cnt").val());
		var price = ${requestScope.pvo.product_price};

		$("input[name=product_price]").val(price);
		var total_price = count * price; // 총 상품 금액
		$("input[name=total_price]").val(total_price);
		
		$("input#product_cnt").val($("input#item_cnt").val());
		
		
		
		$("input#item_cnt").bind("change", function() {
			count = Number($("input#item_cnt").val());
			price = ${requestScope.pvo.product_price};
			total_price = count * price;

			$("strong.goods_total_price").text(total_price);
			$("input#product_cnt").val(count);
			
		});
		
		$("button.btn_add_order").bind("click", function() {
			const frm = document.itemFrmView;
			frm.action = "<%= request.getContextPath() %>/order.ban";
			frm.submit();
		});
		
		// ==== 상품 좋아요 기능
		$("button.btn_add_wish").click(function(event){
			if(user_id == '') {
				alert("로그인하셔야만 좋아요를 누르실 수 있습니다");

			}
			else  {
				$("button.btn_add_wish").toggleClass("changeCSSname");
				
				if( $(event.target).is(".material-symbols-outlined") ) { 
					
					if($(event.target).parent().is(".changeCSSname")) {	
					   $("button.btn_add_wish").css("background-color","rgba(rgba(156, 84, 64, 0.62))");
					}
					else {
						$("button.btn_add_wish").css("background-color","");
					}
				}
				
				else {
	                
					if($(event.target).is(".changeCSSname")) {	
						$(event.target).css("background-color","rgba(rgba(156, 84, 64, 0.62))");
					}
					else {
						$("button.btn_add_wish").css("background-color","");
					}
				}
            //	선택자.toggleClass("클래스명1");
	        //  이것은 선택자에 "클래스명1" 이 이미 적용되어 있으면 선택자에 "클래스명1" 을 제거해주고,
	        //  만약에 선택자에 "클래스명1" 이 적용되어 있지 않으면 선택자에 "클래스명1" 을 추가해주는 것.

	        /* 한마디로 addClass("클래스명1") 와 removeClass("클래스명1") 를 합친 것 이라고 보면 된다. */
               
	        
	        $.ajax({
	        	url:"<%= request.getContextPath()%>/product/addLike.ban",
	        	type:"POST",
	        	data: {
	        		"user_id":user_id,
	        		"product_num":product_num
	        	},
	        	dataType: "JSON",
	        	success:function(json){
	        		if(json.n == '1') {
	        			
	        		}
	        	}, 	
	            error: function(request, status, error){
                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		          }
	           });    
			};

        
    	}); // end of $("div#firstDiv").find("label").click(function(event)
    	// ==== 상품 좋아요 기능 끝
		
	}); // end of $(document).ready(function(){})--------------------------------
	
	
	// ==== 리뷰 작성 페이지 이동 ==== 	
	function writeReview(userid) {
		product_num = "${requestScope.pvo.product_num}";
		if(userid == "") {
			alert("로그인을 해주세요");
			return;
		}
		
		url = "<%= request.getContextPath()%>/board/writeReview.ban?userid="+userid+"&product_num="+product_num;
		// 나의 정보 수정하기 팝업창 띄우기
		// 너비 800, 높이 680 인 팝업창을 화면 가운데 위치시키기
		const pop_width = 580;
		const pop_height = 500;
		const pop_left = Math.ceil((window.screen.width - pop_width)/2); <%-- 정수로 만듦 --%>
						// ( 2000 - 800 ) / 2 = 600
		const pop_top = Math.ceil((window.screen.height - pop_height)/2);
		window.open(url, "writeReview", "left="+pop_left+", top="+pop_top+" , width="+pop_width+", height="+pop_height);

	}
	// ==== 리뷰 작성 페이지 이동 끝 ==== 
	
		
	// 장바구니 버튼 클릭시 호출되는 함수	
	function goCart(){
		// 주문수량에 대한 유효성 검사 //
		const frm = document.itemFrmView;

		const regExp = /^[1-9]+$/;  // 숫자(1-9)만 체크하는 정규표현식
		const item_cnt = $("input#item_cnt").val();		//주문수량
		const bool = regExp.test(item_cnt);
		
		if(!bool){	//숫자 이외의 값 들어온 경우
	         alert("주문 개수는 1개 이상이어야 합니다.");
	         frm.item_cnt.value = "1";
	         frm.item_cnt.focus();
	         return; // 종료 
		}
		else{
	
			$("div.add_cart_layer_popup").show();	// '장바구니 바로 확인?' 팝업창
	
			
			$("button.btn_cancel").bind("click", function(){
				
				$.ajax({
			 		url:"<%= ctxPath%>/cart.ban",
			 		type:"get",
			 		data:{"product_num":${requestScope.pvo.product_num},
			 			  "cart_cnt":item_cnt},					
			 		success:function(){
						$("div.add_cart_layer_popup").hide();	// 취소하면 팝업창 닫음
					},
		            error: function(request, status, error){
	                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			        }
				});

			});	//end of $("button.btn_cancel").bind("click", function() ------------------
	
			
			$("button.btn_confirm").bind("click", function (){	//확인하면 장바구니로 이동
				
				location.href = "<%= ctxPath%>/cart.ban?cart_cnt=" + item_cnt +"&product_num="+${requestScope.pvo.product_num};
				
				$("div.add_cart_layer_popup").hide();
				
			});	
			
		}//end of else		
	}// end of function goCart()--------------------------------	
	
</script>


            <div id="container">
                <div id="contents">
                    
                    <!-- 본문 시작 -->
                    <div class="item_sub_content">
                        <div class="item_content_box">

                            <div class="item_location_wrap"></div>
                            <!-- 아이템 상단 여백 끝 -->
                            
                            <!-- 아이템 상단 시작 -->
                            <div class="item_photo_info_sec">
                                <div class="item_photo_view_box">
                                    <div class="item_photo_view">
                                        <div class="item_photo_big">
                                            <span class="img_photo_big">
                                                <a href="#lyZoom" id="mainImage" class="zoom_layer_open btn_open_layer">
                                                    <img src="<%= ctxPath%>/image/item_main/${requestScope.pvo.main_image}.jpg" width="500" class="middle">
                                                </a>
                                                
                                            </span>
                                            <a href="#lyZoom" class="btn_zoom zoom_layer_open btn_open_layer">
                                                <img src="<%= ctxPath%>/image/icon_zoom.png">
                                            </a>
                                        </div>
                                        <!-- item_photo_big -->

                                        <div class="item_photo_slide">
                                            <ul class="slider_wrap slider_goods_nav slick-initialized slick-slider">
                                                <div aria-live="polite" class="slick-list draggable">
                                                    <div class="slick-track" style="opacity: 1; width:104px; transform: translate3d(0px, 0px, 0px);" role="listbox">
                                                        <li class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" 
                                                        tabindex="-1" role="option" aria-describedby="slick-slide00" style="width :84px;">
                                                            <a href="#상품 메인이미지가 현재 클릭한 사진으로 바뀌는 메소드" tabindex="0">
                                                                <img src="<%= ctxPath%>/image/item_main/${requestScope.pvo.main_image}.jpg" width="84px" class="middle">
                                                            </a>
                                                        </li>
                                                    </div>
                                                </div>
                                            </ul>
                                        </div>
                                        <!-- item_photo_slide -->

                                    </div>
                                    <!-- item_photo_view -->

                                </div>
                                <!-- item_photo_view_box -->

                                <form name="itemFrmView" id="itemFrmView" method="post">

                                    <input type="hidden" name="product_num" value=${requestScope.pvo.product_num} />
                                    <input type="hidden" name="product_title" value="${requestScope.pvo.product_title}" />
                                    <input type="hidden" id="product_cnt" name="product_cnt" value=""/>
                                    <input type="hidden" name="product_price" value=""/>
									
                                    <div class="item_info_box">

                                        <div class="item_tit_detail_cont">
                                            <div class="item_detain_tit">
                                                <h3>${requestScope.pvo.product_title}</h3>
                                            </div>

                                            <div class="item_datail_list">
                                                <dl class="item_detail_price">
                                                    <dt>판매가</dt>
                                                    <dd>
                                                        <strong>
                                                            <strong id="price">
                                                            <fmt:formatNumber value="${requestScope.pvo.product_price}" pattern="#,###" />
                                                               
                                                            </strong>
                                                            원
                                                        </strong>
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_category">
                                                    <dt>상품구분</dt>
                                                    <dd>
                                                        냉동생지
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_discount_mileage">
                                                    <dt>구매혜택</dt>
                                                    <dd>
                                                        마일리지 적립 : <span class="save_mileage">${requestScope.pvo.mileage}</span>원
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_deliver_fee">
                                                    <dt>배송비</dt>
                                                    <dd>
                                                        3,000원 / 주문시결제(선결제)
                                                    </dd>
                                                </dl>
                                                <div>
                                                    <dl class="item_detail_each">
                                                        <dt>개수</dt>
                                                        <dd>
                                                            <input id="item_cnt" name="item_cnt" type="number" class="form-control" min="1" value="1">
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                            <!-- item_datail_list 끝-->

                                            <div class="item_price_cont">
                                                <div class="end_price item_total_box">
                                                    <dl class="total_goods">
                                                        <dt>총 상품금액</dt>
                                                        <dd><strong class="goods_total_price">${requestScope.pvo.product_price}</strong>원</dd>

                                                    </dl>
                                                </div>

                                            </div>
                                            <div class="btn_choice_box">
                                                <button type="button" class="btn_add_wish">
                                                    <span class="material-symbols-outlined">favorite</span> 
                                                </button>
                                                <button type="button" class="btn_add_cart" onclick="goCart()">장바구니</button>
                                                <button type="button" class="btn_add_order">바로 구매하기</button>

                                            </div>

                                        </div>
                                    </div>

                                </form>
                            </div>

                             <!-- item_photo_info_sec -->
                            <!-- 아이템 상단 끝-->
                            
                            <!-- 아이템 하단 시작-->
                            <div class="item_goods_sec">
                                <!-- //item_goods_tab-->

                                <div id="detail">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li class="on">
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="detail_cont">
                                        <h3>상품상세정보</h3>
                                        <div class="detail_explain_box">
                                            <div class="image-manual">
                                                <!-- 이미지 -->
                                            </div>
                                            <div class="txt-manual">
                                                <p align="center" style="text-align: center;">
                                                    <img src="<%= ctxPath%>/image/delivery_system.jpg">
                                                </p>

                                                <p align="center" style="text-align: center;">
                                                    <img src="<%= ctxPath%>/image/item_detail/test02.jpg">
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="delivery">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li class="on">
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="delivery_cont">
                                        <h3>배송안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/delivery_policy.jpg">
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div id="exchange">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li class="on">
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="exchange_cont">
                                        <h3>교환 및 반품안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/exchange_policy.jpg">
                                            </div>
                                        </div>

                                        <h3>환불안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/exchange_info.jpg">
                                            </div>
                                        </div>

                                        <h3>AS안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/as_info.jpg">
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div id="reviews">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li class="on">
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="reviews_cont">
                                        <div class="review_header">
                                            <div class="review_header_tit">
                                                <span class="title">REVIEW</span>
                                            </div>
                                            <div class="review_header_description">
                                            	<a id="writeReviewButton" class="review_header_description_link" onclick="writeReview('<%=user_id%>')">리뷰 작성</a>
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

                                                <c:if test="${not empty requestScope.reviewList}">
													<c:forEach var="rvo" items="${requestScope.reviewList}">
														<tr>
											              <td class="userid"><span>${rvo.mvo.user_id}</span></td>
											              <td>${rvo.review_content}</td>
											              <td>${rvo.review_date}</td>

											              <% 
											              	ReviewVO rvo =(ReviewVO) pageContext.getAttribute("rvo");
											              	parkjuneyub.member.model.MemberVO mvo = rvo.getMvo();
											              	String tmp = mvo.getUser_id();
											                if(tmp.equals(user_id)) {
											                %>

											               <td><button type="button" class="btn btn-light" onclick="deleteReview('${rvo.purchase_review_id}')">삭제</button><td> 
															<% } %>

											           </tr>
													</c:forEach>
											 	 </c:if>
												<c:if test="${empty requestScope.reviewList}">
													<tr>
														<td colspan="3">작성된 리뷰가 없습니다.</td>
													</tr>
												</c:if>
                                                
                                            </tbody>
                                        </table>

                                    </div>
                                    	<nav class="my-5">
									        <div style='display:flex;'>
									          <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
									       </div>
									    </nav>
                                    
                                </div>
                                <!-- 리뷰 끝 -->

                                <div id="qna">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li class="on">
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="reviews_cont">
                                        <div class="review_header">
                                            <div class="review_header_tit">
                                                <span class="title">상품문의</span>
                                            </div>
                                            <div class="review_header_description">
                                            	
                                                <a class="review_header_description_link" href="#">전체 상품 문의 보기</a>
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

                                </div>


                            </div>
                            
                        </div>
                        
                    </div>
                
               		<!--  장바구니 클릭시 뜨는 팝업창 시작 -- 김진솔  -->
                   <div class="add_cart_layer_popup">
                       <div class="view">
                           <h2>장바구니 담기</h2>
                           <div class="shopping_cart"><img src="<%= ctxPath%>/image/shopping_cart_popup.png"></div>
                           <div class="scroll_box">
                               <p class="success"><strong>상품이 장바구니에 담겼습니다.</strong><br>바로 확인하시겠습니까?</p>
                           </div>
                           <div class="btn_box">
                               <button class="btn_cancel">취소</button>
                               <button class="btn_confirm btn_move_cart"><span>확인</span></button>
                           </div>
                       </div>
                   </div>
               		<!--   장바구니 클릭시 뜨는 팝업창 끝   -->
                
                
                \
                </div>
            </div>
            <!-- // container --> 

<jsp:include page="../footer.jsp" />
             