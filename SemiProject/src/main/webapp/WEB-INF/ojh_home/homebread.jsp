<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /SemiProject
%>  
  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  

    <jsp:include page="../header.jsp" />
		    
		    <script>
		    	$('#sortAbc').click(function(){
		    		let productsAbc = products.slice();
		    		productsAbc.sort(function(items1, items2){
		    			if(item1.title < item2.title) return -1;
		    			else if(item1.title == item2.title) return 0;
		    			else return 1;
		    		});
		    		
		    	});
		    
		    </script>
		    
		     <div id="container">
                
                <div id="content">

                    <div class="ojh_sub_content">

                        <div class="ojh_content">

                            <div class="ojh_location_wrap">
                                <div class="ojh_location_cont">
                                </div> <!-- end of ojh_location_cont -->
                            </div> <!-- end of ojh_location_wrap --> 
                          
                            <div class="ojh_container relative clearfix" style="position: relative;" width: 1240px; margin: 0 auto;>
                           
                           
                                <div class="ojh_left_wing">
                                
                                    <div class="ojh_current-cate" >
                                        <h3 class="ojh_li" style="line-height: 40px;"> 빵 </h3>
                                    </div>
                                    <div class="ojh_category-box" >
                                        <ul>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/homebread.ban">
                                                <span> 빵</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/homecake.ban">
                                                <span> 케이크</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/homedessert.ban">
                                                <span> 디저트</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/homedrink.ban">
                                                <span> 피자&브리또</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
								</div> <!-- end of ojh_left_wing -->
								
								
                                <div class="ojh_right_content goods_list">
                                     <div class="ojh_addition_zone" style="padding: 0px 0px 20px 0px;">
                           
                                        <p style="text-align: center;" >
                                            <img src="<%=ctxPath%>/image/bread_ba.jpg" style="width: 900px; height: 300px;">
                                        </p>
                                    </div> 

                                    <div class="ojh_good_pick_list">
                                       <div class="card-group container" id="items"></div>
                                           <div class="ojh_pick_list_box" style="margin: 0px 0px 10px 0px;">
                                              <button type="button" class="btn" id="sortAbc"></button>
                                              <button type="button" class="btn" id="sortAbc"></button>
                                              <button type="button" class="btn" id="sortAbc"></button>
                                              	 
                                                 <div class="ojh_choice_num view">
                                                    
                                                     <div class="ojh_chosen_container chosen_container_single " style="width: 120px;">
                                                        <a class="ojs_chosen_single">
                                                            <div>
                                                                <b></b>
                                                            </div>
                                                        </a>
                                                    </div>
                                                  </div>
                                              </div>  
                                    </div> <!-- end of ojh_good_pick_list -->
                                    
                                   
                                 
                                  <div class="ojh_goods_list basic_product">
                                     <div class="ojh_goods_list_cont" > 
                                       
                                                                                  
                                       <div class="ojh_item_gallery_type" style="display: inline-block;
                                                                              text-align: center;
                                                                              margin: 10px 0px 0px 36px;">
                                        	<ul>
                                        	    <li class="ojh_li" style="width: 93%;">
                                        	    
												  <c:forEach var="pvo" items="${pvoList}" varStatus="status">		
                                                    <div class="ojh_imte_cont" style="display: inline-block;">
                                                        <div class="ojh_photo_box" style="display: inline-block">
                                                            <a href="<%= request.getContextPath()%>/productDeatail.ban?product_num=${pvo.product_num}">
                                                                <img src="<%=ctxPath%>/image/item_main/${pvo.main_image}" width="245" alt="" title=" " >
                                                            </a>

                                                        </div>
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 15px 0px 15px 0px;">
                                                                <a href="<%= request.getContextPath()%>/productDeatail.ban?product_num=${pvo.product_num}">
                                                                <strong class="item_name" style="direction: ltr;">${pvo.product_title}</strong>
                                                                
                                                                <span class="ojh_item_name_explain" style="color: #a8a8a8;">${pvo.product_detail}</span>
                                                                </a>
                                                            <div class="imem_money_box">
                                                                <span class="precent" style="display: none;"></span>
                                                                <strong class="item_price">
                                                                    <span >${pvo.product_price}원 </span>
                                                                    <span style="color: #888; text-decoration: line-through;">
                                                                    </span>
                                                                </strong>
                                                            </div>
                                                        </div> 
                                                    </div>
                                                  </c:forEach>  
                                                  
                                                </li>
                                        	</ul>
                                        </div> <!-- ojh_item_gallery_type -->
                                       </div>
                                      </div>
                                        
                               		
									
                                   </div> <!-- ojh_goods_list_cont -->
                                </div> <!-- ojh_goods_list basic_product -->
                             </div> <!-- ojh_right_content goods_list -->
                           </div> <!-- end of ojh_container relative clearfix -->
                        </div> <!-- ojh_content -->
                    </div> <!-- ojh_sub_content -->
                </div> <!-- content -->
             </div> <!-- container -->
             
<jsp:include page="../footer.jsp" />

