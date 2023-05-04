<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
	String ctxPath = request.getContextPath();
	// SemiProject
%>    
    


 <jsp:include page="../header.jsp" />  
             

    
             <!-- // header wrap --> 
            <div id="container">
                <div id="contents">

                    <!-- 본문 시작 -->
                    <!-- // location_wrap -->
                    <div class="sub_content">
                        
                        <!-- 메인배너 배너 시작 -->
                         <div class="main_content"> 
                            <div class="visual_0">
                                <div>
                                  <a href="#">
                                    <img src="<%=ctxPath%>/image/evt_ba1.jpg" class="middle">
                                  </a>
                                </div>
                        
                                <div>
                                  <a href="#">
                                    <img src="<%=ctxPath%>/image/evt_ba2.jpg" class="middle">
                                  </a>
                                </div>
                        
                                <div>
                                  <a href="#">
                                    <img src="<%=ctxPath%>/image/evt_ba3.jpg" class="middle">
                                  </a>
                                </div>
                                
                            </div>
                            <script type="text/javascript">
                                
                                  $('.visual_0').slick();
                            </script>
                        </div>
                   
                     
                     <!-- 메인배너 배너 끝 -->
                         <!-- // main_visual -->

                         <!-- 상품 및 이벤트 출력 영역 -->
                        <div class="main_content">
                            <!---------------- 카테고리 상품 영역 --------------->
                                <!--------------신상도 할인중 뜨는 곳 --------------->
                                <div class="goods_list main_wrap_222" style="
                                    padding: 20px 5px;">
                            
                                    <div class="goods_list_tit">
                                        <h3>
                                         <a href="#" class="btn_goods_view_moer"> 먹고 또 먹어 BEST 상품 👍</a>
                                        </h3>
                                        <h4></h4>
                                    </div>
                                   
                                   
                                    <div class="goods_list_cont_1 goods_content_222">
                                    
                                         <section class="visual_1">
                                         
                                       
                                          <li class="slick-slider slick-current" style="width: 265px;"> 
                                          <c:forEach var="pvo" items="${pvohomeList}" varStatus="status">
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="<%=ctxPath%>/productDeatail.ban?product_num=${pvo.product_num}">
                                                    <img src="<%=ctxPath%>/image/item_main/${pvo.main_image}" width="200" alt="[15~20% 할인]감사의 달 타르트" title="[15~20% 할인]감사의 달 타르트 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left; margin: 0px 0px 0px 25px;">
                                                    <a href="<%=ctxPath%>/productDeatail.ban?product_num=${pvo.product_num}">
                                                    <strong class="item_name" style="direction: ltr;">${pvo.product_title}</strong>
                                                    <span class="ojh_item_name_explain" style="color: #a8a8a8; display: flex;">${pvo.product_detail}</span>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">20%</span>
                                                    <strong class="item_price">
                                                        <span >${pvo.product_price}원 </span>
                                                        
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                             
                                          </li> 
											</c:forEach>
									     </section>
									     
									 
                                          <script type="text/javascript">
                                            $('.visual_1').slick({
                                                dots: false,
                                                infinite: true,
                                                speed: 300,
                                                slidesToShow: 4,
                                                slidesToScroll: 1,
                                                responsive: [
                                                    {
                                                    breakpoint: 1024,
                                                    settings: {
                                                        slidesToShow: 3,
                                                        slidesToScroll: 3,
                                                        infinite: true,
                                                        dots: false
                                                    }
                                                    },
                                                    {
                                                    breakpoint: 600,
                                                    settings: {
                                                        slidesToShow: 2,
                                                        slidesToScroll: 2
                                                    }
                                                    },
                                                    {
                                                    breakpoint: 480,
                                                    settings: {
                                                        slidesToShow: 1,
                                                        slidesToScroll: 1
                                                    }
                                                    }
                                                    // You can unslick at a given breakpoint now by adding:
                                                    // settings: "unslick"
                                                    // instead of a settings object
                                                ]
                                                });
                                          </script>
                                    </div>
                               
                                </div>
                                <!-- 메인페이지 중간배너 -->
                                <a href="#">
                                   <img src="<%=ctxPath%>/image/Mid_ba.jpg"> 
                                </a>

                                <div class="goods_list main_wrap_223" style="
                                padding: 20px 5px;">
                            
                                    <div class="goods_list_tit">
                                        <h3>
                                         <a href="#" class="btn_goods_view_moer">5월 신상이 왔어요~👍</a>
                                        </h3>
                                        <h4></h4>
                                    </div>
                                    <div class="goods_list_cont_1 goods_content_222">
                                        <section class="visual_2">
                                          <li class="slick-slider slick-current" style="width: 265px;"> 
                                          
                                          <c:forEach var="pvo" items="${pvoNewList}" varStatus="status">
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="<%=ctxPath%>/productDeatail.ban?product_num=${pvo.product_num}">
                                                    <img src="<%=ctxPath%>/image/item_main/${pvo.main_image}" width="200" alt="[15~20% 할인]감사의 달 타르트" title="[15~20% 할인]감사의 달 타르트 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left; margin: 0px 0px 0px 25px;">
                                                    <a href="<%=ctxPath%>/productDeatail.ban?product_num=${pvo.product_num}">
                                                    <strong class="item_name" style="direction: ltr;">${pvo.product_title}</strong>
                                                    <span class="ojh_item_name_explain" style="color: #a8a8a8; display: flex;">${pvo.product_detail}</span>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">20%</span>
                                                    <strong class="item_price">
                                                        <span >${pvo.product_price}원 </span>
                                                        
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                             
                                          </li> 
											</c:forEach>
                                          
                                          </section>
                                          <script type="text/javascript">
                                            $('.visual_2').slick({
                                                dots: false,
                                                infinite: true,
                                                speed: 300,
                                                slidesToShow: 4,
                                                slidesToScroll: 1,
                                                responsive: [
                                                    {
                                                    breakpoint: 1024,
                                                    settings: {
                                                        slidesToShow: 3,
                                                        slidesToScroll: 3,
                                                        infinite: true,
                                                        dots: false
                                                    }
                                                    },
                                                    {
                                                    breakpoint: 600,
                                                    settings: {
                                                        slidesToShow: 2,
                                                        slidesToScroll: 2
                                                    }
                                                    },
                                                    {
                                                    breakpoint: 480,
                                                    settings: {
                                                        slidesToShow: 1,
                                                        slidesToScroll: 1
                                                    }
                                                    }
                                                    // You can unslick at a given breakpoint now by adding:
                                                    // settings: "unslick"
                                                    // instead of a settings object
                                                ]
                                                });
                                          </script>
                                    </div>
                                </div>


                                <div class="goods_list main_wrap_224" style="
                                padding: 20px 5px;">
                            
                                    <div class="goods_list_tit">
                                        <h3>
                                         <a href="#" class="btn_goods_view_moer">지금 여기는 파리 어디쯤..👍</a>
                                        </h3>
                                        <h4></h4>
                                    </div>
                                    <div class="goods_list_cont_1 goods_content_222">
                                        <section class="visual_3">
                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/17.jpg" width="200" alt="[15%~20% 할인] 애플파이" title="[15%~20% 할인] 애플파이 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트 상품]  애플파이</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >21,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/18.jpg" width="200" alt="[베스트 상품] 조각케익 4종" title="[베스트 상품] 조각케익 4종 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트 상품] 조각케익 4종</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >3,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/19.jpg" width="200" alt="[베스트 상품] 반미 바게트 B" title="[베스트 상품] 반미 바게트 B" " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트 상품] 반미 바게트 B"</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >4,500원</span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/20.jpg" width="200" alt="[베스트 상품] 초콜릿 브라우니" title="[베스트 상품] 초콜릿 브라우니 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트 상품] 초콜릿 브라우니</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >22,500원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/21.jpg" width="200" alt="[베스트 상품] 얼그레이 레몬 스콘" title="[베스트 상품] 얼그레이 레몬 스콘 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트 상품] 얼그레이 레몬 스콘</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >14,500원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/22.jpg" width="200" alt="[베스트 상품] 진짜 고구마빵" title="[베스트 상품] 진짜 고구마빵 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트 상품] 진짜 고구마빵</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >19,500원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/23.jpg" width="200" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >3,500원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/24.jpg" width="200" alt="[베스트상품] 플레인롤" title="[베스트상품] 플레인롤" class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[베스트상품] 플레인롤</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >18,500원</span>
                                                        <span style="color: #888; text-decoration: line-through;">
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                          </section>
                                          <script type="text/javascript">
                                            $('.visual_3').slick({
                                                dots: false,
                                                infinite: true,
                                                speed: 300,
                                                slidesToShow: 4,
                                                slidesToScroll: 1,
                                                responsive: [
                                                    {
                                                    breakpoint: 1024,
                                                    settings: {
                                                        slidesToShow: 3,
                                                        slidesToScroll: 3,
                                                        infinite: true,
                                                        dots: false
                                                    }
                                                    },
                                                    {
                                                    breakpoint: 600,
                                                    settings: {
                                                        slidesToShow: 2,
                                                        slidesToScroll: 2
                                                    }
                                                    },
                                                    {
                                                    breakpoint: 480,
                                                    settings: {
                                                        slidesToShow: 1,
                                                        slidesToScroll: 1
                                                    }
                                                    }
                                                    // You can unslick at a given breakpoint now by adding:
                                                    // settings: "unslick"
                                                    // instead of a settings object
                                                ]
                                                });
                                          </script>
                                    </div> <!-- goods_list_cont_1 goods_content_222 -->
                                </div> <!-- goods_list main_wrap_224 -->


                        </div> <!-- main_content -->
                    </div> <!-- ojh_sub_content -->
                         
                </div> <!-- content -->
            </div> <!-- container -->
        
             <!-- // sub_content -->

<jsp:include page="../footer.jsp" />