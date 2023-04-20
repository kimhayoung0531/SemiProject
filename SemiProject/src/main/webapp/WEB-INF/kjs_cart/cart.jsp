<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>    
<jsp:include page="../header.jsp" />
  

                
<div id="cart_contents">
                <!-- 본문 시작 -->
        

    <div class="cart_sub_content"> <!-- 장바구니 sub_content 시작!! -->
        
        <div class="cart_content_box">
            <div class="order_wrap">
                <div class="order_tit">
                    <h2>장바구니</h2>
                    <ol>
                        <li class="page_on"><span>01</span> 장바구니 <span><img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png" alt="장바구니진행 중"></span></li>
                        <li><span>02</span> 주문서작성/결제<span><img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_off.png" alt="주문서작성/결제대기"></span></li>
                        <li><span>03</span> 주문완료</li>
                    </ol>
                </div>
                <!-- //order_tit 끝 -->
        
                <div class="cart_cont">
        
                    <form id="frmCart" name="frmCart" method="post" target="ifrmProcess">
                        

                        <!-- 장바구니 상품리스트 시작 -->
                        <!-- //cart_cont_list -->
                        <!-- 장바구니 상품리스트 끝 -->
                        
                        <!--장바구니에 상품이 없을 때-->
                        <p class="cart_no_data">장바구니에 담겨있는 상품이 없습니다.</p>
        
        
                    </form>
        
                    <div class="btn_left_box">
                        <a href="https://cafenoli.com:443/goods/goods_list.php?cateCd=023002" class="shop_go_link"><span>&lt; 쇼핑 계속하기</span></a>
                    </div>
        
                    <div class="price_sum">
                        <div id="price_sum_cont">
                            <div id = "price_box">
                                <div class = "allprice">
                                    <div class = "allprice_head">
                                        총 <span style="font-weight: bolder;">1</span>개의 상품 금액
                                    </div>
                                    <strong class="allprice_won">
                                        30,000 
                                        <span style="font-weight: lighter;">원</span>
                                    </strong>
                                </div>

                                <span><img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/order/order_price_plus.png" alt="더하기"></span>

                                <div class = "allprice">
                                    <div class = "allprice_head">
                                        배송비
                                    </div>
                                    <strong class="allprice_won" >
                                        3,000 
                                        <span style="font-weight: lighter;">원</span>
                                    </strong>
                                </div>

                                <span><img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/order/order_price_total.png" alt="합계"></span>

                                <div class = "allprice">
                                    <div class = "allprice_head">
                                        합계
                                    </div>
                                    <strong class="allprice_won">
                                        300,000
                                        <span style="font-weight: lighter;">원</span>
                                    </strong>
                                </div>
                                
                            </div>

                            <div id="deliveryChargeText" class="tobe_mileage"></div>

                            <div class="tobe_mileage">적립예정 마일리지 : <span id="totalGoodsMileage">380</span> 원</div>
                            
                        </div>
                        <!-- //price_sum_cont -->
                    </div>
                    <!-- //price_sum -->
        
                    <div class="btn_order_whole_box">
                        <div class="btn_delete_box">
                            <button type="button" class="btn_order_choice_del" onclick="">선택 상품 삭제</button>
                        </div>
                        <div class="btn_order_box">
                            <button type="button" class="btn_order_choice_buy" onclick="">선택 상품 주문</button>
                            <button type="button" class="btn_order_whole_buy" onclick="">전체 상품 주문</button>
                        </div>
                    </div>
                    
                    <div class="chk_none"> ※ 주문서 작성단계에서 마일리지 적용을 하실 수 있습니다.</div>                    
                
                </div>
        
                

            </div>
        </div><!--cart_content_box 끝-->

    </div>
</div> <!-- cart_contents 끝 -->

<jsp:include page="../footer.jsp" />
