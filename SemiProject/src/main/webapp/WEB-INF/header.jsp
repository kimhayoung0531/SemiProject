<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
	// SemiProject
%>    
    
  
<!DOCTYPE html>
<html lang="en">
<head>
	
	<title> 세미 프로젝트 </title>
	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
	<!-- 구글 icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

    <!-- jQueryUI CSS 및 JS -->
    <link rel="stylesheet" type="text/css" href="/jquery-ui-1.13.1.custom/jquery-ui.css" />
    <script type="text/javascript" src="/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
    
    <!-- 아이콘 JS-->
    <script src="https://kit.fontawesome.com/b7b1b05ad5.js" crossorigin="anonymous"></script>

    <!-- original css -->
    <link href="<%=ctxPath%>/css/style.css" rel="stylesheet" type="text/css"></style>
    
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
                                    <img src="<%=ctxPath%>/image/main_logo.png">
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
                                        <a href="#">
                                        	 <img src="<%=ctxPath%>/image/icon_heart_ku.svg">
                                        </a>
                                    </li>
                                    <li class="cartBtn">
                                        <a href="#">
                                        	 <img src="<%=ctxPath%>/image/icon_cart_ku.svg">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                       
                    </div>
                    <div class="header_gnb" id="gnb"> <!-- 전체카테고리, 베스트 할인상품 이벤트  --> 
                        <div class="gnb">
                            <div class="allMenu">
                              <li> 
                                <div class="switch">전체 카테고리
                                    <div class="switch_submenu">
                                        <ul class ="switch_detail_submenu" >
                                              <li class="ojh_li"><a href="http://localhost:9090/SemiProject/homebread.ban">빵</a>
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
                                    <li><a href="http://localhost:9090/SemiProject/homebest.ban">베스트</a></li>
                                    <li><a href="">이벤트</a></li>
                                    <li><a href="">구매후기</a></li>
                                    <li><a href="">고객센터</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
             <!-- // header wrap --> 