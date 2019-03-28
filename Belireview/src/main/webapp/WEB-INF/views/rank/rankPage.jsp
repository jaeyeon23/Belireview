<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- <script language="JavaScript" src="/brw/resources/Rcss/rank.js"></script> -->
	<link href="/brw/resources/Rcss/default.css" rel="stylesheet">
	<script src="/brw/resources/Rcss/jquery.vticker.min.js"></script>
	
    <script>

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
<br><br>
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
							  </c:forEach>
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
	                
	                <%-- <table cellpadding="0" cellspacing="0">
						<tbody id="lastestOpenning">
						<c:forEach items="${rank5_drama }" var="list">
							<tr class="mainlist_bg1">
								<td class="mainlist1" title="${list.SEARCH_TEXT }">
								<a class="mainlist1_over" href="/brw/drama/dramaDetail.br?DRAMA_NO=${list.NO}">${list.SEARCH_TEXT}</a><br>
							</tr>
							<tr>
								<td colspan="4" class="mainlist_dot"></td>
							</tr>
						</c:forEach>
						</tbody>
					</table> --%>
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
	                
	               <%--  <table cellpadding="0" cellspacing="0">
						<tbody id="lastestOpenning">
						<c:forEach items="${rank5_actor }" var="list">
							<tr class="mainlist_bg1">
								<td class="mainlist1" title="${list.SEARCH_TEXT }">
								<a class="mainlist1_over" href="#">${list.SEARCH_TEXT }</a><br>
							</tr>
							<tr>
								<td colspan="4" class="mainlist_dot"></td>
							</tr>
						</c:forEach>
						</tbody>
					</table> --%>
	            </div>
	        </li>
	    </ul>
</div>
<!-- 인기검색어 -->

<br>

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
	                        	<!-- 순위이미지 -->
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
        			<c:forEach items="${movie_read }" var="list" varStatus="stat">
							<table class="mainover1" cellspacing="0" cellpadding="0" style="width: 310px;">
								<tbody>
									<tr onmouseover="MM_showHideLayers('poster${stat.index +1}','','mainshow','maindata${stat.index +1}' ,'','mainshow')"
										onmouseout="MM_showHideLayers('poster${stat.index +1}','','mainhide','maindata${stat.index +1}','','mainhide');fnPosterNm('1');">
										<td class="mainmovie4">
											<img src="http://kobis.or.kr/kobis/web/comm/images/main/nember_A0${stat.index +1}.png" alt="${stat.index +1}위 ">
										</td>
										<td class="mainmovie5"><a style="color: #ffffff;"
											href="#none" onclick="mstView('movie','20176103')">${list.MOVIE_NAME }</a></td>
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

						<div class="mainmovie10" id="dailyBoxOfficeDate">
        <table><tbody><tr><td>03.21</td></tr></tbody></table></div>

		</li>


		<li class="mainbox2">
 		<!-- 주말 박스오피스  -->
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
        			<c:forEach items="${movie_grade }" var="list" varStatus="stat">
							<table class="mainover2" cellspacing="0" cellpadding="0"
								style="width: 310px;">
								<tbody>
									<tr
										onmouseover="MM_showHideLayers('2poster${stat.index +1}','','mainshow','2maindata${stat.index +1}' ,'','mainshow')"
										onmouseout="MM_showHideLayers('2poster${stat.index +1}','','mainhide','2maindata${stat.index +1}','','mainhide');fnPosterNm('1');">
										<td class="mainmovie4"><img
											src="http://kobis.or.kr/kobis/web/comm/images/main/nember_B0${stat.index +1}.png" alt="${stat.index +1}위 "></td>
										<td class="mainmovie5"><a style="color: #ffffff;"
											href="#none" onclick="mstView('movie','20181877')">${list.MOVIE_NAME}</a></td>
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



						<div class="mainmovie10" id="weekEndBoxOfficeDate">
       	<table><tbody><tr><td>03.15 ~ 03.17</td></tr></tbody></table></div>
		</li>

        </ul>
    </li>

    
  	</ul>
  	<!-- 전체박스 그림자 -->
  	<div class="shadowline"><img src="http://www.kobis.or.kr/kobis/web/comm/images/main/img01.png"></div>  
</div>
<br><br><br>

-----------------------------------원본 보호 ~~~-----------------------------------------------
	<div class="container">
		<div class="blog">
			<div class="row">
				<div class="col-md-8 blog-content detail">
					<div class="row">
						<div class="col-md-12 blog-block">
							<ul id="myTab" class="nav nav-tabs newest" role="tablist">
								<li role="presentation" class="active"><a href="#1"
									id="cat-1" role="tab" data-toggle="tab" aria-controls="1"
									aria-expanded="true">관객순</a></li>
								<li role="presentation"><a href="#2" role="tab" id="cat-2"
									data-toggle="tab" aria-controls="2">평점순</a></li>
								<li role="presentation"><a href="#3" role="tab" id="cat-3"
									data-toggle="tab" aria-controls="3">조회순</a></li>
							</ul>

							<div id="myTabContent" class="tab-content">
								<!-- 관객순 -->
								<div role="tabpanel" class="tab-pane fade in active" id="1"
									aria-labelledby="cat-1">
									<c:forEach items="${movie_total }" var="list">
										<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}">${list.MOVIE_NAME }</a>
										<br>
									</c:forEach>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="2"
									aria-labelledby="cat-2">
									<c:forEach items="${movie_grade }" var="list">
										<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}">${list.MOVIE_NAME }</a><br>
									</c:forEach>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="3"
									aria-labelledby="cat-3">
									<c:forEach items="${movie_read }" var="list">
										<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}">${list.MOVIE_NAME }</a><br>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 sidebar">
					<div class="sidebar-inner">
						<div>
							<h4>전체 인기검색어</h4>
								<c:forEach items="${rank5_total }" var="list">
									${list.SEARCH_TEXT }<br>
								</c:forEach>
						</div>				
						<div>	
							<h4>영화 인기검색어</h4>
								<c:forEach items="${rank5_movie }" var="list">
									<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.NO}">${list.SEARCH_TEXT }</a><br>
								</c:forEach>
						</div>
						<div>
							<h4>드라마 인기검색어</h4>
								<c:forEach items="${rank5_drama }" var="list">
									<a href="/brw/drama/dramaDetail.br?DRAMA_NO=${list.NO}">${list.SEARCH_TEXT }</a><br>
								</c:forEach>
						</div>
						<div>
							<h4>배우 인기검색어</h4>
								<c:forEach items="${rank5_actor }" var="list">
									${list.SEARCH_TEXT }<br>
								</c:forEach>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>