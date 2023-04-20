<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
	// SemiProject
%>    
	<jsp:include page="../header.jsp" />
	
<div id="container">
                <div id="contents">

                    <!-- 본문 시작 -->
                    <!-- // location_wrap -->
                    <div class="order_sub_content">
                        <div class="order_sub_content_box">
                            <form id="frmOrder" name="frmOrder" >

                                <div class="order_wrap">
                                    <div class="order_tit">
                                        <h2 class="title_h2">주문서작성/결제</h2>
                                        <ol>
                                            <li class="orderUnEmphasized"><span>01</span>장바구니<span><img></span></li>
                                            <li class="orderEmphasized"><span>02</span>주문서 작성/결제<span><img></span></li>
                                            <li class="orderUnEmphasized"><span>03</span>주문완료</li>
                                        </ol>
                                    </div>

                                    <div class="order_cont">
                                        <div class="cart_cont_list">
                                            <div class="order_cart_tit">
                                                <h3 class="title_h3">주문상세내역</h3>
                                            </div>
                                            <div class="order_table_type">
                                                <!-- 장바구니 상품 리스트 시작-->
                                                <table id="shopping_list_table">
                                                    <thead>
                                                        <tr>
                                                            <th>상품/옵션 정보</th>
                                                            <th>수량</th>
                                                            <th>상품금액</th>
                                                            <th>할인/적립</th>
                                                            <th>합계금액</th>
                                                            <th>배송비</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="order_goods_layout">
                                                            <td>test</td>
                                                            <td>test</td>
                                                            <td>test</td>
                                                            <td>test</td>
                                                            <td>test</td>
                                                            <td>test</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <!--장바구니 상품리스트 끝 -->
                                            </div>
                                        </div>

                                        <div class="price_sum">
                                            <div class="price_sum_cont">
                                                <div class="price_sum_list">
                                                    <dl>
                                                        <dt>
                                                            총 
                                                            <strong>n</strong>
                                                            개의 상품금액
                                                        </dt>
                                                        <dd>
                                                            <strong>###,###</strong>
                                                            원
                                                        </dd>
                                                    </dl>
                                                    <span>
                                                        <img src="<%=ctxPath%>/image/order_price_plus.png">
                                                    </span>
                                                    <dl>
                                                        <dt>
                                                            배송비
                                                        </dt>
                                                        <dd>
                                                            <strong>#,###</strong>
                                                            원
                                                        </dd>
                                                    </dl>
                                                    <span>
                                                        <img src="<%=ctxPath%>/image/order_price_total.png">
                                                    </span>
                                                    <dl>
                                                        <dt>
                                                            합계
                                                        </dt>
                                                        <dd>
                                                        <strong>#,###</strong>
                                                        원 
                                                        </dd>
                                                    </dl>
                                                </div>
                                                <em class="tobe_mileage">적립예정 마일리지 : <span>#,###</span>원</em>
                                            </div>
                                            <!-- price_sum_cont-->
                                        </div>

                                        <div class="order_view_info">
                                            <div class="order_info">
                                                <div class="order_zone_tit">
                                                    <h3 class="title_h3">주문자 정보</h3>
                                                </div>
                                                <div class="order_table_type">
                                                    <table class="table_left">
                                                        <colgroup>
                                                            <col style="width:20%">
                                                            <col style="width:80%">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <th><span class="order_important">주문하시는 분</span></th>
                                                                <td><input type="text" name="order_name" id="order_name"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주소</span></th>
                                                                <td>주소 표시 부분</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">전화번호</span></th>
                                                                <td><input type="text" name="order_phone" id="order_phone"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">휴대폰 번호</span></th>
                                                                <td><input type="text" name="order_mobile" id="order_mobile"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">이메일</span></th>
                                                                <td><input type="text" name="order_email" id="order_email">
                                                                    <select name="emailDomain_select" class="emailDomain_select">
                                                                        <option value="직접입력">직접입력</option>
                                                                        <option value="naver.com">naver.com</option>
                                                                        <option value="hanmail.net">hanmail.net</option>
                                                                        <option value="daum.net">daum.net</option>
                                                                        <option value="nate.com">nate.com</option>
                                                                        <option value="hotmail.com">hotmail.com</option>
                                                                        <option value="gmail.com">gmail.com</option>
                                                                        <option value="icloud.com">icloud.com</option>
                                                                    </select>
                                                                </td>
                                                            </tr>


                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- 주문자 정보 -->

                                                <div class="order_zone_tit">
                                                    <h3 class="title_h3">배송 정보</h3>
                                                </div>
                                                <div class="order_table_type shipping_info">
                                                    <table class="table_left shipping_info_table">
                                                        <colgroup>
                                                            <col style="width:20%">
                                                            <col style="width:80%">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <th><span class="order_important">받으시는 분</span></th>
                                                                <td><input type="text" name="receive_name" id="receive_name"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">받으실 곳</span></th>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">전화번호</span></th>
                                                                <td><input type="text" name="receive_phone" id="receive_phone"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">휴대폰 번호</span></th>
                                                                <td><input type="text" name="receive_mobile" id="receive_mobile"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">남기실 말씀</span></th>
                                                                <td>
                                                                    <input type="text" name="receive_last_say" id="receive_last_say">
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- 배송 정보 -->

                                                <div class="order_zone_tit">
                                                    <h3 class="title_h3">결제 정보</h3>
                                                </div>
                                                <div class="order_table_type order_info">
                                                    <table class="table_left order_info_table">
                                                        <colgroup>
                                                            <col style="width:20%">
                                                            <col style="width:80%">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <th><span class="order_important">상품 합계 금액</span></th>
                                                                <td><strong class="total_good_price" name="total_good_price" id="total_good_price">#,###원</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">배송비</span></th>
                                                                <td><span class="deliver_fee">3,000원</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">할인 밎 적립</span></th>
                                                                <td>
                                                                    <ul class="order_benefit_list">
                                                                        <li>할인 : <span class="save_mileage">###원</span></li>
                                                                        <li>마일리지 적립 : <span class="save_mileage">###원</span></li>
                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">마일리지 사용</span></th>
                                                                <td><input type="text" name="useMileage" id="useMileage">
                                                                    <input type="checkbox" name="useMileageAll" id="useMileageAll" onclick="">
                                                                    <label for="useMileageAll">전액 사용하기</label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">최종 결제 금액</span></th>
                                                                <td>
                                                                    <strong id="tatalPrice">#,###</strong>원
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- 결제 정보 -->

                                                <div class="order_zone_tit">
                                                    <h3 class="title_h3">결제 수단 선택</h3>
                                                </div>
                                                <div class="order_table_type payment_info">
                                                    <table class="table_left payment_info_table">
                                                        <colgroup>
                                                            <col style="width:20%">
                                                            <col style="width:80%">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <th><span class="order_important">일반 결제</span></th>
                                                                <td><strong class="payment_option" name="payment_option" id="payment_option">신용카드</strong></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- 결제 수단 정보 -->

                                                <div class="payment_final">
                                                    <div class="payment_final_total">
                                                        <dl>
                                                            <dt>최종 결제 금액</dt>
                                                            <dd><span>#,###</span>원</dd>
                                                        </dl>
                                                    </div>

                                                    <div class="payment_final_check">
                                                        <input type="checkbox">
                                                        <strong>(필수)</strong> 
                                                        구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.
                                                    </div>
                                                    
                                                    <div class="payment_btn_center_box">
                                                        <button class="btn_order_buy" type="button">결제하기</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>


                                </div>
                                <!-- order_wrapp 끝-->
                            </form>

                        </div>
                    </div>
                    <!-- // 본문 끝 -->



                </div>
            </div>
            
            
            <jsp:include page="../footer.jsp" />