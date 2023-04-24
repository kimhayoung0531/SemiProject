<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
	// SemiProject
%>    
    
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

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
                                <a href="http://localhost:9090/SemiProject/home.ban/">
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
                                         <a href="#" class="btn_goods_view_moer">신상도 할인 중👍</a>
                                        </h3>
                                        <h4></h4>
                                    </div>
                                    <div class="goods_list_cont_1 goods_content_222">
                                        <section class="visual_1">
                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/1.jpg" width="200" alt="[15~20% 할인]감사의 달 타르트" title="[15~20% 할인]감사의 달 타르트 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15~20% 할인]감사의 달 타르트</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">20%</span>
                                                    <strong class="item_price">
                                                        <span >17,600원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">22,000원
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
                                                    <img src="<%=ctxPath%>/image/item_main/2.jpg" width="200" alt="[15~20% 할인] 반미 바게트" title="[15~20% 할인] 반미 바게트 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15~20% 할인] 반미 바게트</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">20%</span>
                                                    <strong class="item_price">
                                                        <span >7,500원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">9,500원
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
                                                    <img src="<%=ctxPath%>/image/item_main/3.jpg" width="200" alt="[15%~20% 할인] 브리오쉬 식빵" title="[15%~20% 할인] 브리오쉬 식빵 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 브리오쉬 식빵</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >20,520원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">22,800원
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
                                                    <img src="<%=ctxPath%>/image/item_main/4.jpg" width="200" alt="[15%~20% 할인] 올리브 식빵" title="[15%~20% 할인] 올리브 식빵 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 올리브 식빵</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >20,520원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">22,800원
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
                                                    <img src="<%=ctxPath%>/image/item_main/5.jpg" width="200" alt="[15%~20% 할인] 이탈리안 식빵" title="[15%~20% 할인] 이탈리안 식빵 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 이탈리안 식빵</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >14,850원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">16,500원
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
                                                    <img src="<%=ctxPath%>/image/item_main/6.jpg" width="200" alt="[15%~20% 할인] 찰치즈빵" title="[15%~20% 할인] 찰치즈빵 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 찰치즈빵</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >10,900원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">13,500원
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
                                                    <img src="<%=ctxPath%>/image/item_main/7.jpg" width="200" alt="[15%~20% 할인] 냉동완제품 - 갈릭 크로플" title="[15%~20% 할인] 냉동완제품 - 갈릭 크로플 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 냉동완제품 - 갈릭 크로플</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >11,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">12,350원
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
                                                    <img src="<%=ctxPath%>/image/item_main/8.jpg" width="200" alt="[15%~20% 할인] 초코 퐁당쇼콜라" title="[15%~20% 할인] 초코 퐁당쇼콜라 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 초코 퐁당쇼콜라</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >12,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">14,050원
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 

                                         
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
                                         <a href="#" class="btn_goods_view_moer">봄맞이 할인 특가👍</a>
                                        </h3>
                                        <h4></h4>
                                    </div>
                                    <div class="goods_list_cont_1 goods_content_222">
                                        <section class="visual_2">
                                          <li class="slick-slider slick-current" style="width: 265px;">  
                                            <div class="item_cont" >
                                              <div class="photo_box">  
                                                <a href="#">
                                                    <img src="<%=ctxPath%>/image/item_main/9.jpg" width="200" alt="[15%~20% 할인] 초코롤" title="[15%~20% 할인] 초코롤 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 초코롤</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >17,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">18,500원
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
                                                    <img src="<%=ctxPath%>/image/item_main/10.jpg" width="200" alt="[15%~20% 할인] 딸기잼파이" title="[15%~20% 할인] 딸기잼파이 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 딸기잼파이</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >18,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">20,000원
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
                                                    <img src="<%=ctxPath%>/image/item_main/11.jpg" width="200" alt="[15%~20% 할인] 미니크로와상" title="[15%~20% 할인] 미니크로와상 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 미니크로와상</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >24,500원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">35,000원
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
                                                    <img src="<%=ctxPath%>/image/item_main/12.jpg" width="200" alt="[15%~20% 할인] 초코칩트위스트" title="[15%~20% 할인] 초코칩트위스트 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 초코칩트위스트</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >21,500원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">35,000원
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
                                                    <img src="<%=ctxPath%>/image/item_main/13.jpg" width="200" alt="[15%~20% 할인] 크림브륄레" title="[15%~20% 할인] 크림브륄레 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 크림브륄레</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >23,400원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">28,000원
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
                                                    <img src="<%=ctxPath%>/image/item_main/14.jpg" width="200" alt="[15%~20% 할인] 화이트 유니버스 도넛" title="[15%~20% 할인] 화이트 유니버스 도넛 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 화이트 유니버스 도넛</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >5,400원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">10,800원
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
                                                    <img src="<%=ctxPath%>/image/item_main/15.jpg" width="200" alt="[15%~20% 할인] 마리토쪼" title="[15%~20% 할인] 마리토쪼 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 마리토쪼</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >3,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">4,000원
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
                                                    <img src="<%=ctxPath%>/image/item_main/16.jpg" width="200" alt="[15%~20% 할인] 우유크림카스테라" title="[15%~20% 할인] 우유크림카스테라 " class="middle" >
                                                </a>
                                              </div>  
                                              <div class="item-info-cont" style="display:block; text-align: left;">
                                                    <a href="#">
                                                    <strong class="item_name" style="direction: ltr;">[15%~20% 할인] 우유크림카스테라</strong>
                                                    </a>
                                                <div class="imem_money_box">
                                                    <span class="precent" style="display: none;">15%</span>
                                                    <strong class="item_price">
                                                        <span >1,000원 </span>
                                                        <span style="color: #888; text-decoration: line-through;">3,500원
                                                        </span>
                                                    </strong>
                                                </div>
                                              </div> 
                                            </div>
                                          </li> 
                                         

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
                                         <a href="#" class="btn_goods_view_moer">샀는데 또 사요👍</a>
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
                                    </div>
                                </div>


                        </div>
                    </div>
                         
                </div>
            </div>
        </div>
             <!-- // sub_content -->

            <!-- footer 시작 -->
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
                                    <img src="<%=ctxPath%>/image/main_logo.png" style="width: 150px;">
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