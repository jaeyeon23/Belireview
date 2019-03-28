<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 흥행 css -->
	<link rel="stylesheet" type="text/css" href="/brw/resources/Rcss/layout.css">

	<!-- 랭킹 css -->
	<link href="/brw/resources/Rcss/default.css" rel="stylesheet">
	<!-- 실검 js -->
	<script src="/brw/resources/Rcss/jquery.vticker.min.js"></script>
	
    <script>
     var test="1";
     
  	  	$(function() {
  		  	/* $('#M_image_test1').hide(); */
  		  	$('#M_image_test2').hide();
  			$('#M_image_test3').hide();
  			$('#M_image_test4').hide();
  			$('#M_image_test5').hide();
  			$('#M_image_test6').hide();
  			$('#M_image_test7').hide();
  			$('#M_image_test8').hide();
  			$('#M_image_test9').hide();
  			$('#M_image_test10').hide(); 
  			
  			
  			$('#M_pro_test2').hide();
  			$('#M_pro_test3').hide();
  			$('#M_pro_test4').hide();
  			$('#M_pro_test5').hide();
  			$('#M_pro_test6').hide();
  			$('#M_pro_test7').hide();
  			$('#M_pro_test8').hide();
  			$('#M_pro_test9').hide();
  			$('#M_pro_test10').hide();
  			
  	  	rank_color_1();  			
		});
  	  	
  	  	function rank_color_1(){
  			setTimeout(function(){
  				$('#M_image_test10').hide();
  				$('#M_pro_test10').hide();
  				$("#test_M10 a").css('color','gray');
  				
  				$('#M_image_test1').show();
  				$('#M_pro_test1').show();
  				$("#test_M1 a").css('color','red');
  				rank_color_2();
			}, 2500);  		
  	  	}
		
  		function rank_color_2(){
  	  			setTimeout(function(){
  	  				$('#M_image_test1').hide();
  	  				$('#M_pro_test1').hide();
  	  				$("#test_M1 a").css('color','gray');
  	  				
  	  				$('#M_image_test2').show();
  	  				$('#M_pro_test2').show();
  	  				$("#test_M2 a").css('color','red');
  	  				rank_color_3();
  				}, 2500);  
	  	}
  	  
  		function rank_color_3(){
	  			setTimeout(function(){
	  				$('#M_image_test2').hide();
	  				$('#M_pro_test2').hide();
	  				$("#test_M2 a").css('color','gray');
	  				
	  				$('#M_image_test3').show();
	  				$('#M_pro_test3').show();
	  				$("#test_M3 a").css('color','red');
	  				rank_color_4();
				}, 2500);  
  		}
  		
  		function rank_color_4(){
	  			setTimeout(function(){
	  				$('#M_image_test3').hide();
	  				$('#M_pro_test3').hide();
	  				$("#test_M3 a").css('color','gray');
	  				
	  				$('#M_image_test4').show();
	  				$('#M_pro_test4').show();
	  				$("#test_M4 a").css('color','red');
	  				rank_color_5();
				}, 2500);  
  		}
  		
  		function rank_color_5(){
  			setTimeout(function(){
  				$('#M_image_test4').hide();
  				$('#M_pro_test4').hide();
  				$("#test_M4 a").css('color','gray');
  				
  				$('#M_image_test5').show();
  				$('#M_pro_test5').show();
  				$("#test_M5 a").css('color','red');
  				rank_color_6();
			}, 2500);  
		}
  		
  		function rank_color_6(){
			
  			setTimeout(function(){
  				$('#M_image_test5').hide();
  				$('#M_pro_test5').hide();
  				$("#test_M5 a").css('color','gray');
  				
  				$('#M_image_test6').show();
  				$('#M_pro_test6').show();
  				$("#test_M6 a").css('color','red');
  				rank_color_7();
			}, 2500);  
		}
  		
  		function rank_color_7(){
		
  			setTimeout(function(){
  				$('#M_image_test6').hide();
  				$('#M_pro_test6').hide();
  				$("#test_M6 a").css('color','gray');
  				
  				$('#M_image_test7').show();
  				$('#M_pro_test7').show();
  				$("#test_M7 a").css('color','red');
  				rank_color_8();
			}, 2500);  
		}
  		
  		function rank_color_8(){
			
  			setTimeout(function(){
  				$('#M_image_test7').hide();
  				$('#M_pro_test7').hide();
  				$("#test_M7 a").css('color','gray');
  				
  				$('#M_image_test8').show();
  				$('#M_pro_test8').show();
  				$("#test_M8 a").css('color','red');
  				rank_color_9();
			}, 2500);  
		}
  		
  		function rank_color_9(){
			
  			setTimeout(function(){
  				$('#M_image_test8').hide();
  				$('#M_pro_test8').hide();
  				$("#test_M8 a").css('color','gray');
  				
  				$('#M_image_test9').show();
  				$('#M_pro_test9').show();
  				$("#test_M9 a").css('color','red');
  				rank_color_10();
			}, 2500);  
		}
  		
  		function rank_color_10(){
			
  			setTimeout(function(){
  				$('#M_image_test9').hide();
  				$('#M_pro_test9').hide();
  				$("#test_M9 a").css('color','gray');
  				
  				$('#M_image_test10').show();
  				$('#M_pro_test10').show();
  				$("#test_M10 a").css('color','red');
  				rank_color_1();
			}, 2500);  
		}
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
		$(function() {
			  $('#best_movie').vTicker('init', {
			    speed: 1000, //글자가 올라가는 스피드
			    pause: 1000,   //글자가 올라가는 시간
			    showItems: 5,   //보여지는 문구 수 
			    padding: 4
		      });			  
		});

		$(function() {
			  $('#best_drama').vTicker('init', {
				    speed: 1000, //글자가 올라가는 스피드
				    pause: 1000,   //글자가 올라가는 시간
				    showItems: 5,   //보여지는 문구 수 
				    padding: 4
			  });
		});
		
		$(function() {
			  $('#best_actor').vTicker('init', {
				    speed: 1000, //글자가 올라가는 스피드
				    pause: 1000,   //글자가 올라가는 시간
				    showItems: 5,   //보여지는 문구 수 
				    padding: 4
			  });
		});
			
</script>
</head>
<body>
	<!--영화관입장권 통합전산망-->
        <div class="integrated_network_area" id="boxoffice_area">
            <div class="inner">

                <div class="section_title_wrap">
                    <div class="section_title">역대 영화 흥행순위</div>
                    <!-- <span class="auto_scroll"><a onclick="fn_boxAutoScroll();" href="#none"><img id="img_boxAutoScroll" alt="박스오피스 자동 스크롤 정지" src="/kofic/comm/images/main/btn_play_stop.gif"></img></a></span> -->
                    <div class="section_text integrated_network_movie_ranking_btn">
						<span>
							한국 상영관의 입장권 발권정보를 바탕으로 한 데이터입니다.
						</span>
						<!-- <span class="view_detail">
							<input type="button" onclick="window.open('http://www.kobis.or.kr/kobis/business/main/main.do')" value="자세히보기"/>
						</span> -->
					</div>
                </div>

                <div class="integrated_network_movie_ranking">
                   <div class="integrated_network_movie_info">
                    <c:forEach items="${movie_total }" var="list" varStatus="stat">
                    	 <div class="integrated_network_movie_info_img" id="M_image_test${stat.index+1 }">
                    	 	<span class="movie_ranking_number" id="rankNum">${stat.index+1 }</span>
                            <img id="3imgPoster${stat.index +1}" src="/brw/resources/images/movie/poster/${list.MOVIE_POSTER_IMAGE}" alt="그린" title="">
                        </div>
                    </c:forEach>
                   
	                <c:forEach items="${movie_total}" var="list" varStatus="stat">
	                   	<div class="integrated_network_movie_info_text" id="M_pro_test${stat.index+1 }">
	                   		<p class="integrated_network_movie_info_text01" id="rankTitle">${list.MOVIE_NAME}</p>
							<p class="integrated_network_movie_info_text02" id="movieNmEn"></p>
							
							<div class="integrated_network_movie_info_definition">
								<dl>
									<dt>개봉일</dt>
									<dd id="openDt" >${list.MOVIE_DATE}</dd>
								</dl>
								<dl>
									<dt>장르</dt>
									<dd id="genre">${list.MOVIE_GENRE}</dd>
								</dl>
							</div>
							<div class="integrated_network_movie_info_definition">
								<dl>
									<dt>감독</dt>
									<dd id="director">${list.MOVIE_DIRECTOR}</dd>
								</dl>
								<dl>
									<dt>상영시간</dt>
									<dd id="showTm">${list.MOVIE_RUNNINGTIME}</dd>
								</dl>
								<dl>
									<dt>제작국가</dt>
									<dd id="repNationNm">${list.MOVIE_COUNTRY}</dd>
								</dl>
							</div>
							<div class="integrated_network_movie_info_definition">								
								<dl>
									<dt>ㅎㅎㅎ</dt>
									<dd id="dtNm"></dd>
								</dl>
							</div>
						</div>
						</c:forEach>
                    </div>
                    
					<!-- <div class="integrated_network_movie_play_stop">
					<span class="auto_scroll"><a onclick="fn_boxAutoScroll();"
						href="#none"><img id="img_boxAutoScroll" alt="박스오피스 자동 스크롤 정지"
							src="http://www.kofic.or.kr/kofic/comm/img/main/integrated_network_movie_stop.png"></img></a></span>
					<input type="text" name="" value="" class="integrated_network_movie_play">
						<input type="text" name="" value="" class="integrated_network_movie_stop">
					</div>
 -->
                    <div class="integrated_network_movie_ranking_table" id="mBoxDiv">
                        <table>
                            <colgroup>
                                <col style="width:15%" />
                                <col style="" />
                                <col style="width:15%" />
                                <col style="width:25%" />
                            </colgroup>

                            <thead>
                                <tr>
                                    <th>순 위</th>
                                    <th>영화명</th>
                                    <th>점유율</th>
                                    <th>관객수</th>
                                </tr>
                            </thead>
                            <tbody id="mainKobisList">
                            	<c:forEach items="${movie_total }" var="list" varStatus="stat">
                            		<tr onclick="fnKobizUrl()"
                            			onmouseover="MM_showHideLayers('3poster${stat.index +1}','','mainshow','3maindata${stat.index +1}' ,'','mainshow')"
    										
                            		>
									<td><div class="movie_ranking_number">${stat.index +1 }</div></td>
									<td id="test_M${stat.index +1}"><a href="#none" 
										style="color:gray; font-weight: normal;">${list.MOVIE_NAME}</a></td>
									<td>sss</td>
									<td align="right">${list.MOVIE_TOTAL_COUNT}</td>
									</tr>
								</c:forEach>
                            </tbody>
                        </table>

                        <div class="integrated_network_movie_ranking_table_bottom">
                            <div class="integrated_network_movie_ranking_table_bottom01"><span id="korCntShare">한국(65.5%) </span>│<span id="forCntShare">외국(34.5%)</span></div>
                            <div class="integrated_network_movie_ranking_table_bottom02" id="boxDate">2018.00.00 ~ 2018.00.00 기준</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--//영화관입장권 통합전산망-->

<!-- 인기검색어 -->
<div class="maintable1">
	    <ul>
	    	<!-- 최신 개봉작 -->
			<li class="mainframe1">
	        	<div class="mainrelease1">
	                <div>
	                    <ul> <!-- 전체제목목위치욤 ㅎ -->
	                        <li class="maintitle_h1">영화 인기검색어</li>
	                    </ul>
	                </div>
	                <div class="ie9_mainnewopen"></div>
	                <div style="padding:5px 0 0 0"></div>
	                
	                <div id="best_movie">
	               		 <ul>
	              			  <c:forEach items="${rank5_movie }" var="list" varStatus="stat">
						  		 <li class="mainlist_bg1" title="${list.SEARCH_TEXT }" >
						  		 	<div id="rank_num">${stat.index+1}</div>
									<a class="mainlist1" href="/brw/movie/movieDetail.br?MOVIE_NO=${list.NO}">${list.SEARCH_TEXT}</a>
							     </li>
							     <!-- <hr style="color: width;">
							     <div style="width: 30px; height: 1px; background: white;"></div>
						 -->	  </c:forEach>
						 </ul>
					</div>
					
	                
	                <%-- <table cellpadding="0" cellspacing="0">
						<tbody id="lastestOpenning">
						<c:forEach items="${rank5_movie }" var="list">
							<tr class="mainlist_bg1">
								<td class="mainlist1" title="${list.SEARCH_TEXT }">
								<a class="mainlist1_over" href="/brw/movie/movieDetail.br?MOVIE_NO=${list.NO}">${list.SEARCH_TEXT}</a><br>
							</tr>
							<tr>
								<td colspan="4" class="mainlist_dot"></td>
							</tr>
						</c:forEach>
						</tbody>
					</table> --%>
	            </div>
	        </li>

			<!-- 개봉 예정작 -->
	        <li class="mainframe2">
	            <div class="mainrelease1">
	                <div>
	                    <ul>
	                        <li class="maintitle_h1">드라마 인기검색어</li>
	                    </ul>
	                </div>

	                <div class="ie9_mainnewopen"></div>
	                <div style="padding:5px 0 0 0"></div>
	                
	                <div id="best_drama">
	               		 <ul>
	              			  <c:forEach items="${rank5_drama }" var="list" varStatus="stat">
						  		 <li class="mainlist_bg1" title="${list.SEARCH_TEXT }" >
						  			<div id="rank_num">${stat.index+1}</div>
									<a class="mainlist1" href="/brw/drama/dramaDetail.br?DRAMA_NO=${list.NO}">${list.SEARCH_TEXT}</a>
							     </li>
							  </c:forEach>
						 </ul>
					</div>
	               
				</div>
	        </li>

 			<!-- 전광판 -->
	        <li class="mainframe3">
	        	<div class="mainrelease1">
	            	<div>
	                    <ul>
	                        <li class="maintitle_h1">배우 인기검색어</li>
	                    </ul>
	                </div>

	                <div class="ie9_mainnewopen"></div>
	                <div style="padding:5px 0 0 0"></div>
	                
	                
	                <div id="best_actor">
	               		 <ul>
	              			  <c:forEach items="${rank5_actor }" var="list" varStatus="stat">
						  		 <li class="mainlist_bg1" title="${list.SEARCH_TEXT }" >
						  		 	<div id="rank_num">${stat.index+1}</div>
									${list.SEARCH_TEXT}
							     </li>
							  </c:forEach>
						 </ul>
					</div>
	               
	            </div>
	        </li>
	    </ul>
</div>
<!-- 인기검색어 -->



<!-- 조회순/평점순 -->
<script language="JavaScript" src="/brw/resources/Rcss/rank.js"></script>
<br><br><br><br>
<div id="boxMovieTab1" class="maintable0" style="display: block; height: 340px;">
  <ul class="mainbody">
    <li class="mainbody1 maincolor1">
        <!-- 일일|주말 class="color1" , 다양성 class="color2" , 예매율|좌점율 class="color3" -->
    </li>

    <!-- 마우스오버 포스터 -->
    <li class="mainbody2">
        <div class="mainpicture">
            <table border="0" cellpadding="0" cellspacing="0" class="body">
              	<tbody><tr class="mainbodytr">
	                <td>
	                
	                <c:forEach items="${movie_read}" var="list" varStatus="stat">
	                	<!-- 조회순 박스오피스 1 ~ 10 -->
	                    <div class="mainhide" id="poster${stat.index +1}">
	                        <div class="mainposter1">
	                        	<!-- 순위이미지 -->
	                        	<img src="http://www.kobis.or.kr/kobis/web/comm/images/main/poster_A0${stat.index +1}.png">
	                        </div>
	                        <!-- 포스터이미지 -->
	                        <img class="classPoster" id="imgPoster${stat.index +1}" src="/brw/resources/images/movie/poster/${list.MOVIE_POSTER_IMAGE}">
	                    </div>
	                 </c:forEach>  
	                <!-- 조회순 박스오피스 1 ~ 10 /-->
					
	                <!-- 평점순 박스오피스 1 ~ 10 -->
	                <c:forEach items="${movie_grade }" var="list" varStatus="stat">
	                    <div class="mainhide" id="2poster${stat.index +1}">
	                        <div class="mainposter1">
	                        	<!-- 포스터순위이미지 -->
	                        	<img src="http://www.kobis.or.kr/kobis/web/comm/images/main/poster_B0${stat.index +1}.png">
	                        </div>
	                        	<!-- 포스터이미지 -->
	                        <img class="classPoster" id="2imgPoster${stat.index +1}" src="/brw/resources/images/movie/poster/${list.MOVIE_POSTER_IMAGE}" >
	                    </div>
	                 </c:forEach>
	                <!-- 평점순 박스오피스 1 ~ 10 /-->
						
						<!-- 처음보여지는 이미지 ㅋ  조회수기준임 !-->
	                	<div class="mainposter1">
	                		<a name="posterLinkPart1" href="#none" onclick="mstView('movie','20176103')" style="text-decoration: underline;">
	                			<img id="mainPosterPart1" src="http://kobis.or.kr/kobis/web/comm/images/main/poster_A01.png">
	                		</a>
	                	</div>
	                	<a name="posterLinkPart1" href="#none" onclick="mstView('movie','20176103')" style="text-decoration: underline;">
	                		<c:forEach items="${movie_read}" var="list" varStatus="stat">
	                		   <c:if test="${stat.first}">
	                				<img class="classPoster" id="mainPosterImg1" src="/brw/resources/images/movie/poster/${list.MOVIE_POSTER_IMAGE}">
	                		   </c:if> 
	                		</c:forEach> 
	                	</a>
	                	<!-- 마우스 오버 전 처음보여지는 이미지 ㅋ -->
	                </td>
	                <!-- 옆그림자 -->
	                <td><img src="http://kobis.or.kr/kobis/web/comm/images/main/poster1.png"></td>
              	</tr>
              	<tr>
              		<!-- 밑그림자 -->
                	<td colspan="2"><img src="http://kobis.or.kr/kobis/web/comm/images/main/poster2.png"></td>
              	</tr>
            </tbody></table>
        </div>

       <!--  <div class="mainpicture1"><input type="text" id="mainpictureNm1"></div> -->
    </li>
    <!-- 포스터 /-->
	
	
    <li class="mainbody3">
		<ul>
    	<li class="mainbox1">

 		<!-- 일일 박스오피스  -->
        <!-- 제목 -->
        <div class="mainmovie1">
            <ul>
                <li class="mainleft">
                	<!-- 일일박스오피스 -->
                    <img src="http://kobis.or.kr/kobis/web/comm/images/main/movie_title01.png">
                    <img src="http://kobis.or.kr/kobis/web/comm/images/main/line.png" width="670px" height="2">
                </li>
            </ul>
        </div>
        <!-- 제목 -->

        <div class="mainmovie3" id="dailyBoxOffice">
        			<!-- 영화 조회순 -->
        			<c:forEach items="${movie_read }" var="list" varStatus="stat">
							<table class="mainover1" cellspacing="0" cellpadding="0" style="width: 310px;">
								<tbody>
									<tr	class="read_back" 
									onmouseover="MM_showHideLayers('poster${stat.index +1}','','mainshow','maindata${stat.index +1}' ,'','mainshow')"
										onmouseout="MM_showHideLayers('poster${stat.index +1}','','mainhide','maindata${stat.index +1}','','mainhide');fnPosterNm('1');">
										<td class="mainmovie4">
											<img src="http://kobis.or.kr/kobis/web/comm/images/main/nember_A0${stat.index +1}.png" alt="${stat.index +1}위 ">
										</td>
										<td class="B_data2"><a href="movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}">${list.MOVIE_NAME }</a></td>
										<td class="mainmovie6">${list.MOVIE_DIRECTOR}</td>
										<td class="mainmovie7">${list.MOVIE_READCOUNT}</td>
									</tr>
									<tr
										onmouseover="MM_showHideLayers('poster${stat.index +1}','','mainshow','maindata${stat.index +1}' ,'','mainshow')"
										onmouseout="MM_showHideLayers('poster${stat.index +1}','','mainhide','maindata${stat.index +1}','','mainhide');fnPosterNm('1');">
										<td colspan="6" class="mainline2"><img
											src="http://kobis.or.kr/kobis/web/comm/images/main/line.png" width="100%"
											height="2"></td>
									</tr>
								</tbody>
							</table>
					</c:forEach>		
							
			</div> 

		</li>


		<li class="mainbox2">
 		<!-- 평점순 박스오피스  -->
        <!-- 제목 -->
        <div class="mainmovie1">
            <ul>
                <li class="mainleft">
                    <img src="http://kobis.or.kr/kobis/web/comm/images/main/movie_title02.png">
                </li>
            </ul>
        </div>
        <!-- 제목 -->

        <div class="mainmovie3" id="weekEndBoxOffice">
        			<!-- 평점순 -->
        			<c:forEach items="${movie_grade }" var="list" varStatus="stat">
							<table class="mainover2" cellspacing="0" cellpadding="0"
								style="width: 310px;">
								
								<tbody>
									<tr
										onmouseover="MM_showHideLayers('2poster${stat.index +1}','','mainshow','2maindata${stat.index +1}' ,'','mainshow')"
										onmouseout="MM_showHideLayers('2poster${stat.index +1}','','mainhide','2maindata${stat.index +1}','','mainhide');fnPosterNm('1');">
										<td class="mainmovie4"><img
											src="http://kobis.or.kr/kobis/web/comm/images/main/nember_B0${stat.index +1}.png" alt="${stat.index +1}위 "></td>
										<td class="mainmovie5">
											<a href="movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}" >${list.MOVIE_NAME}</a></td>
										<td class="mainmovie6">${list.MOVIE_DIRECTOR}</td>
										<td class="mainmovie7">${list.MOVIE_GRADE}</td>
									</tr>
									<tr
										onmouseover="MM_showHideLayers('2poster${stat.index +1}','','mainshow','2maindata${stat.index +1}' ,'','mainshow')"
										onmouseout="MM_showHideLayers('2poster${stat.index +1}','','mainhide','2maindata${stat.index +1}','','mainhide');fnPosterNm('1');">
										<td colspan="6" class="mainline2"><img
											src="http://kobis.or.kr/kobis/web/comm/images/main/line.png" width="100%"
											height="2"></td>
									</tr>
								</tbody>
							</table>
					</c:forEach>
							
			</div>

		</li>

        </ul>
    </li>

    
  	</ul>
  	<!-- 전체박스 그림자 -->
  	<div class="shadowline"><img src="http://www.kobis.or.kr/kobis/web/comm/images/main/img01.png"></div>  
</div>
<br><br><br>



</body>
</html>