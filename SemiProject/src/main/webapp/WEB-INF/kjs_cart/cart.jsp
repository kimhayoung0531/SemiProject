<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<%
	String ctxPath = request.getContextPath();
%>    
<jsp:include page="../header.jsp" />

<script type="text/javascript">

	$(document).ready(function () {
		
       if(${not empty requestScope.itemCnt}) {
    	   $("input#cart_cnt").val("${requestScope.itemCnt}");
       }		
		
	});	//end of $(document).ready(function () -------------------------------------

</script>



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
                        <input type="hidden" name="mode" value="">
                        <input type="hidden" name="cart[cartSno]" value="">
                        <input type="hidden" name="cart[goodsNo]" value="">
                        <input type="hidden" name="cart[goodsCnt]" value="">
                        <input type="hidden" name="cart[addGoodsNo]" value="">
                        <input type="hidden" name="cart[addGoodsCnt]" value="">
                        <input type="hidden" name="cart[couponApplyNo]" value="">
                        <input type="hidden" name="useBundleGoods" value="1">
                        <input type="hidden" name="ac_id" value="">
                        <!-- 장바구니 상품리스트 시작 -->
                        
                        <div class="cart_cont_list">
    
                            <div class="order_table_type">
                                <table>
                                    <colgroup>
                                        <col style="width:3%">  <!-- 체크박스 -->
                                        <col>					<!-- 상품명/옵션 -->
                                        <col style="width: 8%">  <!-- 수량 -->
                                        <col style="width:10%"> <!-- 상품금액 -->
                                        <col style="width:13%"> <!-- 마일리지 -->
                                        <col style="width:10%"> <!-- 합계금액 -->
                                        <col style="width:10%"> <!-- 배송비 -->
                                    </colgroup>
                                  
                                  
                                    <thead>
                                    <tr>
                                        <th>        <!-- 선택상품을 전체선택 체크박스 allCheck-->
                                            <div class="form_element">
                                                <input type="checkbox" id="allCheck" class="gd_select_all_goods" checked="checked">
                                            </div>
                                        </th>
                                        <th>상품/옵션 정보</th>
                                        <th>수량</th>
                                        <th>상품금액</th>
                                        <th>적립 마일리지</th>
                                        <th>합계금액</th>
                                        <th>배송비</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <tr>
                                        <td class="td_chk"> <!-- 선택상품 체크박스-->    
                                            <div class="form_element">
                                                <input type="checkbox" id="" checked="checked"/>
                                            </div>
                                        </td>

                                        <td class="td_left">    <!-- 상품 이미지 정보 클릭시 이동! -->
                                            <div class="pick_add_cont"> 
                                                <div class="pick_add_img_info"> 
                                                    <a href="../goods/goods_view.php?goodsNo=1000002827"><img src="https://cafenoli605.hgodo.com/data/thum/1000002827.jpg" width="60"
                                                        alt="냉동생지 - 빵데께쥬/찰치즈빵" title="냉동생지 - 빵데께쥬/찰치즈빵">
                                                    </a> 
                                                    <span><a href="../goods/goods_view.php?goodsNo=1000002827">냉동생지 - 빵데께쥬/찰치즈빵</a></span>

                                                </div>
                                            </div>
                                        </td>

                                        <td class="td_order_amount">    <!-- 장바구니 수량 / 변경 -->
                                            <div class="order_goods_num">
                                                <div class="btn_gray_list">
                                                    <p><label for="number"></label><input type="number" id="cart_cnt" min="1"  max="50" step="1" value="1" id="number"/></p>                                                </div>
                                                </div>
                                            </div>
                                        </td>
                                        
                                        <td>    <!-- 상품 금액 -->
                                            <strong class="order_sum_txt price" value=""></strong>
                                            <span>원</span>
                                        </td>

                                        <td class="td_mileage">     <!-- 마일리지 -->
                                                <ul class="mileage_list">
                                                    <li class="mileage_mileage">

                                                    </li>
                                                </ul>
                                        </td>
                                        <td>
                                            <strong class="order_sum_txt" value=""></strong>
                                            <span>원</span>                                     
                                        </td>
                                        <td class="td_delivery" rowspan="4">
                                            기본 - 금액별배송비<br>
                                            0원
        
                                            <br>
                                            (택배-선결제)
                                        </td>
                                    </tr>
                                        
        
                                    </tbody>
        
        
                                </table>
                            </div>
        
                        </div>
                       
                        <!-- //cart_cont_list -->
                        <!-- 장바구니 상품리스트 끝 -->
        
        
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
        
       	 </div><!--cart_content_box 끝-->
    	</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
