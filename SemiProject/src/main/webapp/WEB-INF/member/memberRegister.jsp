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
    <title>세미 회원가입</title>

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
    <style type="text/css">

    </style>
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
                                    <li>
                                        <span>01</span>
                                        약관동의
                                        <span>
                                            <img src="https://cdn-pro-web-250-118.cdn-nhncommerce.com/cafenotr1984_godomall_com/data/skin/front/moment_cafenoli_N/img/member/icon_join_step_on.png"
                                                alt="약관동의완료">
                                        </span>
                                    </li>
                                    <li class="page_on">
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
                                <form id="formJoin" name="formJoin">
                                    <div class="base_info_box">
                                        <span class="important">* 표시는 반드시 입력하셔야하는 항목입니다</span>
                                        <h3>기본정보</h3>

                                        <div class="base_info_sec">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <colgroup>
                                                    <col width="25%">
                                                    <col width="75%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 아이디</span>
                                                        </th>
                                                        <td>
                                                            <div>
                                                                <input type="text" id="userid" class="userid" />
                                                                <button class="btn_double_check"> 아이디 중복 체크</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 비밀번호</span>
                                                        </th>
                                                        <td><input type="password" id="pwd" class="pwd"
                                                                autocomplete="off" /></td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 비밀번호확인</span>
                                                        </th>
                                                        <td><input type="password" id="pwdCheck" class="pwdCheck"
                                                                autocomplete="off" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 이름</span>
                                                        </th>
                                                        <td><input type=" text" id="name" class="name"
                                                                autocomplete="off" /></td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 이메일</span>

                                                        </th>
                                                        <td>
                                                            <input type=" text" id="email" class="email" />

                                                            <button class=" btn_double_check"> 이메일 중복 체크</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 휴대폰번호</span>
                                                        </th>
                                                        <td>
                                                            <input type="number" id="mobile" class="mobile"
                                                                placeholder="-없이 입력하세요" />

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 주소</span>
                                                        </th>
                                                        <td class="member_address">
                                                            <div class="address_postcode">
                                                                <input type="text" id="address" class="address" />
                                                                <button type="button" id="btnPostcode"
                                                                    class="btn_post_search btn_double_check"> 우편번호
                                                                    검색</button>
                                                            </div>
                                                            <div class="address_input">

                                                                <input type="text" id="detail_email"
                                                                    class="detail_email" placeholder="상세주소" />

                                                                <input type="text" id="extra_address" placeholder="부가주소"
                                                                    class="extra_address" />
                                                            </div>


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span>생일</span>
                                                        </th>
                                                        <td>
                                                            <input type="text" id="birthday" class="birthday" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span>휴먼회원 방지기간</span>
                                                        </th>
                                                        <td>
                                                            <div class="from_element">
                                                                <ul id="idle_mem">
                                                                    <li>
                                                                        <input type="radio" id="idle1" name="idle"
                                                                            value="1" />
                                                                        <label for="idle1" class="">1년</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="idle3" name="idle"
                                                                            value="3" />
                                                                        <label for="idle3" class="">3년</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="idle5" name="idle"
                                                                            value="5" />
                                                                        <label for="idle5" class="">5년</label>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                        </td>
                                                    </tr>
                                                </tbody>


                                            </table>



                                        </div> <!--//join_agreement_cont -->
                                        <div class="btn_center_box">
                                            <button type="button" id="btnReset" class="btn_cancle">취소
                                            </button>
                                            <button type="button" id="goToRegis" class="btn_register">회원가입
                                            </button>
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