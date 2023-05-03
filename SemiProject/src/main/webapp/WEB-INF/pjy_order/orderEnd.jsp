<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                                                        <li>신용카드</li>

                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                            <tr>
	                                                            <th><span class="order_important">주문상품</span></th>
	                                                            <c:forEach var="pvo" items="${requestScope.productList}">
	                                                            <td>
	                                                            	<li>${pvo.product_title}</li>
	                                                            </td>
	                                                            </c:forEach>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <th><span class="order_important">주문번호</span></th>
                                                                <td>${requestScope.ovo.order_num}</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주문일자</span></th>
                                                                <td>${requestScope.ovo.order_date}</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주문자명</span></th>
                                                                <td>${requestScope.order_name}</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">배송정보</span></th>
                                                                <td>${requestScope.recipt_address}</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">배송비</span></th>
                                                                <td>3,000원</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">마일리지 적립/사용</span></th>
                                                                <td>                                                                    
                                                                <ul class="order_benefit_list"> 
                                                                    <li>마일리지 적립 : <span class="save_mileage"><fmt:formatNumber value="${requestScope.save_mileage}" pattern="#,###" /></span>원</li>
                                                                    <li>마일리지 사용 : <span class="save_mileage"><fmt:formatNumber value="${requestScope.ovo.order_mileage_total}" pattern="#,###" /></span>원</li>
                                                                </ul>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">총 결제금액(배송비 포함)</span></th>
                                                                <td><strong><fmt:formatNumber value="${requestScope.ovo.order_price_total}" pattern="#,###" /></strong></td>
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
                                <button class="btn_order_buy" type="button" onclick = "location.href = '<%=ctxPath%>/home.ban' ">확인</button>
                            </div>

                        </div>
                    </div>
                    <!-- // 본문 끝 -->



                </div>
            </div>
            
            <jsp:include page="../footer.jsp" />