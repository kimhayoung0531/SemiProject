<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /SemiProject
%>  
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<!-- Optional JavaScript -->
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	
	
    <!-- jQueryUI CSS 및 JS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.css" />
	<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.js"></script>

    <!-- 아이콘 JS-->
    <script src="https://kit.fontawesome.com/b7b1b05ad5.js" crossorigin="anonymous"></script>
    
    <!-- 구글 icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- original css -->
    <link href="<%=ctxPath %>/css/style.css" rel="stylesheet" type="text/css"></style>
    
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">

    <!-- slick 슬라이드 -->

    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
</head>
<body>

<jsp:include page="../header.jsp" />
		     
		    
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
                                                <a href="http://localhost:9090/SemiProject/drimil.ban">
                                                <span> 우유</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/dricof.ban">
                                                <span> 커피</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/driade.ban">
                                                <span> 에이드/TEA</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/drismo.ban">
                                                <span> 스무디/쉐이크</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div> <!-- end of ojh_left_wing -->

                                <div class="ojh_right_content goods_list">
                                    

                                    <div class="ojh_good_pick_list" style="">
                                        <form name="ojh_frmList" action>
                                            <input type="hidden" name="ojh_cateCd" value="023">
                                              <div class="ojh_pick_list_box">
                                                  <span class="ojh_pick_list_num pull_left" style="padding: 0px 0px 0px 63px;">
                                                      상품
                                                      <strong>100000000</strong>
                                                      개
                                                  </span>

                                                  <ul class="ojh_pick_list">
                                                    <li>
                                                        <input type="radio" id="sort1" class="ojh_radio" name="sort" value>
                                                        <label for="sort1" class="on">추천순</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" id="sort2" class="ojh_radio" name="sort" value>
                                                        <label for="sort2" >판매인기순</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" id="sort3" class="ojh_radio" name="sort" value>
                                                        <label for="sort3" >낮은가격순</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" id="sort1" class="ojh_radio" name="sort" value>
                                                        <label for="sort1" >높은가격순</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" id="sort1" class="ojh_radio" name="sort" value>
                                                        <label for="sort1" >상품평순</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" id="sort1" class="ojh_radio" name="sort" value>
                                                        <label for="sort1" >등록일순</label>
                                                    </li>
                                                    
                                                  </ul>

                                                  <div class="ojh_choice_num view">
                                                     <select class="ojh_chosen-select" name="pageNum" style="display:none;">
                                                        <option value="10" selected="selected">10개씩보기</option>
                                                        <option value="20">20개씩보기</option>
                                                        <option value="30">30개씩보기</option>
                                                        <option value="40">40개씩보기</option>
                                                     </select> 
                                                     <div class="ojh_chosen_container chosen_container_single " style="width: 120px;">
                                                        <a class="ojs_chosen_single">
                                                            <div>
                                                                <b></b>
                                                            </div>
                                                        </a>
                                                    </div>
                                                  </div>
          
                                              </div>  
                                          </form>
                                    </div> <!-- end of ojh_good_pick_list -->
                                    <div class="ojh_goods_list basic_product">
                                      <div class="ojh_goods_list_cont" style="display: inline-block;
                                                                              text-align: center;
                                                                              margin: 10px 0px 0px 36px;">  
                                        <div class="ojh_item_gallery_type">
                                        <ul>
                                            <li style="width: 33.333333%;">

                                                    <div class="ojh_imte_cont">
                                                        <div class="ojh_photo_box">
                                                            <a href="#">
                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
                                                            </a>

                                                        </div>
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
                                                                <a href="#">
                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
                                                
                                                <li style="width: 33.333333%;">

                                                    <div class="ojh_imte_cont">
                                                        <div class="ojh_photo_box">
                                                            <a href="#">
                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
                                                            </a>

                                                        </div>
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
                                                                <a href="#">
                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
                                           
                                           		<li style="width: 33.333333%;">

                                                    <div class="ojh_imte_cont">
                                                        <div class="ojh_photo_box">
                                                            <a href="#">
                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
                                                            </a>

                                                        </div>
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
                                                                <a href="#">
                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
                                           		
                                           		<li style="width: 33.333333%;">

                                                    <div class="ojh_imte_cont">
                                                        <div class="ojh_photo_box">
                                                            <a href="#">
                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
                                                            </a>

                                                        </div>
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
                                                                <a href="#">
                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
                                           	
                                           		<li style="width: 33.333333%;">

                                                    <div class="ojh_imte_cont">
                                                        <div class="ojh_photo_box">
                                                            <a href="#">
                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
                                                            </a>

                                                        </div>
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
                                                                <a href="#">
                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
                                           
                                           <li style="width: 33.333333%;">

                                                    <div class="ojh_imte_cont">
                                                       
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
                                                                <a href="#">
                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
                                           
                                           <li style="width: 33.333333%;">

                                                    <div class="ojh_imte_cont">
                                                        <div class="ojh_photo_box">
                                                            <a href="#">
                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
                                                            </a>

                                                        </div>
                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
                                                                <a href="#">
                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
	                                           
	                                           <li style="width: 33.333333%;">
	
	                                                    <div class="ojh_imte_cont">
	                                                        <div class="ojh_photo_box">
	                                                            <a href="#">
	                                                                <img src="<%=ctxPath%>/image/item_main/2.jpg" width="245" alt="[베스트 상품] 우유크림카스테라" title="[베스트 상품] 우유크림카스테라 " class="middle" >
	                                                            </a>
	
	                                                        </div>
	                                                        <div class="item-info-cont" style="display:block; text-align: left; margin: 20px 0px 20px 24px;">
	                                                                <a href="#">
	                                                                <strong class="item_name" style="direction: ltr;">[베스트 상품] 우유크림카스테라</strong>
	                                                                <span class="ojh_item_name_explain">부드럽고 담백한 카스테라</span>
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
                                           
                                           		
                                           		
                                           		
                                           	
                                           
                                           
                                                
                                        </ul>
                                    </div>

                                </div> <!-- end of ojh_right_content goods_list -->



                            </div> <!-- end of ojh_container relative clearfix -->

                        </div> <!-- end of ojh_content -->

                    </div> <!-- end of ojh_sub_content -->

                </div> <!-- end of content -->

             </div> <!-- end of container -->

             
<jsp:include page="../footer.jsp" />

</body>
</html>