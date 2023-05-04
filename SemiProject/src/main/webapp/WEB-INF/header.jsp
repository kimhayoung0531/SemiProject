<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <!--  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> -->
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>

    </script>
</head>
<body>
    <div class="body-main body-index pc">
        <div id="wrap">
        
            <div id="header_wrap">
                <div id="header">
                    <div class="header_top"> <!--회원가입 로그인 고객센터--> 
                        <div class="header_top_cont">
                            <ul class="top_member_box">
                				<c:if test="${empty sessionScope.loginuser.user_id}"> <!-- 로그인 하기전  -->
		                            <ul class="top_member_box">
		                                <li>
		                                    <a href="<%= ctxPath%>/registerAgreement.ban">회원가입</a>
		                                    <span class="txt_bar"></span>
		                                </li>
		
		                                <li>
		                                    <a href="<%= ctxPath%>/login.ban">로그인</a>
		                                    <span class="txt_bar"></span>
		                                </li>
		                                 <li>
		                                    <a href="<%= ctxPath%>/notice.ban">고객센터</a>
		                                    <span class="txt_bar"></span>
		                                </li>
		                           	 </ul>
		                          </c:if>
		                          <c:if test="${not empty sessionScope.loginuser}"> <!-- 로그인 하기 후  -->
		                            <ul class="top_member_box">
		                                <li>
		                                    <a href="<%= ctxPath%>/logout.ban">로그아웃</a>
		                                    <span class="txt_bar"></span>
		                                </li>
		
		                                <li>
		                                    <a href="<%= ctxPath%>/notice.ban">고객센터</a>
		                                    <span class="xtt_bar"></span>
		                                </li>
		                                 <li>
		                                    <a href="<%= ctxPath%>/mypage.ban">마이페이지</a>
		                                    <span class="txt_bar"></span>
		                                </li>
		                            </ul>
		                          </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="header_search"> <!-- 검색창, 찜, 장바구니--> 
                        <div class="header_search_cont">
                            <div class="h1_logo">
                                <a href="http://localhost:9090/SemiProject/home.ban">
                                    <img src="<%=ctxPath%>/image/main_logo_bp.png">
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
                                        <a href="<%= ctxPath%>/mypage.ban">
                                        	 <img src="<%=ctxPath%>/image/my-page.svg">
                                        </a>
                                    </li>
                                    <li class="cartBtn">
                                        <a href="<%=ctxPath%>/cartList.ban">
                                        	 <img src="<%=ctxPath%>/image/icon_cart_ku.svg" style="margin: 7px 0px 0px 0px;" >
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
                                            </li>                                           
                                            <li class="ojh_li"><a href="http://localhost:9090/SemiProject/homecake.ban">케이크</a>
                                            </li>
                                            <li class="ojh_li"><a href="http://localhost:9090/SemiProject/homedessert.ban">디저트</a>
                                            </li>
                                            <li class="ojh_li"><a href="http://localhost:9090/SemiProject/homedrink.ban">피자&브리또</a>
                                            </li>
                                             
                                        </ul>
                                    </div>
                                </div>
                              </li>   
                            </div>
                            <div class="centerMenu">
                                <ul>

                                    <li><a href="<%= ctxPath%>/homebest.ban">베스트</a></li>
                                    <li><a href="<%= ctxPath%>/event.ban">이벤트</a></li>
                                    <li><a href="<%= ctxPath%>/notice.ban">고객센터</a></li>
                                    <c:if test="${not empty sessionScope.loginuser && sessionScope.loginuser.user_id == 'admin'}"> <!-- 로그인 하기 후  -->
		                                <li><a href="<%= ctxPath%>/productRegister.ban">상품등록하기</a></li>
                          			</c:if>
                                          
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
             <!-- // header wrap --> 