<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Date date = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd  HH:mm:ss");
	String nowdate = simpleDateFormat.format(date);
%>
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
	
	<link rel="stylesheet" type="text/css" href="/brw/resources/Rcss/g_rcss.css" />
    <link rel="stylesheet" type="text/css" href="/brw/resources/Rcss/style.css" />
	
	<!-- 명령어 중복으로 인한 제이쿼리 중복오류를 피하기 위해 사용 -->
	<script type="text/javascript">
    jQuery.noConflict();
    var j$ = jQuery;
	</script>
	
	<!-- 토탈 js -->
	<script src="/brw/resources/Rcss/rank.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$("#bgLayer").hide();
		})
	</script>
</head>
<body>
<div id="bgLayer" style="position: fixed;width: 100%;height: 120%;left: 0px;top: 0px;background: rgb(0, 0, 0);opacity: 0.8;z-index: 2000000;"></div>
<!-- 평점/조회순 js -->
<script language="JavaScript" src="//images.maxmovie.com/js/jQuery/jquery-1.9.1.min.js"></script> 
<div id="wrap">
		<!-- container -->
		<div id="container">
			<!-- top slide -->
			<div class="tslide">
				<div class="mvbggbox">
					<div class="mvbgg">
					<div class="iqfWpE"></div>
					<div class="blSCrX"></div>
					</div>
				</div>
				<div class="tslidebg">
					<!-- 랭크탑 -->
					<div id="RankTopView" class="tslidein">
						<ul id="RankTopSlide" class="tslist">
						<c:forEach items="${movie_grade}" var="list" varStatus="stat">
							<!-- 영화배경이미지 -->						
							<li data-bg-image="/brw/resources/images/movie/main/${list.MOVIE_MAIN_IMAGE}"
								data-bg-color="#343e46" data-vid="V000291719"
								data-player-type="M" data-player-key="V000329795">
								<div class="tposbx">
									<p class="tpos">
										<!-- 영화포스터위치 -->
										<img src="/brw/resources/images/movie/poster/${list.MOVIE_POSTER_IMAGE}" class="im" alt="무비이슈" /> 
										<em class="trk">
										<!-- 순위이미지 -->
										<img src="//images.maxmovie.com/images/web/2016_new/images/main/bl_slide_num${stat.index+1 }.png"
											alt="${stat.index+1 }위" />
										</em> 
										<span class="audbx"><em>누적평점</em><br />
											<em class="audtx"><img src="//images.maxmovie.com/images/web/2016_new/images/main/bl_star.png"/>
											<strong>${list.MOVIE_GRADE }</strong></em></span>
									</p>
									<div class="tptxt">
										<p class="tfl">
											${list.MOVIE_NAME }
										</p>									
									</div>
									
									<!-- 마우스 오버시 나타나는것 -->
									<div class="sover">
										<p class="sage">
											<a href="/Movie/M000110839" data-mid="M000110839"><span
												class="y15">15</span>${list.MOVIE_NAME }</a>
										</p>
										<p class="sboo">
											<em>${list.MOVIE_COUNTRY }</em>
										</p>
										<p class="sbtxt">
											개봉 ${list.MOVIE_DATE} 
										</p>
										<p class="sbtxt">
											상영 ${list.MOVIE_RUNNINGTIME }분
										</p>
										<p class="sbtxt">누적관객수${list.MOVIE_TOTAL_COUNT }명</p>
										<p class="spl">
											<a href="#"></a>
										</p>
										<p class="slbtn">
											<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO }">상세 보기</a>
									<!-- 		<a href="http://news.maxmovie.com/?s=%eb%8f%88+">뉴스</a> -->
										</p>
									</div>
								</div>
							</li>
						</c:forEach>	
						</ul>
						
						<!-- 탭1 -->
						<ul class="tslist" style="display: none" id="RankTopView1">
							<c:forEach items="${movie_grade}" var="list" varStatus="stat">
							<!-- 영화배경이미지 -->
							<li data-bg-image="/brw/resources/images/movie/main/${list.MOVIE_MAIN_IMAGE}"
								data-bg-color="black" data-vid="V000291719"
								data-player-type="M" data-player-key="V000329795">
								<div class="tposbx">
									<p class="tpos">
										<!-- 영화포스터위치 -->
										<img src="/brw/resources/images/movie/poster/${list.MOVIE_POSTER_IMAGE}" class="im" alt="무비이슈" /> 
										<em class="trk">
										<!-- 순위이미지 -->
										<img src="//images.maxmovie.com/images/web/2016_new/images/main/bl_slide_num${stat.index+1 }.png"
											alt="${stat.index+1 }위" />
										</em> 
										<span class="audbx"><em>누적평점</em><br />
											<em class="audtx"><strong>⭐${list.MOVIE_GRADE }</strong></em></span>
									</p>
									<div class="tptxt">
										<p class="tfl">
											${list.MOVIE_NAME }
										</p>									
									</div>
									
									<!-- 마우스 오버시 나타나는것 -->
									<div class="sover">
										<p class="sage">
											<a href="/brw/mainSearch.br?searchText=${list.MOVIE_NAME }" data-mid="M000110839"><span
												class="y15">15</span>${list.MOVIE_NAME } </a>
										</p>
										<p class="sboo">
											<em>${list.MOVIE_COUNTRY }</em>
										</p>
										<p class="sbtxt">
											개봉 ${list.MOVIE_DATE} 
										</p>
										<p class="sbtxt">
											상영 ${list.MOVIE_RUNNINGTIME }분
										</p>
										<p class="sbtxt">누적관객수 ${list.MOVIE_TOTAL_COUNT }명</p>
										<p class="spl">
											<a href="#"></a>
										</p>
										<p class="slbtn">
											<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO }">상세 보기</a>
										</p>
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>
						
						
						<!-- 조회순 탭2시작 -->
						<ul class="tslist" style="display: none" id="RankTopView2">
							<c:forEach items="${movie_read }" var="list" varStatus="stat">
							<!-- 영화배경이미지 -->
							<li data-bg-image="/brw/resources/images/movie/main/${list.MOVIE_MAIN_IMAGE}"
								data-bg-color="black" data-vid="V000324850" >
								<div class="tposbx" >
									<p class="tpos">
										<!-- 포스터이미지 -->
										<img src="/brw/resources/images/movie/poster/${list.MOVIE_POSTER_IMAGE}"
											class="im" alt="무비이슈" /> 
										<em class="trk">
										<!-- 순위이미지  -->
										<img src="//images.maxmovie.com/images/web/2016_new/images/main/bl_slide_num${stat.index+1 }.png"
											alt="${stat.index+1 }위" />
										</em> 
										<span class="audbx"><em>누적조회수</em><br />
											<em class="audtx"><strong>🔺${list.MOVIE_READCOUNT}</strong></em></span>
									</p>
									
									
									<div class="tptxt">
										<p class="tfl">${list.MOVIE_NAME}</p>
									</div>
									
									<!-- 마우스오버시 텍스트 -->
									<div class="sover">
										<p class="sage">
											<a href="/brw/mainSearch.br?searchText=${list.MOVIE_NAME }"><span class="y15">15</span>
												${list.MOVIE_NAME } </a>
										</p>
										<p class="sboo">
											<em>${list.MOVIE_GENRE }</em>
										</p>
										<p class="sbtxt">
											개봉 ${list.MOVIE_DATE} 
										</p>
										<p class="sbtxt">
											상영 ${list.MOVIE_RUNNINGTIME }분
										</p>
										<p class="sbtxt">누적관객수 ${list.MOVIE_TOTAL_COUNT }명</p>
										<p class="spl">
											<a href="#"></a>
										</p>
										<p class="slbtn">
											<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO }">상세 보기</a>
										</p>
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>
																		
						<div class="tstab">
							<ul>
								<li><a href="#RankTopView1" class="">Good Grade</a></li>
								<li><a href="#RankTopView2" class="">Hot Click</a></li>
							<!-- 	<li><a href="#RankTopView3" class="">개봉 예정작</a></li>
								<li><a href="#RankTopView4" class="">다양성 영화</a></li>
								<li><a href="#RankTopView5" class="">케챱</a></li> -->
							</ul>
						</div>
					</div>
					<!-- <,> 방향표시 -->
					<p class="tslf">
						<a id="TprevBtn"><span>이전으로</span></a>
					</p>
					<p class="tsrf">
						<a id="TnextBtn"><span>다음으로</span></a>
					</p>
				</div>
			</div>
			<!-- //top slide -->
			<!-- contents -->
		</div>
		
	</div>
	
	
	
	<!-- 인기검색어 -->
	<div class="maintable1">
	   <div class="search_name">급상승 검색어</div>
	    <ul>
	    	
			<li class="mainframe1">
	        	<div class="mainrelease1">
	                <div>
	                    <ul> <!-- 전체제목목위치욤 ㅎ -->
	                        <li class="maintitle_h1">Movie</li>
	                    </ul>
	                </div>
	                <div class="ie9_mainnewopen"></div>
	                <div style="padding:5px 0 0 0"></div>
	                
	                <div id="best_movie">
	               		 <ul>
	              			  <c:forEach items="${rank5_movie }" var="list" varStatus="stat">
						  		 <li class="mainlist_bg1" title="${list.SEARCH_TEXT }" >
						  		 	<div id="rank_num">${stat.index+1}</div>
									<a class="mainlist1" href="/brw/movie/movieDetail.br?MOVIE_NO=${list.NO}">
											${list.SEARCH_TEXT}
											<span style="float: right; padding-right: 10px">📈</span>
										
									</a>
							     </li>
							   </c:forEach>
						 </ul>
					</div>
	            </div>
	        </li>

			<!-- 개봉 예정작 -->
	        <li class="mainframe2">
	            <div class="mainrelease1">
	                <div>
	                    <ul>
	                        <li class="maintitle_h1">Drama</li>
	                    </ul>
	                </div>

	                <div class="ie9_mainnewopen"></div>
	                <div style="padding:5px 0 0 0"></div>
	                
	                <div id="best_drama">
	               		 <ul>
	              			  <c:forEach items="${rank5_drama }" var="list" varStatus="stat">
						  		 <li class="mainlist_bg1" title="${list.SEARCH_TEXT }" >
						  			<div id="rank_num">${stat.index+1}</div>
									<a class="mainlist1" href="/brw/drama/dramaDetail.br?DRAMA_NO=${list.NO}">
									${list.SEARCH_TEXT}
									<span style="float: right; padding-right: 20px">📈</span>
									</a>
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
	                        <li class="maintitle_h1">Actor</li>
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
	



	<!--영화관입장권 통합전산망-->
        <div class="integrated_network_area" id="boxoffice_area">
            <div class="inner">

                <div class="section_title_wrap">
                    <div class="section_title">역대 영화 흥행순위</div>
                     <div class="section_text integrated_network_movie_ranking_btn">
						<span>
							한국 상영관의 입장권 발권정보를 바탕으로 한 데이터입니다.
						</span>
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
									<dd id="showTm">${list.MOVIE_RUNNINGTIME} 분</dd>
								</dl>
								<dl>
									<dt>제작국가</dt>
									<dd id="repNationNm">${list.MOVIE_COUNTRY}</dd>
								</dl>
							</div>
							<div class="integrated_network_movie_info_definition">								
								<dl>
									<dt>내용</dt>
									<dd id="dtNm">
									<c:choose>
										<c:when test="${fn:length(list.MOVIE_CONTENT) > 69}">
           									 <c:out value="${fn:substring(list.MOVIE_CONTENT,0,68)}"/> ....
           									 <a href="/brw/movie/movieInfo.br?MOVIE_NO=${list.MOVIE_NO}">더보기</a>
         								</c:when>
        								<c:otherwise>
           								 	 <c:out value="${list.MOVIE_CONTENT}"/>
         								</c:otherwise> 
									</c:choose>
									</dd>
								</dl>
							</div> 
						</div>
						</c:forEach>
                    </div>
                    
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
                                    <th style="padding-left: 5%;">순 위</th>
                                    <th style="padding-left: 32%;">영화명</th>
                                    <th style="padding-left: 5%;">관객수</th>
                                </tr>
                            </thead>
                            <tbody id="mainKobisList">
                            	<c:forEach items="${movie_total }" var="list" varStatus="stat">
                            		<tr onclick="fnKobizUrl()"
                            			onmouseover="MM_showHideLayers('3poster${stat.index +1}','','mainshow','3maindata${stat.index +1}' ,'','mainshow')">
									<td id="test_R${stat.index +1}"><div class="movie_ranking_number">${stat.index +1 }</div></td>
									<td id="test_M${stat.index +1}"><a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}" 
										style="color:#b6b6b6; font-weight:bold ;">${list.MOVIE_NAME}</a></td>
									<td align="right">${list.MOVIE_TOTAL_COUNT}명</td>
									</tr>
								</c:forEach>
                            </tbody>
                        </table>

                        <div class="integrated_network_movie_ranking_table_bottom">
                            <div class="integrated_network_movie_ranking_table_bottom01"></div>
                            <div class="integrated_network_movie_ranking_table_bottom02" id="boxDate">
                            	<%= nowdate %> 기준</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--//영화관입장권 통합전산망-->


	
	
	 <script type="text/javascript"
		src="//content.jwplatform.com/libraries/TEnfr8VO.js"></script> 
	<script type="text/javascript"
		src="//images.maxmovie.com/js/jquery/jquery.bxslider.4.1.1.min.js"></script>
	<script type="text/javascript"
		src="//images.maxmovie.com/js/max/crypt/rsa.js"></script>
	<script type="text/javascript"
		src="//images.maxmovie.com/js/max/max.member_20190115.js"></script>		
	<script type="text/javascript"
		src="//images.maxmovie.com/js/max/max.player.js"></script>
		
		
	<script type="text/javascript"
		src="//www.maxmovie.com/scripts/common.js"></script>
<!-- 	<script type="text/javascript"
		src="//www.maxmovie.com/scripts/movieplay.js"></script> -->

	<script type="text/javascript"
		src="//www.maxmovie.com/scripts/deviceCheck.js?d=20181026"></script>
	<!-- <script type="text/javascript"
		src="//www.maxmovie.com/scripts/movieplay.js"></script> -->
<!-- 
	<script type="text/javascript" src="//www.maxmovie.com/scripts/sns.js"></script> -->
	<script type="text/javascript"
		src="//www.maxmovie.com/scripts/chart/boomup_function.js"></script>
	<script type="text/javascript"
		src="//www.maxmovie.com/scripts/main/index.js?d=20180302"></script>

</body>
</html>