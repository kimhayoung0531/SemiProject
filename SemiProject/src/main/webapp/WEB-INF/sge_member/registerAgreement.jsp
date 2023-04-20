<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>약관동의</title>

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap.min.css">

    <!-- jQueryUI CSS 및 JS -->
    <link rel="stylesheet" type="text/css" href="/jquery-ui-1.13.1.custom/jquery-ui.css" />
    <script type="text/javascript" src="/jquery-ui-1.13.1.custom/jquery-ui.js"></script>

    <!-- original css -->
    <link href="<%= ctxPath%>/css/css.css" rel="stylesheet" type="text/css">
    <link href="<%= ctxPath%>/css/agreement.css" rel="stylesheet" type="text/css">


    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
  
</head>


<body>
    <div class="body-main body-index pc">
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
                                        <img
                                            src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/banner/385b2572180ff251d43fd39dce3cbedf_85130.png">
                                    </a>
                                </div>

                                <div class="headSearch">
                                    <div class="top_search">
                                        <form name="frmSearchTop" id="frmSearchTop">
                                            <fieldset>
                                                <legend>검색폼</legend>
                                                <div class="top_search_cont">
                                                    <div class="top_text_cont">
                                                        <input type="text" id="search_form" name="keyword"
                                                            class="top_srarch_text" title placeholder="검색어를 입력해주세요"
                                                            autocomplete="off">
                                                        <input type="image" src="/image/icon-search-b.png"
                                                            id="btnSearchTop" class="btn_top_srarch" title="검색"
                                                            value="검색" alt="검색" />

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
                <div class="sub_content">
                    <div class="content_box">


                        <div class="join_agreement_wrap">
                            <div class="member_title">
                                <h2>회원가입 </h2>

                                <ol>
                                    <li class="page_on">
                                        <span>01</span>
                                        약관동의
                                        <span>
                                            <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                                alt="약관동의완료">
                                        </span>
                                    </li>
                                    <li>
                                        <span>02</span>
                                        정보입력
                                        <span>
                                            <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                                alt="약관동의완료">
                                        </span>
                                    </li>
                                    <li>
                                        <span>03</span>
                                        가입완료
                                        <span>
                                            <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                                alt="약관동의완료">
                                        </span>

                                    </li>
                                </ol>
                            </div>


                            <div class="member_cont">
                                <form>
                                    <h3>약관동의</h3>
                                    <div class="join_agreement_cont">
                                        <div class="join_agreement_box">
                                            <input type="checkbox" id="all_agree">
                                            <label for="all_agree">
                                                <strong>주식회사 카페노리의 모든 약관을 확인하고 전체 동의합니다.</strong>
                                            </label>
                                            <span>(전체동의,선택항목도 포합됩니다.)</span>
                                        </div>


                                        <div class="join_agreement_box">
                                            <div class="form_element">
                                                <input type="checkbox" id="termAgree1" name="" />
                                                <label for="termAgree1">
                                                    <strong>(필수)</strong>
                                                    이용약관
                                                </label>
                                                <span><a>전체보기</a></span>
                                            </div>
                                            <div>
                                                <iframe src="agreement.html" width="85%" height="150px"
                                                    class="box"></iframe>
                                            </div>
                                        </div>

                                        <div class="join_agreement_box">
                                            <div class="form_element">
                                                <input type="checkbox" id="termAgree2" name="" />
                                                <label for="termAgree2">
                                                    <strong>(필수)</strong>
                                                    개인정보 수집 및 이용
                                                </label>
                                                <span><a>전체보기</a></span>
                                            </div>
                                            <div>
                                                <iframe src="agreement.html" width="85%" height="150px"
                                                    class="box"></iframe>
                                            </div>
                                        </div>

                                        <div class="warning_checkAll">
                                            <strong class="important_check_box">(필수)이용약관을 체크해주세요</strong>
                                        </div>
                                    </div> <!--//join_agreement_cont -->
                                    <div class="btn_center_box">
                                        <button type="button" id="btnNextStep" class="btn_member_next">다음단계 </button>
                                    </div>
                                </form>
                            </div><!--member_cont-->

                        </div>
                    </div>
                </div> <!--//sub_ contents-->


            </div>
        </div>

        <div id="footer_wrap"></div>
    </div>

    </div>
</body>

</html>