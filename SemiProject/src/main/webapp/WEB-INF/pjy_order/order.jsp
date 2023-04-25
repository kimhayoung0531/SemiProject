<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%
	String ctxPath = request.getContextPath();
	// SemiProject
%>    
	<jsp:include page="../header.jsp" />
	
	<script>
		$(document).ready(function () {
			
			
			$("select.emailDomain_select").bind("change", function() {
				email_domain_change();
			});
			
			<%-- 상품 금액 * 개수 구해서 추가하기 --%>
			//$(table#shopping_list_table)
			const table = document.getElementById('shopping_list_table');

			
			<%-- 상품의 총 개수 구하기 --%>
			var sumCount = 0;
			for(let i = 1; i < table.rows.length; i++) {
				sumCount += parseInt(table.rows[i].cells[1].innerHTML);
				console.log(i)
			}
			$("strong#order_total_count").val(sumCount);
			$("strong#order_total_count").html(sumCount);
			
			<%-- 테이블의 금액 총합 계산하기 --%>
			var sumPrice = 0;
			for(let i = 1; i < table.rows.length; i++) {
				sumPrice += parseInt(table.rows[i].cells[4].innerHTML.replace(',', ''));
				console.log("sumprice" + sumPrice);
			}
			
			$("strong#order_total_price").val(sumPrice);
			$("strong#order_total_price").html(sumPrice.toLocaleString('ko-KR'));
			
			<%-- 주문금액 계산 --%>
			
			$("strong#total_price_plus_delivery_fee").val( Number($("strong#order_total_price").val()) + 3000 );
			$("strong#total_price_plus_delivery_fee").html( (Number($("strong#order_total_price").val()) + 3000).toLocaleString('ko-KR') );
			$("strong#totalPrice").html( (Number($("strong#order_total_price").val()) + 3000).toLocaleString('ko-KR') );
			$("strong.total_good_price").html(sumPrice.toLocaleString('ko-KR'));
			
			
			$("button.btn_order_buy").bind("click", function() {
				checkOrderDetail();
			})
			
			
		}); <%-- end of $(document).ready(function () --%>

		
		function checkOrderDetail() {
			
			if($("input#order_name").val().trim() == "" ) {
				alert("주문하시는 분 정보를 입력해주세요");
				$("input#order_name").focus();
				return;
			}
			
			var regExp = /^[가-힣]{2,6}$/;   		<%-- 이름은 2~6자로 이루어진 한글로 구성되어져 있는지 확인한다. --%>
			const boolOrderName = regExp.test($("input#order_name").val());
			if(!boolOrderName) {
				alert("이름은 2~6자로 이루어진 한글로 구성되어 있어야 합니다");
				$("input#order_name").focus();
				return;
			}
			
			if($("input#order_mobile").val().trim() == "" ) {
				alert("주문하시는 분 휴대폰 번호를 입력해주세요");
				$("input#order_mobile").focus();
				return;
			}
			
			var regExp= /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;   		<%-- 휴대폰번호 정규식 01로 시작하며 3번째 자리는 0,1,6,7,8,9 가 오며 - 는 있을수도 없을수도 있다. --%>
			const boolOrderMobile = regExp.test($("input#order_mobile").val());
			if(!boolOrderMobile) {
				alert("휴대폰 형식이 맞지 않습니다");
				$("input#order_mobile").focus();
				return;
			}
			
			if($("input#order_email").val().trim() == "" ) {
				alert("주문하시는 분 이메일을 입력해주세요");
				$("input#order_email").focus();
				return;
			}
			
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
			const boolOrderEmail = regExp.test( $("input#order_email").val() );
			if(!boolOrderEmail) {
				alert("이메일 형식이 맞지 않습니다");
				$("input#order_email").focus();
				return;
			}
			
			if($("input#receive_name").val().trim() == "" ) {
				alert("받으시는 분 정보를 입력해주세요");
				$("input#receive_name").focus();
				return;
			}
			
			var regExp = /^[가-힣]{2,6}$/;   		<%-- 이름은 2~6자로 이루어진 한글로 구성되어져 있는지 확인한다. --%>
			const boolReceiveName = regExp.test($("input#receive_name").val());
			if(!boolReceiveName) {
				alert("이름은 2~6자로 이루어진 한글로 구성되어 있어야 합니다");
				$("input#receive_name").focus();
				return;
			}
			
			if($("input#receive_mobile").val().trim() == "" ) {
				alert("받으시는 분 휴대폰 번호를 입력해주세요");
				$("input#receive_mobile").focus();
				return;
			}
			
			var regPhone= /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;   		<%-- 휴대폰번호 정규식 01로 시작하며 3번째 자리는 0,1,6,7,8,9 가 오며 - 는 있을수도 없을수도 있다. --%>
			const boolReceiveMobile = regExp.test($("input#receive_mobile").val());
			if(!boolReceiveMobile) {
				alert("휴대폰 형식이 맞지 않습니다");
				$("input#receive_mobile").focus();
				return;
			}
			
			if($("input#receive_email").val().trim() == "" ) {
				alert("받으시는 분 이메일을 입력해주세요");
				$("input#receive_email").focus();
				return;
			}
			
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
			const boolReceiveEmail = regExp.test( $("input#receive_email").val() );
			if(!boolOrderEmail) {
				alert("이메일 형식이 맞지 않습니다");
				$("input#receive_email").focus();
				return;
			}
		}
		
		function email_domain_change() {
			
			var target = $("select.emailDomain_select").val()
			var emailContent = $("input#order_email").val();
			if(isAtSignExist(emailContent)) {					<%-- @ 가 포함 시--%>
			
				var indexAtSign = emailContent.indexOf('@');
				emailContent = emailContent.slice(0, indexAtSign+1);
				
				if(target != "직접입력") {
					emailContent += target;
				}
				$("input#order_email").val(emailContent);

			}
			else {												<%-- @ 가 미포함 시--%>
				if(target != "직접입력") {
					emailContent += '@';
					emailContent += target;
				}
				else {
					emailContent += '@';
				}
				$("input#order_email").val(emailContent);
			}	
		};
		
		function isAtSignExist(emailContent) {
			var num = emailContent.indexOf('@');
			if(num == -1) {
				return false;
			}
			else {
				return true;
			}
		};
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
	
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

                                                    <c:if test="${not empty requestScope.buyItem_map}">
                                                        <tr class="order_goods_layout">
                                                            <td>${requestScope.buyItem_map.product_title}</td>
                                                            <td>${requestScope.buyItem_map.product_cnt}</td>
                                                            <td>
                                                            <fmt:formatNumber value="${requestScope.buyItem_map.product_price}" pattern="#,###" />
                                                            </td>
                                                            <td></td>
                                                            <td id="priceMultiCountResult">
                                                            <fmt:parseNumber var="cnt" integerOnly="true" value="${requestScope.buyItem_map.product_cnt}" />
                                                            <fmt:parseNumber var="price" integerOnly="true" value="${requestScope.buyItem_map.product_price}" />
                                                            <fmt:formatNumber value="${cnt*price}" pattern="#,###" />
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        
                                                    </c:if>

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
                                                            <strong id="order_total_count">n</strong>
                                                            개의 상품금액
                                                        </dt>
                                                        <dd>
                                                            <strong id="order_total_price"></strong>
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
                                                            <strong>3,000</strong>
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
                                                        <strong id="total_price_plus_delivery_fee"></strong>
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
                                                                <th><span class="order_important">*주문하시는 분</span></th>
                                                                <td><input type="text" name="order_name" id="order_name" value="${requestScope.mvo.user_name}"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">주소</span></th>
                                                                <td>${requestScope.mvo.address}</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">전화번호</span></th>
                                                                <td><input type="text" name="order_phone" id="order_phone" value="${requestScope.mvo.telephone}">&nbsp; '-' 를 제외하고 입력해주세요</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">*휴대폰 번호</span></th>
                                                                <td><input type="text" name="order_mobile" id="order_mobile" value="${requestScope.mvo.mobile}">&nbsp; '-' 를 제외하고 입력해주세요</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">*이메일</span></th>
                                                                <td><input type="text" name="order_email" id="order_email" value="${requestScope.mvo.email}">
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
                                                                <th><span class="order_important">*받으시는 분</span></th>
                                                                <td><input type="text" name="receive_name" id="receive_name"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">*받으실 곳</span></th>
                                                                <td>
																	<div class="address_postcode">
																		<input type="text" id="sample6_postcode" placeholder="우편번호">
																		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
																	</div>
																	<div class="address_input">
																		<input type="text" id="sample6_address" placeholder="주소"><br>
																		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
																		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
																	</div>
                                                                	
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">전화번호</span></th>
                                                                <td><input type="text" name="receive_phone" id="receive_phone">&nbsp; '-' 를 제외하고 입력해주세요</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">*휴대폰 번호</span></th>
                                                                <td><input type="text" name="receive_mobile" id="receive_mobile">&nbsp; '-' 를 제외하고 입력해주세요</td>
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
                                                                <td><strong class="total_good_price" name="total_good_price" id="total_good_price"></strong>원</td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">배송비</span></th>
                                                                <td><span class="deliver_fee">3,000원</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th><span class="order_important">할인 밎 적립</span></th>
                                                                <td>
                                                                    <ul class="order_benefit_list">
                                                                        <li>할인 : <span class="save_mileage"></span>원</li>
                                                                        <li>마일리지 적립 : <span class="save_mileage"></span>원</li>
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
                                                                    <strong id="totalPrice"></strong>원
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