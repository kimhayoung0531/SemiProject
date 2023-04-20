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
                                        <h2 class="title_h2">주문 완료</h2>
                                        <ol>
                                            <li class="orderUnEmphasized"><span>01</span>장바구니<span><img></span></li>
                                            <li class="orderUnEmphasized"><span>02</span>주문서 작성/결제<span><img></span></li>
                                            <li class="orderEmphasized"><span>03</span>주문완료</li>
                                        </ol>
                                    </div>
                                    <!-- 주문 접수 완료 -->
                                    <div class="order_end_completion">
                                        <span class="material-symbols-outlined">
                                            done_outline
                                        </span>
                                        <p>
                                            <strong>주문이 정상적으로 접수 되었습니다</strong>
                                            <br>
                                            감사합니다
                                        </p>
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
                                                                <th><span class="order_important">결제수단</span></th>
                                                                <td>
                                                                    <ul class="order_summary_information">
                                                                        <li>입금은행 :</li>
                                                                        <li>입금계좌 :</li>
                                                                        <li>예금주명 :</li>
                                                                        <li>입금금액 :</li>
                                                                        <li>입금자명 :</li>
                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주문번호</span></th>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주문일자</span></th>
                                                                <td>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주문상품</span></th>
                                                                <td>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주문자명</span></th>
                                                                <td>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">배송정보</span></th>
                                                                <td>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">상품 금액</span></th>
                                                                <td><strong>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">배송비</span></th>
                                                                <td>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">할인 및 적립</span></th>
                                                                <td>                                                                    <ul class="order_benefit_list">
                                                                    <li>할인 : <span class="save_mileage">###원</span></li>
                                                                    <li>마일리지 사용 : <span class="save_mileage">###원</span></li>
                                                                </ul>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">총 결제금액</span></th>
                                                                <td><strong>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</strong></td>
                                                            </tr>


                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- 주문자 정보 --> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- order_wrapp 끝-->
                            </form>
                            <div class="payment_btn_center_box">
                                <button class="btn_order_buy" type="button">확인</button>
                            </div>

                        </div>
                    </div>
                    <!-- // 본문 끝 -->



                </div>
            </div>
            
            <jsp:include page="../footer.jsp" />