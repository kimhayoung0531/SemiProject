<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
	
%>    



<jsp:include page="../header.jsp" />    


<style>
	
    #container {
        width: 80%;
        margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
        
    }
    #contents {
        margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
    }

    .mypage_lately_info .btn_board_more{position:absolute; top:7px; right:5px; font-size:12px;}
    .mypage_lately_info .btn_board_more:hover{text-decoration:underline;}

    .mypage_order_info_cont ol li{display:inline-block; width:15%; min-width:66px; padding:0 10px 0 30px; font-size:13px; background:url('../../img/mypage/mypgae_ing_next_bg.png') no-repeat left 50px; text-align:center;}
    .mypage_order_info_cont ol li:first-child { display: none;}
    
    
    li {
    float: none;
    list-style: none;
    font-size: 14px;
    display: list-item;
    }

	th {
	    font-size: 12px;
	}
	
	th > span {
	    font-size: 15px;
	}
	
	td:last-child {
    	text-align: left;
	}
	
	.member_cont {
    margin: 62px auto;
    padding: 70px 60px;
    border: 0px solid #dbdbdb;
	}

	.btn_center_box button {
    	margin: 20px;
	}
	
	.btn_post_search {
    margin-left: 10px;
    width: 85px;
    height: 20px;
    font-size: 11px;
    border-radius: 5px;
    border: 1px solid #cccccc;
    color: #3e3d3c;
    cursor: pointer;
	}
	
	table#tblMemberRegister td input {
    font-size: 14px;
    color: #000;
    border-radius: 5px;
    padding: 0 10px;
    outline: none;
    border: 1px solid #dcdcdc;
    line-height: 31px;
	}	
	
	.address_input {
    float: left;
    width: 80%;
	}
	
	.error {
	display: none;
	color: red;
	}
	
	.member_birthday select {
	font-size: 14px;
    color: #000;
    padding: 0 10px;
    outline: none;
    line-height: 31px;
	}
	
</style>
    
</head>

<div id="container" style="margin-left: 12%;">
    <div id="contents">
        <!-- 본문 시작 -->

        <div class="location_wrap">
            <div class="location_cont">
                <em><a href="#" class="local_home">HOME</a> > 마이페이지 > 내정보수정</em>
            </div>
        </div>
        <!-- //location_wrap -->

        <div class="sub_content">

            <div class="side_cont">
                <div class="sub_menu_box">
                    <h2>마이페이지</h2>
                    <ul class="sub_menu_mypage">
                        <li>쇼핑정보
                            <ul class="sub_depth1">
                                <li><a href="../mypage/order_list.php">- 주문목록/배송조회</a></li>
                                <li><a href="../mypage/cancel_list.php">- 취소/반품/교환 내역</a></li>
                                <li><a href="../mypage/refund_list.php">- 환불/입금 내역</a></li>
                                <li><a href="../mypage/wish_list.php">- 좋아요리스트</a></li>
                            </ul>
                        </li>
                        <li>고객센터
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_qa.php">- 1:1 문의</a></li>
                            </ul>
                        </li>
                        <li>회원정보
                            <ul class="sub_depth1">
                                <li><a href="../mypage/my_page_password.php">- 회원정보 변경</a></li>
                                <li><a href="../mypage/hack_out.php">- 회원 탈퇴</a></li>
                                <li><a href="../mypage/mileage.php">- 마일리지</a></li>
                            </ul>
                        </li>
                        <li>나의 상품문의
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_goods_qa.php">- 나의 상품문의</a></li>
                            </ul>
                        </li>
                        <li>나의 상품후기
                            <ul class="sub_depth1">
                                <li><a href="../mypage/mypage_goods_review.php">- 나의 상품후기</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- //sub_menu_box -->

            </div>
            <!-- //side_cont -->

            <div class="content">
                <link type="text/css" rel="stylesheet" href="/data/skin/front/moment_cafenoli_N/css/member/member.css?ts=1664326506">
                <div class="mypage_cont">

                    <div class="my_page">

                        <div class="mypage_zone_tit">
                            <h2>회원정보 변경</h2>
                        </div>

                        <div class="join_base_wrap">

                            <div class="member_cont">
                                <form id="formJoin" name="formJoin" action="https://www.cafenoli.com/mypage/my_page_ps.php" method="post">
                                    <input type="hidden" name="memNo" value="80676" />
                                    <input type="hidden" name="memberFl" value="personal" />
                                    <input type="hidden" name="dupeinfo" value="MC0GCCqGSIb3DQIJAyEA0z13OoXT6HPZIZ0lRdAtPmdh0sE6XBeEOG1OXvhz2ms=" />
                                    <input type="hidden" name="rncheck" value="authCellphone" />
                                    <input type="hidden" name="mode" value="modify" />

                                    <!-- 회원가입/정보 기본정보 -->
                                    <div class="base_info_box">
                                        <h3>기본정보</h3>
                                        <span class="important">* 표시는 반드시 입력하셔야 하는 항목입니다.</span>
                                        <div class="base_info_sec">
                                            <table border="0" cellpadding="0" cellspacing="0" id="tblMemberRegister">
                                                <colgroup>
                                                    <col width="25%">
                                                    <col width="75%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th><span class="important">아이디</span></th>
                                                        <td>
                                                            <input type="text" name="memId" value="${sessionScope.loginuser.userid}" readonly />
                                                            
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 새 비밀번호</span>
                                                        </th>
                                                        <td><input type="password" id="pwd" class="pwd" autocomplete="off" /></td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <span class="important">* 새 비밀번호확인</span>
                                                        </th>
                                                        <td><input type="password" id="pwdCheck" class="pwdCheck" autocomplete="off" />
                                                        </td>
                                                    </tr>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span class="important">* 이름</span></th>
                                                        <td>
                                                            <div class="member_warning">
                                                                <input type="text" name="memNm" data-pattern="gdMemberNmGlobal" value="" maxlength="30" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>* 이메일</span></th>
                                                        <td class="member_email">
                                                            <div class="member_warning">
                                                                <input type="text" name="email" id="email" value="" tabindex="-1" />
                                                                <button class=" btn_double_check"> 이메일 중복 체크</button>
                                                            </div>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>* 휴대폰번호</span></th>
                                                        <td class="member_address">
                                                            <div class="address_postcode">
                                                                <input type="text" id="cellPhone" name="cellPhone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="" />
                                                            </div>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>일반번호(선택)</span></th>
                                                        <td>
                                                            <div class="member_warning">
                                                                <input type="text" id="phone" name="phone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>* 주소</span></th>
                                                        <td class="member_address">
                                                            <div class="address_postcode">
                                                                <input type="text" name="zonecode" readonly="readonly" value="" />
                                                                <button type="button" id="btnPostcode" class="btn_post_search">우편번호검색</button>
                                                                <input type="hidden" name="zipcode" value="-" />
                                                            </div>
                                                            <div class="address_input">
					                   						   <input type="text" id="address" name="address" class="requiredInfo" placeholder="주소"/>
			                                                   <input type="text" id="detailAddress" name="detailAddress"
			                                                       class="requiredInfo" placeholder="상세주소" />
															   <span class="error">주소를 입력하세요</span>
			                                                   <input type="text" id="extraAddress" placeholder="부가주소" name="extraAddress"
			                                                       class="extra_address" />
			                                                       
			                                               </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><span>생일</span></th>
                                                        <td class="member_birthday">
                                                            <div class="member_warning">
                                                            </div>
                                                            <div class="member_warning"><select class=" chosen-single" id="birthYear" name="birthYear" style="width: 100px;">
                                                                    <option value="">년</option>
                                                                    <option value="2023">2023</option>
                                                                    <option value="2022">2022</option>
                                                                    <option value="2021">2021</option>
                                                                    <option value="2020">2020</option>
                                                                    <option value="2019">2019</option>
                                                                    <option value="2018">2018</option>
                                                                    <option value="2017">2017</option>
                                                                    <option value="2016">2016</option>
                                                                    <option value="2015">2015</option>
                                                                    <option value="2014">2014</option>
                                                                    <option value="2013">2013</option>
                                                                    <option value="2012">2012</option>
                                                                    <option value="2011">2011</option>
                                                                    <option value="2010">2010</option>
                                                                    <option value="2009">2009</option>
                                                                    <option value="2008">2008</option>
                                                                    <option value="2007">2007</option>
                                                                    <option value="2006">2006</option>
                                                                    <option value="2005">2005</option>
                                                                    <option value="2004">2004</option>
                                                                    <option value="2003">2003</option>
                                                                    <option value="2002">2002</option>
                                                                    <option value="2001">2001</option>
                                                                    <option value="2000">2000</option>
                                                                    <option value="1999">1999</option>
                                                                    <option value="1998">1998</option>
                                                                    <option value="1997">1997</option>
                                                                    <option value="1996">1996</option>
                                                                    <option value="1995">1995</option>
                                                                    <option value="1994">1994</option>
                                                                    <option value="1993">1993</option>
                                                                    <option value="1992">1992</option>
                                                                    <option value="1991">1991</option>
                                                                    <option value="1990">1990</option>
                                                                    <option value="1989">1989</option>
                                                                    <option value="1988">1988</option>
                                                                    <option value="1987">1987</option>
                                                                    <option value="1986">1986</option>
                                                                    <option value="1985">1985</option>
                                                                    <option value="1984">1984</option>
                                                                    <option value="1983">1983</option>
                                                                    <option value="1982">1982</option>
                                                                    <option value="1981">1981</option>
                                                                    <option value="1980">1980</option>
                                                                    <option value="1979">1979</option>
                                                                    <option value="1978">1978</option>
                                                                    <option value="1977">1977</option>
                                                                    <option value="1976">1976</option>
                                                                    <option value="1975">1975</option>
                                                                    <option value="1974">1974</option>
                                                                    <option value="1973">1973</option>
                                                                    <option value="1972">1972</option>
                                                                    <option value="1971">1971</option>
                                                                    <option value="1970">1970</option>
                                                                    <option value="1969">1969</option>
                                                                    <option value="1968">1968</option>
                                                                    <option value="1967">1967</option>
                                                                    <option value="1966">1966</option>
                                                                    <option value="1965">1965</option>
                                                                    <option value="1964">1964</option>
                                                                    <option value="1963">1963</option>
                                                                    <option value="1962">1962</option>
                                                                    <option value="1961">1961</option>
                                                                    <option value="1960">1960</option>
                                                                    <option value="1959">1959</option>
                                                                    <option value="1958">1958</option>
                                                                    <option value="1957">1957</option>
                                                                    <option value="1956">1956</option>
                                                                    <option value="1955">1955</option>
                                                                    <option value="1954">1954</option>
                                                                    <option value="1953">1953</option>
                                                                    <option value="1952">1952</option>
                                                                    <option value="1951">1951</option>
                                                                    <option value="1950">1950</option>
                                                                    <option value="1949">1949</option>
                                                                    <option value="1948">1948</option>
                                                                    <option value="1947">1947</option>
                                                                    <option value="1946">1946</option>
                                                                    <option value="1945">1945</option>
                                                                    <option value="1944">1944</option>
                                                                    <option value="1943">1943</option>
                                                                    <option value="1942">1942</option>
                                                                    <option value="1941">1941</option>
                                                                    <option value="1940">1940</option>
                                                                    <option value="1939">1939</option>
                                                                    <option value="1938">1938</option>
                                                                    <option value="1937">1937</option>
                                                                    <option value="1936">1936</option>
                                                                    <option value="1935">1935</option>
                                                                    <option value="1934">1934</option>
                                                                    <option value="1933">1933</option>
                                                                    <option value="1932">1932</option>
                                                                    <option value="1931">1931</option>
                                                                    <option value="1930">1930</option>
                                                                    <option value="1929">1929</option>
                                                                    <option value="1928">1928</option>
                                                                    <option value="1927">1927</option>
                                                                    <option value="1926">1926</option>
                                                                    <option value="1925">1925</option>
                                                                    <option value="1924">1924</option>
                                                                    <option value="1923">1923</option>
                                                                    <option value="1922">1922</option>
                                                                    <option value="1921">1921</option>
                                                                    <option value="1920">1920</option>
                                                                    <option value="1919">1919</option>
                                                                    <option value="1918">1918</option>
                                                                    <option value="1917">1917</option>
                                                                    <option value="1916">1916</option>
                                                                    <option value="1915">1915</option>
                                                                    <option value="1914">1914</option>
                                                                    <option value="1913">1913</option>
                                                                    <option value="1912">1912</option>
                                                                    <option value="1911">1911</option>
                                                                    <option value="1910">1910</option>
                                                                    <option value="1909">1909</option>
                                                                    <option value="1908">1908</option>
                                                                    <option value="1907">1907</option>
                                                                    <option value="1906">1906</option>
                                                                    <option value="1905">1905</option>
                                                                    <option value="1904">1904</option>
                                                                    <option value="1903">1903</option>
                                                                    <option value="1902">1902</option>
                                                                    <option value="1901">1901</option>
                                                                    <option value="1900">1900</option>
                                                                </select></div>
                                                            <div class="member_warning"><select class=" chosen-single" id="birthMonth" name="birthMonth" style="width: 80px;">
                                                                    <option value="">월</option>
                                                                    <option value="01">01</option>
                                                                    <option value="02">02</option>
                                                                    <option value="03">03</option>
                                                                    <option value="04">04</option>
                                                                    <option value="05">05</option>
                                                                    <option value="06">06</option>
                                                                    <option value="07">07</option>
                                                                    <option value="08">08</option>
                                                                    <option value="09">09</option>
                                                                    <option value="10">10</option>
                                                                    <option value="11">11</option>
                                                                    <option value="12">12</option>
                                                                </select></div>
                                                            <div class="member_warning"><select class=" chosen-single" id="birthDay" name="birthDay" style="width: 80px;">
                                                                    <option value="">일</option>
                                                                    <option value="01">01</option>
                                                                    <option value="02">02</option>
                                                                    <option value="03">03</option>
                                                                    <option value="04">04</option>
                                                                    <option value="05">05</option>
                                                                    <option value="06">06</option>
                                                                    <option value="07">07</option>
                                                                    <option value="08">08</option>
                                                                    <option value="09">09</option>
                                                                    <option value="10">10</option>
                                                                    <option value="11">11</option>
                                                                    <option value="12">12</option>
                                                                    <option value="13">13</option>
                                                                    <option value="14">14</option>
                                                                    <option value="15">15</option>
                                                                    <option value="16">16</option>
                                                                    <option value="17">17</option>
                                                                    <option value="18">18</option>
                                                                    <option value="19">19</option>
                                                                    <option value="20">20</option>
                                                                    <option value="21">21</option>
                                                                    <option value="22">22</option>
                                                                    <option value="23">23</option>
                                                                    <option value="24">24</option>
                                                                    <option value="25">25</option>
                                                                    <option value="26">26</option>
                                                                    <option value="27">27</option>
                                                                    <option value="28">28</option>
                                                                    <option value="29">29</option>
                                                                    <option value="30">30</option>
                                                                    <option value="31">31</option>
                                                                </select></div>
                                                        </td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- //base_info_sec -->
                                    </div>
                                    <!-- //base_info_box -->
                                    <!-- 회원가입/정보 기본정보 -->

                                    <div class="btn_center_box">
		                               <button type="button" id="btnReset" class="btn_cancle">취소</button>
		                               <button type="button" id="goToRegis" onclick="goRegister();" class="btn_register" value="정보수정">정보수정</button>
		                           </div>
		                            <!-- //btn_center_box -->
                                </form>
                            </div>
                            <!-- //member_cont -->
                        </div>
                        <!-- //join_base_wrap -->

                    </div>
                    <!-- //my_page -->

                </div>
                <!-- //mypage_cont -->

            </div>
            <!-- //content -->



        </div>
        <!-- //sub_content -->
    </div>
    <!-- //본문 끝 contents -->
</div>
<!-- //container -->

<jsp:include page="../footer.jsp" />    
