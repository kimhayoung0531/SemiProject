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
    <div class="body-main body-index pc">
        <div id="wrap">
            <div id="header_wrap">
                <div id="header">
                    <div class="header_top"> <!--회원가입 로그인 고객센터--> 
                        <div class="header_top_cont">
                            <ul class="top_member_box">
                                <li>
                                    <a href="#">회원가입</a>
                                    <span class="txt_bar"></span>
                                </li>

                                <li>
                                    <a href="#">로그인</a>
                                    <span class="txt_bar"></span>
                                </li>

                                <li>
                                    <a href="#">고객센터</a>
                                    <span class="txt_bar"></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="header_search"> <!-- 검색창, 찜, 장바구니--> 
                        <div class="header_search_cont">
                            <div class="h1_logo">
                                <a href="http://localhost:9090/SemiProject/home.ban">
                                    <img src="<%=ctxPath%>\image\main_logo.png">
                                </a>
                            </div>

                            <div class="headSearch">
                                <div class="top_search">
                                    <form name="frmSearchTop" id="frmSearchTop">
                                        <fieldset>
                                            <legend>검색폼</legend>
                                            <div class="top_search_cont">
                                                <div class="top_text_cont">
                                                    <input type="text" id="search_form" name="keyword" class="top_srarch_text" title placeholder="검색어를 입력해주세요" autocomplete="off">
                                                    <input type="image" src="<%=ctxPath%>/image/icon-search-b.png" id="btnSearchTop" class="btn_top_srarch" title="검색" value="검색" alt="검색" />
                                                        
                                                </div>
                                            </div>
                                            <!-- //top_search_cont -->
                                        </fieldset>
                                    </form>
                                </div>
                                <!-- top_search-->
                            </div>
                            <div class="headBtn">
                                <ul>
                                    <li class="mypageBtn">
                                        <a href="#"></a>
                                    </li>
                                    <li class="cartBtn">
                                        <a href="#"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                       
                    </div>
                    <div class="header_gnb" id="gnb"> <!-- 전체카테고리, 베스트 할인상품 이벤트 공지사항 --> 
                        <div class="gnb">
                            <div class="allMenu">
                              <li> 
                                <div class="switch">전체 카테고리
                                    <div class="switch_submenu">
                                        <ul class ="switch_detail_submenu" >
                                        <li class="ojh_li">
                                                <a href="http://localhost:9090/SemiProject/homebread.ban">빵</a>
                                                <ul class="sub_delth1" >
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/breadnomal.ban">식빵</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/breadhealth.ban">건강빵</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/breaddonut.ban">도넛/고로케</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/breadpastry.ban">패스트리</a></li>
                                                </ul>
                                            </li>                                           
                                            <li class="ojh_li"><a href="http://localhost:9090/SemiProject/homecake.ban">케이크</a>
                                                <ul class="sub_delth1">
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/cakecream.ban">생크림 케이크</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/cakeclassic.ban">클래식 케이크</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/cakecharacter.ban">캐릭터 케이커</a></li>
                                                </ul>
                                            </li>
                                            <li class="ojh_li"><a href="http://localhost:9090/SemiProject/homedessert.ban">디저트</a>
                                                <ul class="sub_delth1">
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/desscok.ban">쿠키</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/desscho.ban">초코/캔디</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/dessice.ban">아이스</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/dessmac.ban">마카롱</a></li>
                                                </ul>
                                            </li>
                                            <li class="ojh_li"><a href="http://localhost:9090/SemiProject/homedrink.ban">음료</a>
                                                <ul class="sub_delth1">
                                                   <li class="ojh_li"><a href="http://localhost:9090/SemiProject/drimil.ban">우유</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/dricof.ban">커피</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/driade.ban">에이드/TEA</a></li>
                                                    <li class="ojh_li"><a href="http://localhost:9090/SemiProject/drismo.ban">스무디/쉐이크</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                              </li>   
                            </div>
                            <div class="centerMenu">
                                <ul>
                                    <li><a href="">베스트</a></li>
                                    <li><a href="">이벤트</a></li>
                                    <li><a href="">구매후기</a></li>
                                    <li><a href="">공지사항</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
             <!-- // header wrap --> 
		     
		    
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
                                                <a href=http://localhost:9090/SemiProject/cakecream.ban">
                                                <span> 생크림 케이크</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/cakeclassic.ban">
                                                <span> 클래식 케이크</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/cakecharacter.ban">
                                                <span> 캐릭터 케이크</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="">
                                                <span> </span>
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

             
             <div id="footer_wrap">
                <div id="footer">
                    <div class="foot_list">
                       <div class="container clearfix" style="display: flex;">
                            <!-- 인스타그램 영역 -->
                            <ul class="sns-menu pull-right inline">
                                    <li><a href="https://www.instagram.com/cafenoli/" target="_blank"><img src="https://cafenoli605.hgodo.com/data/renewal_nodelete/icon_ins.png" alt="인스타그램"></a></li>
                                    <li><a href="https://www.youtube.com/channel/UCEm9hmf4I4ZmMGl6NrDl4Mw" target="_blank"><img src="https://cafenoli605.hgodo.com/data/renewal_nodelete/icon_youtube.png" alt="유튜브"></a></li>
                                    <li><a href="http://pf.kakao.com/_wTxomxl" target="_blank"><img src="https://cafenoli605.hgodo.com/data/renewal_nodelete/icon_kakao.png" alt="카카오"></a></li>
                                       <li><a href="https://blog.naver.com/happy3845" target="_blank"><img src="https://cafenoli605.hgodo.com/data/renewal_nodelete/icon_blog.png" alt="블로그"></a></li>
                            </ul>
                            <!--// 인스타그램 영역 -->
                        </div>
                    </div> <!-- foot_list -->
                    
                    <div class="footer-bottom">
                        <div class="container clearfix" style="display: flex;">
                            <!-- 고객센터 -->
                            <div class="h1_logo" style="margin: 30px 0px 0px 50px;
                                                        padding: 0px 175px;">
                                <a href="#">
                                    <img src="<%=ctxPath%>\image\main_logo.png" style="width: 150px;">
                                </a>
                            </div>
                           
                            <!--// 커뮤니티 -->
                            <!-- 팀원 -->
                            <div class="company-info pull-left" style="margin: 30px 0px 0px 140px;">
                                <div class="team-title"><p> 팀 원 </p></div>
                                <div class="info">
                                    <p> 김하영(조장) &nbsp&nbsp 성가은 &nbsp&nbsp 김진솔 &nbsp&nbsp&nbsp&nbsp  </p>
                                    <p> 오준혁 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 박준엽 &nbsp&nbsp 박주진</p>
                                    
                               
                            
                            </div>
                            <!--// 회사정보 -->
                        </div>
                    </div>
                    <div class="copyright text-center">
                        <p>copyright © by www.cafenoli.com All Right Reserved</p>
                    </div>
                    <!-- //foot_cont -->
                    <div class="foot_certify">
                        <span></span>
                        <span></span>
                    </div>
                    <!-- //foot_certify -->
                </div>
            </div>
     </div>


</body>
</html>