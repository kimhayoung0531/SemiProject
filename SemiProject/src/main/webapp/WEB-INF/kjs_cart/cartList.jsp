<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%
	String ctxPath = request.getContextPath();
%>    

<jsp:include page="../header.jsp" />

<script type="text/javascript">

	$(document).ready(function () {
		<!--
       if(${not empty requestScope.item_cnt}) {
    	   $("input#cart_cnt").val("${requestScope.item_cnt}");
       }		
		-->
		
		// 선택체크박스가 하나라도 해제되면 전체체크박스 체크해제하기
		$(".chkboxpnum").click(function() {

	         var bFlag = false;
	         $(".chkboxpnum").each(function(){
	            var bChecked = $(this).prop("checked");
	            if(!bChecked) {
	               $("#allCheck").prop("checked",false);
	               bFlag = true;
	               return false;
	            }
	         });
	         
	         if(!bFlag) {
	            $("#allCheck").prop("checked",true);
	             }
			
		});	//end of $(".chkboxpnum").click(function(){} ----------------
		  
			
		<%--
		// ======== 장바구니 선택상품 삭제하기 ========
		$("button.btn_order_choice_del").click(function(){
		    const checked_cnt = $("input:checkbox[name='pnum']:checked").length;
			const cart_ck_arr = new Array();

		    if(checked_cnt < 1) {
		         alert("삭제하실 제품을 선택하세요.");
		         return;  //종료
		      }
		    else{
		    	const bool = confirm("정말 삭제하시겠습니까?");
		    	if(bool){
						$("input:checkbox[name='pnum']:checked").each(function() {
							cart_ck_arr.push($(this).val());
						});
						const cart_ck_join = cart_ck_arr.join();
						
				    	console.log("~~~확인용 cart_ck_join: " + cart_ck_join);

						
						$.ajax({
							url:"<%= ctxPath%>/cartDelete.ban", 
						    type:"post",
						    data:{"cart_ck_join":cart_ck_join}, 				
						    dataType:"json",
						    success:function(json){
						    	console.log("~~~확인용 : " + JSON.stringify(json) );
						    	
						    	// ~~~확인용 : {"n":1}
						    	
						    	if(json.n == 1){
						    		// 장바구니 보기 페이지로 감
						    		location.href = "cartList.up";
						    	}
						    },
						    error: function(request, status, error){
			                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						    }
						});	//end of $.ajax -----------------------------
		    		}
		    	else{
				        alert("선택상품 삭제를 취소하셨습니다.");
		    		}
		     }
		});	//end of $("button.btn_order_choice_del").click(function(){})-----------------
				--%>
									 /*
								    data:{"cart_num":cartCkArr.join(",") }, // request.getParameter("cart_num"); 은 타입이 String 으로 된다.  
	                                          "5,7,10"
	                                           '5','7','10'
	                                           delete from 장바구니테이블 
	                                           where 장바구니번호 in('5','7','10')  */
		
	});	//end of $(document).ready(function () -------------------------------------

			
			
			
	   // ======= Function declaration =========
		
	   //전체체크박스가 checked면 선택체크박스도 모두 check, 아니면 uncheck 되게 하기
	   function allCheckBox(){
			var bool = $("#allCheck").is(":checked");
		    $(".chkboxpnum").prop("checked", bool);
	   }	//end of function allCheckBox() ----------------
	
	   
	   // ======== 장바구니 주문수량 수정하기 ========
	   function goOqtyEdit(btn_obj){
		   
		   const index = $("button.updateBtn").index(btn_obj);
		   // alert(index);		==>	 0, 1, 2 ...
		   
		   const cart_num = $("input.cartno").eq(index).val();
		   
		   const cart_cnt = $("input#cart_cnt").eq(index).val();

		   const regExp = /^[0-9]+$/g;							//숫자만 체크하는 정규표현식을 만들어야 한다.
		   const bool = regExp.test(cart_cnt);
			  
	    	console.log("~~~확인용 cart_num: " + cart_num );	//42	
	    	console.log("~~~확인용 cart_cnt: " + cart_cnt );	//2
		   
	    	if(!bool){
			   alert("주문수량은 1개이상이어야 합니다.");
			   location.href="javascript:history.go(0)";	//수량 원상복구
			   return;
		   }
	    	
		   if(cart_cnt == 0){
			   goDel(cart_num);
		   }
		   else{
			//alert("장바구니 번호 "+cart_num + "번을 "+ cart_cnt +"개로 수정합니다");
			$.ajax({
			 		url:"<%= request.getContextPath()%>/cartEdit.ban",
			 		type:"POST",
			 		data:{"cart_num":cart_num,
			 			"cart_cnt":cart_cnt},
			 		dataType:"JSON",
			 		success:function(json){
			 			console.log("~~~확인용:" + JSON.stringify(json) );
			 			if(json.n == 1){
			 				// 장바구니 보기 페이지로 감
				    		alert("주문수량이 변경되었습니다.");
				    		location.href = "cartList.ban";
			 			}
			 		},
			 		 error: function(request, status, error){
		                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				    }
			 		
			 });	//end of $.ajax --------------------------------
		   }
			   
			   
	   } //end of function goOqtyEdit(btn_obj) -----------------
	   
	   

	   // === 장바구니에서 특정 제품을 비우기 === //  
	   function goDel(cart_num) {
		   
		   const pname = $("span.cart_pname").text();		
		   console.log("확인용:"+pname);
		   
		   const bool = confirm( "해당 상품을 장바구니에서 제거하시겠습니까?")  		
		   
		   <%-- true가 되어지면 지우는데, DB로 가야한다. insert되어진 cart_table에 특정 행을 delete해야함 ==> 
				class를 사용하지 않고 페이지이동을 안하면서 delete 해줘야함 ==> 
				$.ajax() 사용 (기본은 비동기방식, 동기방식: 결과물을 가지고 또 뭘 해야할때) 
				JSON.stringify()은 문자열로 바꿔서 나온다. 걍 찍으면 object 객체 나온다.
				--%>   
		   if(bool) {	   		  
			   
			   $.ajax({
					url:"<%= request.getContextPath()%>/cartDelete.ban",   
				    type:"post",
				    data:{"cart_num":cart_num},
				    dataType:"json",
				    success:function(json){
				    	console.log("~~~확인용 : " + JSON.stringify(json) );
				    	// ~~~확인용 : {"n":1}
				    	
				    	if(json.n == 1){
				    		// 장바구니 보기 페이지로 감
				    		location.href = "cartList.ban";
				    	}
				    	
				    },
				    error: function(request, status, error){
	                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				    }
			   });
		   
		   }
		   else {
		        alert("상품 삭제를 취소하셨습니다.");
		   }
		       
	   }// end of function goDel(cartno)---------------------------

	   
		// ======== 장바구니 선택상품 주문하기 ========
			
   		function goOrder() {

   	      // 체크박스의 체크된 개수
   	      const checked_cnt = $("input:checkbox[name='pnum']:checked").length;
   	      
   	      if(checked_cnt < 1){
   	    	  alert("주문하실 제품을 선택하세요.");
   	    	  return;
   	      }
   	      else{         
   	    	  //체크가 된 것만 값을 읽어와서 배열에 넣어준다. 
			const all_cnt = $("input:checkbox[name='pnum']").length;
   	    	  
            const pnum_arr = new Array();   
            const cart_cnt_arr = new Array();  
            const cart_num_arr = new Array();  
            const totalPrice_arr = new Array(); 
            const totalMileage_arr = new Array();  
            
            for(let i=0; i<all_cnt; i++){
            	
                if($("input:checkbox[name='pnum']").eq(i).prop("checked")) {   //eq.() : 끄집어 내자!
                	pnum_arr.push($("input:checkbox[name='pnum']").eq(i).val());
                	cart_cnt_arr.push($("input#cart_cnt").eq(i).val());
                    cart_num_arr.push($("input.cartno").eq(i).val());
                    totalPrice_arr.push($("input.totalPrice").eq(i).val());
                    totalMileage_arr.push($("input.totalMileage").eq(i).val());
                   
                }
            }//end of for ------------------------------------------

            const pnum_join = pnum_arr.join();
            const cart_cnt_join = cart_cnt_arr.join();
            const cart_num_join = cart_num_arr.join();
            const totalPrice_join = totalPrice_arr.join();
            const totalMileage_join = totalMileage_arr.join();
            
            let sum_totalPrice = 0;
            for(let i=0; i<totalPrice_arr.length; i++) {
               sum_totalPrice += Number(totalPrice_arr[i]);
            }
            sum_totalPrice += 3000;

            
            let sum_totalMileage = 0;
            for(let i=0; i<totalMileage_arr.length; i++) {
               sum_totalMileage += Number(totalMileage_arr[i]);
            }
            
            console.log("~~~ 확인용 pnum_join : "+pnum_join);
            console.log("~~~ 확인용 cart_cnt_join : "+cart_cnt_join);
            console.log("~~~ 확인용 cart_num_join : "+cart_num_join);
            console.log("~~~ 확인용 totalPrice_join : "+totalPrice_join);
            console.log("~~~ 확인용 totalMileage_join : "+totalMileage_join);
            console.log("~~~ 확인용 sum_totalPrice : "+sum_totalPrice);
            console.log("~~~ 확인용 sum_totalMileage : "+sum_totalMileage);
            
            
            if(confirm("총주문액 : "+sum_totalPrice.toLocaleString('en')+"원 결제하시겠습니까?")) {
                
                $.ajax({
                   url:"<%= request.getContextPath()%>/order.ban",
                   type:"post",
                   data:{"sum_totalPrice":sum_totalPrice,
                       "sum_totalMileage":sum_totalMileage,
                       "pnum_join":pnum_join,
                       "cart_cnt_join":cart_cnt_join,
                       "cart_num_join":cart_num_join,
                       "totalPrice_join":totalPrice_join
                       },
                   dataType:"json",
                   success:function(json) {
                      // json 은 {"isSuccess":1} 또는 {"isSuccess":0} 이다.
                      if(json.isSuccess == 1){
                     	 location.href="<%= request.getContextPath()%>/orderList.ban";
                      }
                      else{
                     	 location.href="<%= request.getContextPath()%>/orderError.ban";
                      }
                   },
                    error: function(request, status, error){
                         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                      }
                });	//end of $.ajax ------------------------------------------
             }//end of if --------------------------------------
            
            
   	      }// end of else --------------------------------------------
		   
	   }	//end of function goOrder() ----------------------


	   
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
                      <!--   <input type="hidden" name="mode" value="">
                        <input type="hidden" name="cart[cartSno]" value="">
                        <input type="hidden" name="cart[goodsNo]" value="">
                        <input type="hidden" name="cart[goodsCnt]" value="">
                        <input type="hidden" name="cart[addGoodsNo]" value="">
                        <input type="hidden" name="cart[addGoodsCnt]" value="">
                        <input type="hidden" name="cart[couponApplyNo]" value="">
                        <input type="hidden" name="useBundleGoods" value="1">
                        <input type="hidden" name="ac_id" value=""> -->
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
                                        <col style="width:10%"> <!-- 삭제 -->
                                    </colgroup>
                                  
                                  
                                    <thead>
                                    <tr>
                                        <th>        <!-- 전체선택 체크박스 allCheck-->
                                            <div class="form_element">
                                                <input type="checkbox" id="allCheck" class="gd_select_all_goods" onClick="allCheckBox();" />
                                            </div>
                                        </th>
                                        <th>상품/옵션 정보</th>
                                        <th>수량</th>
                                        <th>상품금액</th>
                                        <th>적립 마일리지</th>
                                        <th>합계금액</th>
                                        <th>삭제</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    
                                    <c:if test="${empty requestScope.cartList}">
						                      <p class="cart_no_data">장바구니에 담겨있는 상품이 없습니다.</p>
						            </c:if>   
						            
                                    <c:if test="${not empty requestScope.cartList}">
                                        <c:forEach var="cartvo" items="${requestScope.cartList}" varStatus="status"> 
		                                    <tr>
		                                        <td class="td_chk"> <%-- 선택상품 체크박스--%>  
		                                        <%-- 체크박스 및 제품번호 --%>
					                             <%-- c:forEach 에서 선택자 id를 고유하게 사용하는 방법  
					                                  varStatus="status" 을 이용하면 된다.
					                                  status.index 은 0 부터 시작하고,
					                                  status.count 는 1 부터 시작한다. 
					                             --%>   
		                                            <div class="form_element">
		                                                <input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value="${cartvo.product_num}" /><label for="pnum${status.index}"></label>   
		                                            </div>
		                                        </td>
		
		                                        <td class="td_left">    <%-- 상품 이미지 정보 (클릭시 이동) 및 제품명 --%>
		                                            <div class="pick_add_cont"> 
		                                                <div class="pick_add_img_info"> 
		                                                    <a href="/SemiProject/productDeatail.ban?pnum=${cartvo.pvo.product_num}">
		                                                    <img src="/SemiProject/images/${cartvo.pvo.main_image} }" width="60"
		                                                        alt="${cartvo.pvo.product_title}" title="${cartvo.pvo.product_title}">
		                                                    </a> 
		                                                    
		                                                    <span class="cart_pname"><a href="/SemiProject/productDeatail.ban">${cartvo.pvo.product_title}</a></span>
		                                                </div>
		                                            </div>
		                                        </td>
		                                        
												 <%-- 장바구니 수량 / 변경 --%>
		                                        <td class="td_order_amount">   
		                                            <div class="order_goods_num">
		                                                <div class="btn_gray_list">
		                                                    <p><label for="number"></label><input type="number" id="cart_cnt" min="1"  max="50" step="1" value="${cartvo.product_count}" /></p>
		                                                </div>        
		                                                <button class="btn btn-outline-secondary btn-sm updateBtn" type="button" onclick="goOqtyEdit(this)">수정</button>
							                              <%-- 장바구니 테이블에서 특정제품의 현재주문수량을 변경하여 적용하려면 먼저 장바구니번호(시퀀스)를 알아야 한다 --%>
							                            <input type="hidden" class="cartno" name="cartno" value="${cartvo.cart_num}" /> 
		                                            </div>
		                                        </td>
		                                        
		                                        <%-- 상품 금액 --%>
		                                        <td>  
		                                            <span class="order_sum_txt price" style="font-weight:bold;"><fmt:formatNumber value="${cartvo.product_price}" pattern="###,###" /></span> 원
		                                        </td>
		
												 <%-- 마일리지 --%>
		                                        <td class="td_mileage">    
		                                                <ul class="mileage_list">
		                                                    <li class="mileage_mileage">
																<strong class="cart_mileage" name="cart_mileage" value="${cartvo.totalMileage}">${cartvo.totalMileage}</strong> 마일리지
		                                                    </li>
		                                                </ul>
		                                        </td>
		                                        <%-- 상품 당 합계금액 --%>
		                                        <%-- 
		                                        <td>
		                                            <div class="allprice_won"><fmt:formatNumber value="${carvo.totalPrice}" pattern="###,###" />원</div>
		                                            <div class="allprice_mileage"><fmt:formatNumber value="${carvo.totalMileage}" pattern="###,###"/>마일리지</div>
			                                    </td>
			                                    --%>
			                                    <td>
			                                    	<strong><fmt:formatNumber value="${cartvo.totalPrice}" pattern="###,###" /> 원</strong>
		                                           <input type="hidden" class="totalPrice" value="${cartvo.totalPrice}" />
                            						<input type="hidden" class="totalMileage" value="${cartvo.totalMileage}" />
			                                    </td>
			                                    <%-- 상품 삭제 --%>
			                                    <td>
                          							  <button type="button" class="btn btn-outline-danger btn-sm" onclick="goDel('${cartvo.cart_num}')">삭제</button>  
			                                    </td>
			                                </tr>
			                            </c:forEach>    
			                            	
		                                    
                                    </c:if>
        
                                    </tbody>
        
        
                                </table>
                            </div>
        
                        </div>
                       
                        <%-- //cart_cont_list --%>
                        <%-- 장바구니 상품리스트 끝 --%>
        
        
                    </form>
        
                    <div class="btn_left_box">
                        <a href="<%= request.getContextPath() %>/homebread.ban" class="shop_go_link"><span>&lt; 쇼핑 계속하기</span></a>
                    </div>
        
                    <div class="price_sum">
                        <div id="price_sum_cont">
                            <div id = "price_box">
                                <div class = "allprice">
                                    <div class = "allprice_head">
                                        총 상품 금액
                                    </div>
                                    <div class="allprice_won"><fmt:formatNumber value="${requestScope.sumMap.SUMTOTALPRICE}" pattern="###,###"/>원</div>
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

								<%-- 총 상품금액 + 3,000(배송비) --%>
                                <div class = "allprice">
                                    <div class = "allprice_head">
                                        합계
                                    </div>
                                    <div class="allprice_won"><fmt:formatNumber value="${requestScope.sumPriceDelivery}" pattern="###,###"/>원</div>
                                </div>
                                
                            </div>
						 
                        <div id="deliveryChargeText" class="tobe_mileage"></div>
                       <div class="tobe_mileage">총 마일리지 : <span id="totalGoodsMileage"></span></div>
                        </div>
                        <!-- //price_sum_cont -->
                    </div>
                    <!-- //price_sum -->
        
                    <div class="btn_order_whole_box">
                        <div class="btn_delete_box">
                            <button type="button" class="btn_order_choice_del">선택 상품 삭제</button>
                        </div>
                        <div class="btn_order_box">
                            <button type="button" class="btn_order_whole_buy" onclick="goOrder()">선택 상품 주문</button>
                        </div>
                    </div>
                    <div class="chk_none"> ※ 주문서 작성단계에서 마일리지 적용을 하실 수 있습니다.</div>                    
                </div>
        
       	 </div><!--cart_content_box 끝-->
    	</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
