<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="/brw/resources/Rcss/default.css" rel="stylesheet">
</head>
<body>

<div class="maintable1">
	    <ul>
	    	<!-- 최신 개봉작 -->
			<li class="mainframe1">
	        	<div class="mainrelease1">
	                <div>
	                    <ul>
	                        <li class="maintitle_h1"><img src="/kobis/web/comm/images/main/title01.png"></li>
	                        <li class="right"><div class="mainmore"><a href="/kobis/business/stat/them/findLastestOpenningsList.do"><img src="/kobis/web/comm/images/main/more1.png" onmouseover="this.src='/kobis/web/comm/images/main/more1_on.png'" onmouseout="this.src='/kobis/web/comm/images/main/more1.png'" alt="더보기"></a></div></li>
	                    </ul>
	                </div>

	                <div class="ie9_mainnewopen"></div>
					<!-- 제목바 (영화명/개봉장 , 순위, 누적관객수, 스크린) -->
	                <div><img src="/kobis/web/comm/images/main/titlebar01.png"></div>

	                <div style="padding:5px 0 0 0"></div>
	                <table cellpadding="0" cellspacing="0">
	                	<tbody><tr>
	                    	<td colspan="4" class="mainlist_dot"></td>
	                	</tr>
						</tbody><tbody id="lastestOpenning">
						<tr class="mainlist_bg1"><td class="mainlist1" title="이스케이프 룸"><a class="mainlist1_over" href="#none" onclick="mstView('movie','20197283')" alt="이스케이프 룸">이스케이프 룸</a><br><em>2019.03.14</em></td><td class="mainlist2">5</td><td class="mainlist3">480,562명</td><td class="mainlist4">850</td></tr><tr><td colspan="4" class="mainlist_dot"></td></tr><tr class="mainlist_bg2"><td class="mainlist1" title="돈"><a class="mainlist1_over" href="#none" onclick="mstView('movie','20176103')" alt="돈">돈</a><br><em>2019.03.20</em></td><td class="mainlist2">1</td><td class="mainlist3">424,741명</td><td class="mainlist4">1,166</td></tr><tr><td colspan="4" class="mainlist_dot"></td></tr><tr class="mainlist_bg1"><td class="mainlist1" title="라스트 미션"><a class="mainlist1_over" href="#none" onclick="mstView('movie','20197356')" alt="라스트 미션">라스트 미션</a><br><em>2019.03.14</em></td><td class="mainlist2">9</td><td class="mainlist3">84,291명</td><td class="mainlist4">472</td></tr><tr><td colspan="4" class="mainlist_dot"></td></tr><tr class="mainlist_bg2"><td class="mainlist1" title="악질경찰"><a class="mainlist1_over" href="#none" onclick="mstView('movie','20197846')" alt="악질경찰">악질경찰</a><br><em>2019.03.20</em></td><td class="mainlist2">3</td><td class="mainlist3">65,384명</td><td class="mainlist4">833</td></tr><tr><td colspan="4" class="mainlist_dot"></td></tr><tr class="mainlist_bg1"><td class="mainlist1" title="우상"><a class="mainlist1_over" href="#none" onclick="mstView('movie','20175407')" alt="우상">우상</a><br><em>2019.03.20</em></td><td class="mainlist2">4</td><td class="mainlist3">57,204명</td><td class="mainlist4">900</td></tr><tr><td colspan="4" class="mainlist_dot"></td></tr></tbody>
	              	</table>
	            </div>
	        </li>

			<!-- 개봉 예정작 -->
	        <li class="mainframe2">
	            <div class="mainrelease1">
	                <div>
	                    <ul>
	                        <li class="maintitle_h1"><img src="/kobis/web/comm/images/main/title02.png"></li>
	                        <li class="right"><div class="mainmore"><a href="/kobis/business/mast/mvie/findOpenScheduleList.do"><img src="/kobis/web/comm/images/main/more1.png" onmouseover="this.src='/kobis/web/comm/images/main/more1_on.png'" onmouseout="this.src='/kobis/web/comm/images/main/more1.png'" alt="더보기"></a></div></li>
	                    </ul>
	                </div>

	                <div class="ie9_mainnewopen"></div>
					<div id="mainOpenmovieList">
	                    <ul id="openBeMovie">
	                    <li class="mainschedule1"><div><ul><li class="mainschedule_h"><a href="#none" onclick="mstView('movie','20196025');return false;"><img src="http://kobis.or.kr/common/mast/movie/2019/03/thumb/thn_d8870bb1ac7a4d2080d09c28edeebc1d.jpg" onerror="fn_OpenmovieList(this);" alt="개봉 예정작"></a></li><li class="mainschedule4">2019.03.27</li><li class="mainschedule5" title="덤보"><a href="#none" class="mainschedule6" onclick="mstView('movie','20196025');return false;">덤보</a></li></ul></div></li><li class="mainschedule2"><div><ul><li class="mainschedule_h"><a href="#none" onclick="mstView('movie','20187301');return false;"><img src="http://kobis.or.kr/common/mast/movie/2019/03/thumb/thn_a348ce3ced464c0ba2fb4c43ab3cf35a.jpg" onerror="fn_OpenmovieList(this);" alt="개봉 예정작"></a></li><li class="mainschedule4">2019.03.27</li><li class="mainschedule5" title="선희와 슬기"><a href="#none" class="mainschedule6" onclick="mstView('movie','20187301');return false;">선희와 슬기</a></li></ul></div></li><li class="mainschedule3"><div><ul><li class="mainschedule_h"><a href="#none" onclick="mstView('movie','20183773');return false;"><img src="http://kobis.or.kr/common/mast/movie/2019/03/thumb/thn_45b4b7f33c4a4d26bd1a37d85210a922.jpg" onerror="fn_OpenmovieList(this);" alt="개봉 예정작"></a></li><li class="mainschedule4">2019.03.27</li><li class="mainschedule5" title="장난스런 키스"><a href="#none" class="mainschedule6" onclick="mstView('movie','20183773');return false;">장난스런 키스</a></li></ul></div></li></ul>
	                </div>
				</div>
	        </li>

 			<!-- 전광판 -->
	        <li class="mainframe3">
	        	<div class="mainrelease1">
	            	<div>
	                    <ul>
	                        <li class="maintitle_h1"><img src="/kobis/web/comm/images/main/title03.png"></li>
	                        <li class="right"><div class="mainmore"><a href="#none" onclick="fn_goPage('1');return false;"><img src="/kobis/web/comm/images/main/more1.png" onmouseover="this.src='/kobis/web/comm/images/main/more1_on.png'" onmouseout="this.src='/kobis/web/comm/images/main/more1.png'" alt="더보기"></a></div></li>
	                    </ul>
	                </div>

	                <div class="ie9_mainnewopen"></div>
					<!-- 탭 (총관객수 | 지역별 | 연동영화관) -->
	                <div>
	                	<ul id="menu">
	                    	<li class="maintapE1">
	                            <a href="#total"><img src="/kobis/web/comm/images/main/TapE01_on.gif" onmouseover="this.src='/kobis/web/comm/images/main/TapE01_over.gif'" onmouseout="this.src='/kobis/web/comm/images/main/TapE01.gif'" onclick="javascript:initTabMu('menu', 'E', '1');return false;" alt="총관객수"></a>
	                        </li>
	                    	<li class="maintapE1">
	                            <a href="#area"><img src="/kobis/web/comm/images/main/TapE02.gif" onmouseover="this.src='/kobis/web/comm/images/main/TapE02_over.gif'" onmouseout="this.src='/kobis/web/comm/images/main/TapE02.gif'" onclick="javascript:initTabMu('menu', 'E', '2');return false;" alt="지역별"></a>
	                        </li>
	                        <li class="maintapE1">
	                            <a href="#cinema"><img src="/kobis/web/comm/images/main/TapE03.gif" onmouseover="this.src='/kobis/web/comm/images/main/TapE03_over.gif'" onmouseout="this.src='/kobis/web/comm/images/main/TapE03.gif'" onclick="javascript:initTabMu('menu', 'E', '3');return false;" alt="연동영화관"></a>
	                        </li>
	                	</ul>
	                </div>
	                <!-- 탭 (총관객수 | 지역별 | 연동영화관) /-->

 					<div style="padding:30px 0px 0px 0px"></div>

					<!-- 총관객수 -->
					<div id="total" style="display: block;">
					<table cellpadding="0" cellspacing="0"><tbody><tr class="maintapbox_bg1"><td class="maintapbox3"><img src="/kobis/web/comm/images/main/img_day.gif" alt="일(Day)"></td><td class="maintapbox5">03/21</td><td class="maintapbox6">303,695명</td></tr><tr><td colspan="3" class="maintapbox_dot"></td></tr><tr class="maintapbox_bg2"><td class="maintapbox4"><img src="/kobis/web/comm/images/main/img_week.gif" alt="주(Week)"></td><td class="maintapbox5">03/11~17(주간)<br>03/15~17(주말)</td><td class="maintapbox6">2,521,439명<br>1,649,885명</td></tr><tr><td colspan="3" class="maintapbox_dot"></td></tr><tr class="maintapbox_bg1"><td class="maintapbox3"><img src="/kobis/web/comm/images/main/img_month.gif" alt="월(Month)"></td><td class="maintapbox5">03/01~31</td><td class="maintapbox6">9,880,580명</td></tr><tr><td colspan="3" class="maintapbox_dot"></td></tr><tr class="maintapbox_bg2"><td class="maintapbox3"><img src="/kobis/web/comm/images/main/img_year.gif" alt="년(Year)"></td><td class="maintapbox5">2019년</td><td class="maintapbox6">50,281,665명</td></tr><tr><td colspan="3" class="maintapbox_dot"></td></tr></tbody></table><p class="maintapbox13"><font style="text-decoration: underline;">년(Year) 통계</font>는 전일자까지의 마감통계와 금일 실시간 발권데이터를 합한 수치임</p></div>
					<!-- //총관객수 -->

					<!-- 지역별 -->
					<div class="display">
						<div id="area" class="area" style="padding: 5px 0px 0px; display: none;"><div id="areaSubDiv" class="titbox"><em>주간 지역별 관객 점유율</em> | <span>03.11 ~ 03.17</span></div><ul><li class="frst"><p style="height:18px;"><span style="float:left;font-size:11px;">01.서울</span><span style="float:right;margin-right:7px;">  29.2%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">02.경기</span><span style="float:right;margin-right:7px;">  24.0%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">03.부산</span><span style="float:right;margin-right:7px;">   7.0%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">04.인천</span><span style="float:right;margin-right:7px;">   5.1%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">05.대구</span><span style="float:right;margin-right:7px;">   4.8%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">06.경남</span><span style="float:right;margin-right:7px;">   4.5%</span></p></li><li class="secnd"><p style="height:18px;"><span style="float:left;font-size:11px;">07.대전</span><span style="float:right;margin-right:7px;">   3.3%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">08.광주</span><span style="float:right;margin-right:7px;">   3.2%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">09.충남</span><span style="float:right;margin-right:7px;">   3.1%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">10.경북</span><span style="float:right;margin-right:7px;">   2.8%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">11.전북</span><span style="float:right;margin-right:7px;">   2.7%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">12.충북</span><span style="float:right;margin-right:7px;">   2.5%</span></p></li><li class="last"><p style="height:18px;"><span style="float:left;font-size:11px;">13.강원</span><span style="float:right;margin-right:7px;">   2.4%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">14.울산</span><span style="float:right;margin-right:7px;">   1.9%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">15.전남</span><span style="float:right;margin-right:7px;">   1.9%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">16.제주</span><span style="float:right;margin-right:7px;">   1.0%</span></p><p style="height:18px;"><span style="float:left;font-size:11px;">17.세종시</span><span style="float:right;margin-right:7px;">   0.5%</span></p></li></ul></div>
					</div>
					<!-- //지역별 -->

					<!-- 연동영화관 -->
					<div class="display">
						<div id="cinema" class="cinema" style="padding: 5px 0px 0px; display: none;"><div class="titbox"><span>2019년 03.22 현재</span></div><div class="cscreen"><div>영화관입장권통합전산망은<br> 전국영화관의 발권데이터를 실시간 집계처리하여<br> 각종 통계정보를 제공하고 있으며,<br></div><br><span>현재 <em><strong>529</strong></em>&nbsp;개 영화관,&nbsp;&nbsp; <strong style="color:#e40203;">3,024</strong>&nbsp;개 스크린 연동중에 있음</span></div><p>전국기준으로 휴관 및 폐관 중인 영화상영관 제외</p></div>
					</div>
					<!-- 연동영화관 -->
	            </div>
	        </li>
	    </ul>
</div>


<br>
<br><br><br><br><br><br>
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