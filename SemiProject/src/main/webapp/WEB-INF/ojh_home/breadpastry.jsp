<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    //    /SemiProject
%>  
  

    <jsp:include page="../header.jsp" />
		    
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
                                                <a href="http://localhost:9090/SemiProject/breadnomal.ban">
                                                <span> 식빵</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/breadhealth.ban">
                                                <span> 건강빵</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/breaddonut.ban">
                                                <span> 도넛/고로케</span>
                                                </a>
                                            </li>
                                            <li class="ojh_li"> 
                                                <a href="http://localhost:9090/SemiProject/breadpastry.ban">
                                                <span> 패스트리</span>
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
                                    

                                        </div> <!-- ojh_item_gallery_type -->

                                        </div> <!-- ojh_goods_list_cont -->
                                    </div> <!-- ojh_goods_list basic_product -->
                                </div> <!-- ojh_right_content goods_list -->
                          </div> <!-- end of ojh_container relative clearfix -->
                        </div> <!-- ojh_content -->
                    </div> <!-- ojh_sub_content -->
                </div> <!-- content -->
             </div> <!-- container -->
             
<jsp:include page="../footer.jsp" />

