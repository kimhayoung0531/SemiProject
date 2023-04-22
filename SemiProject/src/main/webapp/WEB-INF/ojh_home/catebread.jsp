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
                                <a href="#">
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
                                                <a href="">빵</a>
                                                <ul class="sub_delth1" >
                                                    <li class="ojh_li"><a href="">식빵</a></li>
                                                    <li class="ojh_li"><a href="">건강빵</a></li>
                                                    <li class="ojh_li"><a href="">도넛/고로케</a></li>
                                                    <li class="ojh_li"><a href="">패스트리</a></li>
                                                </ul>
                                            </li>                                           
                                            <li class="ojh_li"><a href="">케이크</a>
                                                <ul class="sub_delth1">
                                                    <li class="ojh_li"><a href="">생크림 케이크</a></li>
                                                    <li class="ojh_li"><a href="">클래식 케이크</a></li>
                                                    <li class="ojh_li"><a href="">캐릭터 케이커</a></li>
                                                </ul>
                                            </li>
                                            <li class="ojh_li"><a href="">디저트</a>
                                                <ul class="sub_delth1">
                                                    <li class="ojh_li"><a href="">쿠키</a></li>
                                                    <li class="ojh_li"><a href="">초코/캔디</a></li>
                                                    <li class="ojh_li"><a href="">아이스</a></li>
                                                    <li class="ojh_li"><a href="">마카롱</a></li>
                                                </ul>
                                            </li>
                                            <li class="ojh_li"><a href="">음료</a>
                                                <ul class="sub_delth1">
                                                    <li class="ojh_li"><a href="">우유</a></li>
                                                    <li class="ojh_li"><a href="">커피</a></li>
                                                    <li class="ojh_li"><a href="">에이드/TEA</a></li>
                                                    <li class="ojh_li"><a href="">스무디/쉐이크</a></li>
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
		     
		     <div class="ojh_sub_content">
                <div class="ojh_content" style="">
                            
                    <div class="ojh_container relative clearfix">
                        <div class="ojh_left_wing">
                            
                            <div class="current-cate">
                                <h3 class="ojh_li" style="font-size: 18px;"> 빵 </h3>
                            </div>

                            <div class="category-box">
                                <ul>
                                    <li class="ojh_li" style="font-size: 13px;"> 
                                        <a href="#"></a>
                                        <span> 식빵</span>
                                    </li>
                                    <li class="ojh_li" style="font-size: 13px;"> 
                                        <a href="#"></a>
                                        <span> 건강빵</span>
                                    </li>
                                    <li class="ojh_li" style="font-size: 13px;"> 
                                        <a href="#"></a>
                                        <span> 도넛/고로케</span>
                                    </li>
                                    <li class="ojh_li" style="font-size: 13px;"> 
                                        <a href="#"></a>
                                        <span> 패스트리</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    
                        <div class="ojh_right_content goods_list">
                           <div class="ojh_addition_zone">
                            <p style="text-align: center;" >
                                <img src="<%=ctxPath%>/image/bread_ba.jpg" style="width: 850px;">
                            </p>
                           </div> 
                        </div>
                    </div>   
                </div>
            </div>
             
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
                                    <p> 김하영(조장) &nbsp&nbsp 김가은 &nbsp&nbsp 김진솔 &nbsp&nbsp&nbsp&nbsp  </p>
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