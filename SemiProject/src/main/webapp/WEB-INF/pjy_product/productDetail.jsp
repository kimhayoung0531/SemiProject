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
    
    <!-- original css -->
    <link href="<%= ctxPath%>/css/juneyubcss.css" rel="stylesheet" type="text/css"></style>

    <!-- 구글 icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

    <!-- Optional JavaScript -->
    <script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
    <script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 


    
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">

    <!-- jQueryUI CSS 및 JS -->
    <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.css" />
    <script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
    
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
                                    <img src="/image/main_logo.png">
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
                                                    <input type="image" src="/image/icon-search-b.png" id="btnSearchTop" class="btn_top_srarch" title="검색" value="검색" alt="검색" />
                                                        
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
                                <div class="switch">전체 카테고리</div>
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
                    <div class="item_sub_content">
                        <div class="item_content_box">

                            <div class="item_location_wrap"></div>
                            <!-- 아이템 상단 여백 끝 -->
                            
                            <!-- 아이템 상단 시작 -->
                            <div class="item_photo_info_sec">
                                <div class="item_photo_view_box">
                                    <div class="item_photo_view">
                                        <div class="item_photo_big">
                                            <span class="img_photo_big">
                                                <a href="#lyZoom" id="mainImage" class="zoom_layer_open btn_open_layer">
                                                    <img src="<%= ctxPath%>/image/testItem.jpg" width="500" class="middle">
                                                </a>
                                                
                                            </span>
                                            <a href="#lyZoom" class="btn_zoom zoom_layer_open btn_open_layer">
                                                <img src="<%= ctxPath%>/image/icon_zoom.png">
                                            </a>
                                        </div>
                                        <!-- item_photo_big -->

                                        <div class="item_photo_slide">
                                            <ul class="slider_wrap slider_goods_nav slick-initialized slick-slider">
                                                <div aria-live="polite" class="slick-list draggable">
                                                    <div class="slick-track" style="opacity: 1; width:104px; transform: translate3d(0px, 0px, 0px);" role="listbox">
                                                        <li class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" 
                                                        tabindex="-1" role="option" aria-describedby="slick-slide00" style="width :84px;">
                                                            <a href="#상품 메인이미지가 현재 클릭한 사진으로 바뀌는 메소드" tabindex="0">
                                                                <img src="<%= ctxPath%>/image/testItem.jpg" width="84px" class="middle">
                                                            </a>
                                                        </li>
                                                    </div>
                                                </div>
                                            </ul>
                                        </div>
                                        <!-- item_photo_slide -->

                                    </div>
                                    <!-- item_photo_view -->

                                </div>
                                <!-- item_photo_view_box -->

                                <form name="itemFrmView" id="itemFrmView" method="post">
                                    <input type="hidden" name="mode" value="get_benefit">
                                    <input type="hidden" name="scmNo" value="1">
                                    <input type="hidden" name="cartMode" value="">
                                    <input type="hidden" name="set_goods_price" value="21000">
                                    <input type="hidden" id="set_goods_fixedPrice" name="set_goods_fixedPrice" value="0.00">
                                    <input type="hidden" name="set_goods_mileage" value="0">
                                    <input type="hidden" name="set_goods_stock" value="∞">
                                    <input type="hidden" name="set_coupon_dc_price" value="21000.00">
                                    <input type="hidden" id="set_goods_total_price" name="set_goods_total_price" value="0">
                                    <input type="hidden" id="set_option_price" name="set_option_price" value="0">
                                    <input type="hidden" id="set_option_text_price" name="set_option_text_price" value="0">
                                    <input type="hidden" id="set_add_goods_price" name="set_add_goods_price" value="0">
                                    <input type="hidden" name="set_total_price" value="21000">
                                    <input type="hidden" name="mileageFl" value="c">
                                    <input type="hidden" name="mileageGoods" value="0.00">
                                    <input type="hidden" name="mileageGoodsUnit" value="percent">
                                    <input type="hidden" name="goodsDiscountFl" value="y">
                                    <input type="hidden" name="goodsDiscount" value="0.00">
                                    <input type="hidden" name="goodsDiscountUnit" value="percent">
                                    <input type="hidden" name="taxFreeFl" value="t">
                                    <input type="hidden" name="taxPercent" value="10.0">
                                    <input type="hidden" name="scmNo" value="1">
                                    <input type="hidden" name="brandCd" value="">
                                    <input type="hidden" name="cateCd" value="023001">
                                    <input type="hidden" id="set_dc_price" value="0">
                                    <input type="hidden" id="goodsOptionCnt" value="1">
                                    <input type="hidden" name="optionFl" value="n">
                                    <input type="hidden" name="useBundleGoods" value="1">

                                    <div class="item_info_box">

                                        <div class="item_tit_detail_cont">
                                            <div class="item_detain_tit">
                                                <h3>냉동생지 - [삼양사] 애플파이</h3>
                                            </div>

                                            <div class="item_datail_list">
                                                <dl class="item_detail_price">
                                                    <dt>판매가</dt>
                                                    <dd>
                                                        <strong>
                                                            <strong>
                                                                #,###
                                                            </strong>
                                                            원
                                                        </strong>
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_category">
                                                    <dt>상품구분</dt>
                                                    <dd>
                                                        냉동생지
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_discount_mileage">
                                                    <dt>구매혜택</dt>
                                                    <dd>
                                                        마일리지 적립 : <span class="save_mileage">###원</span>
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_discount_mileage">
                                                    <dt>제조사</dt>
                                                    <dd>
                                                        삼양사
                                                    </dd>
                                                </dl>

                                                <dl class="item_detail_deliver_fee">
                                                    <dt>배송비</dt>
                                                    <dd>
                                                        3,000원 / 주문시결제(선결제)
                                                    </dd>
                                                </dl>
                                                <div>
                                                    <dl class="item_detail_each">
                                                        <dt>개수</dt>
                                                        <dd>
                                                            <input id="item_cnt" type="number" class="form-control" min="1" value="1">
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                            <!-- item_datail_list 끝-->

                                            <div class="item_price_cont">
                                                <div class="end_price item_total_box">
                                                    <dl class="total_goods">
                                                        <dt>총 상품금액</dt>
                                                        <dd><strong class="goods_total_price">#,###</strong>원</dd>

                                                    </dl>
                                                </div>

                                            </div>
                                            <div class="btn_choice_box">
                                                <button type="button" class="btn_add_wish">
                                                    <span class="material-symbols-outlined">
                                                        favorite
                                                        </span>
                                                </button>
                                                <button type="button" class="btn_add_cart">장바구니</button>
                                                <button type="button" class="btn_add_order">바로 구매하기</button>

                                            </div>

                                        </div>
                                    </div>

                                </form>
                            </div>

                             <!-- item_photo_info_sec -->
                            <!-- 아이템 상단 끝-->
                            
                            <!-- 아이템 하단 시작-->
                            <div class="item_goods_sec">
                                <!-- //item_goods_tab-->

                                <div id="detail">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li class="on">
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="detail_cont">
                                        <h3>상품상세정보</h3>
                                        <div class="detail_explain_box">
                                            <div class="image-manual">
                                                <!-- 이미지 -->
                                            </div>
                                            <div class="txt-manual">
                                                <p align="center" style="text-align: center;">
                                                    <img src="<%= ctxPath%>/image/delivery_system.jpg">
                                                </p>

                                                <p align="center" style="text-align: center;">
                                                    <img src="<%= ctxPath%>/image/item_detail/test02.jpg">
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="delivery">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li class="on">
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="delivery_cont">
                                        <h3>배송안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/delivery_policy.jpg">
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div id="exchange">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li class="on">
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="exchange_cont">
                                        <h3>교환 및 반품안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/exchange_policy.jpg">
                                            </div>
                                        </div>

                                        <h3>환불안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/exchange_info.jpg">
                                            </div>
                                        </div>

                                        <h3>AS안내</h3>

                                        <div class="admin_msg">
                                            <div align="center" style="text-align: center;">
                                                <img src="<%= ctxPath%>/image/as_info.jpg">
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div id="reviews">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li class="on">
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li>
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="reviews_cont">
                                        <div class="review_header">
                                            <div class="review_header_tit">
                                                <span class="title">REVIEW</span>
                                            </div>
                                            <div class="review_header_description">
                                                <a class="review_header_description_link" href="#">전체 상품 리뷰 보기</a>
                                            </div>
                                        </div>

                                        <table class="review_table table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>작성자</th>
                                                    <th>내용</th>
                                                    <th>작성일</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td>테스트1</td>
                                                    <td>테스트 내용</td>
                                                    <td>태스트 날짜</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                    
                                </div>
                                <!-- 리뷰 끝 -->

                                <div id="qna">
                                    <div class="item_goods_tab">
                                        <ul>
                                            <li>
                                                <a href="#detail">상품상세정보</a>
                                            </li>
                                            <li>
                                                <a href="#delivery">배송안내</a>
                                            </li>
                                            <li>
                                                <a href="#exchange">교환 및 반품안내</a>
                                            </li>
                                            <li>
                                                <a href="#reviews">상품후기</a>
                                            </li>
                                            <li class="on">
                                                <a href="#qna">상품문의</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="reviews_cont">
                                        <div class="review_header">
                                            <div class="review_header_tit">
                                                <span class="title">상품문의</span>
                                            </div>
                                            <div class="review_header_description">
                                                <a class="review_header_description_link" href="#">전체 상품 문의 보기</a>
                                            </div>
                                        </div>

                                        <table class="review_table table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>작성자</th>
                                                    <th>내용</th>
                                                    <th>작성일</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td>테스트1</td>
                                                    <td>테스트 내용</td>
                                                    <td>태스트 날짜</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>

                                </div>


                            </div>
                            
                        </div>
                        
                    </div>
                
                </div>
            </div>
            <!-- // container --> 


             <div id="footer_wrap"></div>


        </div>
    </div>
    
    </body>
    </html>