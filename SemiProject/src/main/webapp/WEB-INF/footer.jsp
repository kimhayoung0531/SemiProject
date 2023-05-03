<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
   String ctxPath = request.getContextPath();
   // SemiProject
%>    

      <div id="footer_wrap">
              <div id="footer">

                    <div class="foot_list">
                       <div class="container clearfix" style="display: flex;">
                            <!-- 인스타그램 영역 -->
                            <ul class="sns-menu pull-right inline">
                                    <li><a href="#" target="_blank"><i class="fa-brands fa-instagram fa-2xl"></i></a></li>
                                    <li><a href="#" target="_blank"><i class="fa-brands fa-twitter fa-2xl" ></i></a></li>
                                    <li><a href="#"></a><i class="fa-brands fa-youtube fa-2xl"></i></li>
                                    <li><a href="#" target="_blank"><i class="fa-sharp fa-solid fa-comment fa-2xl"></i></a></li>
                            </ul>
                            <!--// 인스타그램 영역 -->
                        </div>
                    </div> <!-- foot_list -->
                    
                    <div class="footer-bottom">
                        <div class="container clearfix" style="display: flex;">
                            <!-- 고객센터 -->
                            <div class="h1_logo" style="margin: 30px 0px 0px 50px;
                                                        padding: 0px 175px;">
                                <a href="http://localhost:9090/SemiProject/home.ban">
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
                    </div>  <!-- //foot_certify -->
                       
                </div> <!-- footer-bottom -->

              </div> <!-- footer  -->
            </div> <!-- footer_wrap -->

      </div> <!-- wrap -->
    </div> <!-- body-main body-index pc -->
      
</body>
</html>