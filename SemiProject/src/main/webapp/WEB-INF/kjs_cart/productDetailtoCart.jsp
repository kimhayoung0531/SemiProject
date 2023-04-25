<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	// SemiProject 
%>    
<jsp:include page="../header.jsp" />
  
<script type="text/javascript">

	$(document).ready(function () {
		$("div.add_cart_layer_popup").hide();

		
	 $("button.btn_add_cart").bind("click", function(){
			$("div.add_cart_layer_popup").show();
			$("button.btn_cancel").bind("click", function(){
				$("div.add_cart_layer_popup").hide();
			});
			$("button.btn_confirm").bind("click", function goCart(){
				const frm = document.itemFrmView;
				frm.action = "cart.ban";
				frm.method = "post";
				frm.submit();
				
				$("div.add_cart_layer_popup").hide();
				
			});
			
		});  //'장바구니' 클릭시 뜨는 팝업창
		
	});	//end of $(document).ready(function () --------------------------------------

	
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
                                    <input type="hidden" name="mode" value="get_benefit">
                                    <input type="hidden" name="scmNo" value="1">
                                    <input type="hidden" name="cartMode" value="">
                                    <input type="hidden" name="set_goods_price" value="21000">
                                    <input type="hidden" id="set_goods_fixedPrice" name="set_goods_fixedPrice" value="0.00">
                                    <input type="hidden" name="set_goods_mileage" value="0">
                                    <input type="hidden" name="set_goods_stock" value="∞">
                                    <input type="hidden" name="set_coupon_dc_price" value="21000.00">
                                    <input type="hidden" id="set_goods_total_price" name="set_goods_total_price" value="0">
                                    <input type="hidden" id="set_option_price" name="set_option_price" value="0">
                                    <input type="hidden" id="set_option_text_price" name="set_option_text_price" value="0">
                                    <input type="hidden" id="set_add_goods_price" name="set_add_goods_price" value="0">
                                    <input type="hidden" name="set_total_price" value="21000">
                                    <input type="hidden" name="mileageFl" value="c">
                                    <input type="hidden" name="mileageGoods" value="0.00">
                                    <input type="hidden" name="mileageGoodsUnit" value="percent">
                                    <input type="hidden" name="goodsDiscountFl" value="y">
                                    <input type="hidden" name="goodsDiscount" value="0.00">
                                    <input type="hidden" name="goodsDiscountUnit" value="percent">
                                    <input type="hidden" name="taxFreeFl" value="t">
                                    <input type="hidden" name="taxPercent" value="10.0">
                                    <input type="hidden" name="scmNo" value="1">
                                    <input type="hidden" name="brandCd" value="">
                                    <input type="hidden" name="cateCd" value="023001">
                                    <input type="hidden" id="set_dc_price" value="0">
                                    <input type="hidden" id="goodsOptionCnt" value="1">
                                    <input type="hidden" name="optionFl" value="n">
                                    <input type="hidden" name="useBundleGoods" value="1">

                                    <div class="item_info_box">

                                        <div class="item_tit_detail_cont">
                                            <div class="item_detain_tit">
                                                <h3>냉동생지 - [삼양사] 애플파이</h3>
                                            </div>

                                            <div class="item_datail_list">
                                                <dl class="item_detail_price">
                                                    <dt>판매가</dt>
                                                    <dd>
                                                        <strong>
                                                            <strong>
                                                                #,###
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
                                                        마일리지 적립 : <span class="save_mileage">###원</span>
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_discount_mileage">
                                                    <dt>제조사</dt>
                                                    <dd>
                                                        삼양사
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
                                                            <input id="item_cnt"  name="item_cnt" type="number" class="form-control" min="1" max="50" value="1">
                                                        </dd>
                                                    </dl>
                                                   <input type="text" name="pnum" value="${requestScope.pvo.pnum}" />
                                                </div>
                                            </div>
                                            <!-- item_datail_list 끝-->

                                            <div class="item_price_cont">
                                                <div class="end_price item_total_box">
                                                    <dl class="total_goods">
                                                        <dt>총 상품금액</dt>
                                                        <dd><strong class="goods_total_price">#,###</strong>원</dd>

                                                    </dl>
                                                </div>

                                            </div>
                                            <div class="btn_choice_box">
                                                <button type="button" class="btn_add_wish">
                                                    <span class="material-symbols-outlined">
                                                        favorite
                                                        </span>
                                                </button>
                                                <button type="button" class="btn_add_cart" onclick="goCart();" >장바구니</button>
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
               
               		<!-- 장바구니 클릭시 뜨는 팝업창 시작 -- 김진솔 -->
                   <div class="add_cart_layer_popup">
                       <div class="view">
                           <h2>장바구니 담기</h2>
                           <div class="shopping_cart"><img src="<%= ctxPath%>/image/shopping_cart_popup.png"></div>
                           <div class="scroll_box">
                               <p class="success"><strong>상품이 장바구니에 담겼습니다.</strong><br>바로 확인하시겠습니까?</p>
                           </div>
                           <div class="btn_box">
                               <button class="btn_cancel"><span>취소</span></button>
                               <button class="btn_confirm btn_move_cart"><span>확인</span></button>
                           </div>
                       </div>
                   </div>
               		<!-- 장바구니 클릭시 뜨는 팝업창 끝  -->
	                
                
                </div>
            </div>
            <!-- // container --> 

<jsp:include page="../footer.jsp" />
             