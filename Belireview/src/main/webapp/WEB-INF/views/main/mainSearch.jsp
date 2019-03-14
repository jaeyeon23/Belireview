<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/brw/resources/css/mainsearch3.css">
<script type="text/javascript">
	var currentPage = 1;
	var searchText = "${request}";
	$(function(){
		$(".mainPlus").click(function(){
			mainPlus();
		})		
	})

	function mainPlus(){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage+1, searchText:searchText},
			url:"<c:url value='/mainSearch2.br'/>",
			
			success:function(result){
				var r = result.searchMain;
				var str = "";
				$(r).each(function(){
					str += '<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">'+
					'<c:choose>'+
						"<c:when test=${result.TYPE=='영화'}>"+
						'<a href="/brw/movie/movieDetail.br?MOVIE_NO=${result.NO}">'+
						'</c:when>'+
						"<c:when test=+${result.TYPE=='영화'}>"+
						'<a href="/brw/drama/dramaDetail.br?DRAMA_NO=${result.NO}">'+
						'</c:when>'+
						'<c:otherwise>'+
						'<a href="/brw/ad/adDetail.br?AD_NO=${result.NO}">'+
						'</c:otherwise>'+
					'</c:choose>'+
						'<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">'+
							'<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">'+
								'<img class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb" data-image-id="20" src="/brw/resources/images/3-girls.jpg">'+
								'</div>'+
						'</div>'+
						'<div class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">'+
							'<div class="SearchResultsSection__TopResultItemTitle-s1qazrkm-1 kBOijn">${result.NAME}</div>'+
							'<div class="SearchResultsSection__TopResultItemExtraInfo-s1qazrkm-2 dGUMNT">${result.DATE} ・${result.GENRE}</div>'+
							'<div class="SearchResultsSection__TopResultContentType-s1qazrkm-3 eeOgLY">${result.DATE}</div>'+
						'</div></a></li>'
				})
			$(".mm").html(str);		
			}
		})
	}

</script>
</head>
<body>
	<div id="root">
		<div class="App__Self-m1g4ja-0 iBpXSE">
			<div class="NavTabManager__NavContainer-dbid0l-0 hhxQev">
				<section class="NavTabManager__Main-dbid0l-1 ikHAvF">
					<section class="SearchResultsSection__Self-s1qazrkm-0 nEgxe">
						<section class="SectionWithHeader__Self-s1eyxltb-0 cVpbhx">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">"${request}"	검색 결과</h2>
									</header>
								</div>
							</div>
							
							<div
								class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
								<div
									class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 epjsYP">
									<div
										class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK"
										style="transform: translateX(0px);">
										<div class="Grid-zydj2q-0 cspjno">
											<div class="Row-s1apwm9x-0 lowZpE">
												<ul class="HorizontalUlWithContentPosterList__StyledHorizontalUlWithContentPosterList-rp5ukn-0 kVCLyu HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 fbzjBz VisualUl-s1vzev56-0 hgAYVH mm">
													<c:forEach items="${searchMain}" var="result">
													<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
													<%-- <a lng="ko-KR" title="${request}" href="/brw/movie/movieDetail.br?MOVIE_NO=${result.NO}"> --%>
													<c:choose>
														<c:when test="${result.TYPE=='영화'}">
														<a lng="ko-KR" title="${request}" href="/brw/movie/movieDetail.br?MOVIE_NO=${result.NO}">
														</c:when>
														<c:when test="${result.TYPE=='TV'}">
														<a lng="ko-KR" title="${request}" href="/brw/drama/dramaDetail.br?DRAMA_NO=${result.NO}">
														</c:when>
														<c:otherwise>
														<a lng="ko-KR" title="${request}" href="/brw/ad/adDetail.br?AD_NO=${result.NO}">
														</c:otherwise>
													</c:choose>
														<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
															<!-- <div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
															<img class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb" data-image-id="10" src="/brw/resources/images/3-girls.jpg">
															</div> -->
															<!-- 수정본 -->
															<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																<img class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb"
																		data-image-id="20" src="/brw/resources/images/3-girls.jpg"">
																</div>
														</div>
														<div class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
															<div class="SearchResultsSection__TopResultItemTitle-s1qazrkm-1 kBOijn">${result.NAME}</div>
															<div class="SearchResultsSection__TopResultItemExtraInfo-s1qazrkm-2 dGUMNT">${result.DATE} ・ ${result.GENRE}</div>
															<div class="SearchResultsSection__TopResultContentType-s1qazrkm-3 eeOgLY">${result.TYPE} </div>
														</div></a></li>
													</c:forEach>
													<div class="SpinnerContainer__Self-s16nvp7b-0 dvymnj"></div>
												</ul>
											</div>
										</div>
									</div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 blMCgo" direction="left">
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD mainMinus"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh mainPlus "></div>
								</div>
								
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						
						
						<section class="SectionWithHeader__Self-s1eyxltb-0 cVpbhx">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">영화</h2>
										<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
											<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
												<a lng="ko-KR" href="/ko-KR/searches/tv_seasons/%EB%8F%84%EA%B9%A8%EB%B9%84">더보기</a>
											</div>
										</div>
									</header>
								</div>
							</div>
							
							<div
								class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
								<div
									class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 epjsYP">
									<div
										class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK">
										<div class="Grid-zydj2q-0 cspjno">
											<div class="Row-s1apwm9x-0 lowZpE">
												<ul	class="SearchResultsSection__ResultStackableUl-s1qazrkm-4 gdjZVu StackableUl__StyledStackableUl-gafxvv-1 LNYRd VisualUl-s1vzev56-0 hgAYVH">
													<c:forEach items="${searchMovie}" var="movie">
													<li class="StackableListItem-s18nuw36-0 cIJjio">
													<a lng="ko-KR" class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD" title="${request}" href="/brw/movie/movieDetail.br?MOVIE_NO=${movie.MOVIE_NO}">
														<div class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																<div class="LazyLoadingBackground-cgbyi4-0 cioRyq LazyLoadingBackgroundw__Self-s1stfhov-0 jXCeuY" alt="${request}">
																	<!-- <span class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 jhdCRo" data-background-image-id="27"> -->
																	<span class="LazyLoadingBackgroundw__BackgroundImage-s1stfhov-1 mPWPS" data-background-image-id="38">
																		<img class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni" src="/brw/resources/images/3-girls.jpg"></span>
																</div>
															</div>
															<div class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																<div
																	class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																	<div
																		class="SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM">${movie.MOVIE_NAME}</div>
																	<div
																		class="SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ">[${movie.MOVIE_DATE}]・ [${movie.MOVIE_GENRE}]</div>
																</div>
																<div></div>
															</div></a></li>
													</c:forEach>
													<div class="StackableUl__SpinnerContainer-gafxvv-0 gddnxb"></div>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 blMCgo" direction="left">
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
								</div>
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						
						<section class="SectionWithHeader__Self-s1eyxltb-0 cVpbhx">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">TV</h2>
										<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
											<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
												<a lng="ko-KR"
													href="/ko-KR/searches/tv_seasons/%EB%8F%84%EA%B9%A8%EB%B9%84">더보기</a>
											</div>
										</div>
									</header>
								</div>
							</div>
							
							
							<div
								class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
								<div
									class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 epjsYP">
									<div
										class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK">
										<div class="Grid-zydj2q-0 cspjno">
											<div class="Row-s1apwm9x-0 lowZpE">
												<ul
													class="SearchResultsSection__ResultStackableUl-s1qazrkm-4 gdjZVu StackableUl__StyledStackableUl-gafxvv-1 LNYRd VisualUl-s1vzev56-0 hgAYVH">
													<c:forEach items="${searchDrama}" var="drama">
													<li class="StackableListItem-s18nuw36-0 cIJjio"><a
														lng="ko-KR"
														class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD"
														title="${request}" href="/brw/drama/dramaDetail.br?DRAMA_NO=${drama.DRAMA_NO}"><div
																class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																<div
																	class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																	<span class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 jhdCRo"
																		data-background-image-id="38">
																		<img class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni" src="/brw/resources/images/3-girls.jpg">
																	</span>
																</div>
															</div>
															<div
																class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																<div
																	class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																	<div
																		class="SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM">${drama.DRAMA_NAME}</div>
																	<div
																		class="SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ">[${drama.DRAMA_DATE}]・[${drama.DRAMA_CHANNEL}]</div>
																</div>
																<div></div>
															</div></a></li>
													</c:forEach>
													<div class="StackableUl__SpinnerContainer-gafxvv-0 gddnxb"></div>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 blMCgo" direction="left">
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
								</div>
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						
						<section class="SectionWithHeader__Self-s1eyxltb-0 cVpbhx">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">광고</h2>
										<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
											<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
												<a lng="ko-KR"
													href="/ko-KR/searches/tv_seasons/%EB%8F%84%EA%B9%A8%EB%B9%84">더보기</a>
											</div>
										</div>
									</header>
								</div>
							</div>
							
							<div
								class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
								<div
									class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 epjsYP">
									<div
										class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK">
										<div class="Grid-zydj2q-0 cspjno">
											<div class="Row-s1apwm9x-0 lowZpE">
												<ul
													class="SearchResultsSection__ResultStackableUl-s1qazrkm-4 gdjZVu StackableUl__StyledStackableUl-gafxvv-1 LNYRd VisualUl-s1vzev56-0 hgAYVH">
													<c:forEach items="${searchAd}" var="ad">
													<li class="StackableListItem-s18nuw36-0 cIJjio"><a
														lng="ko-KR"
														class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD"
														title="${request}" href="/brw/ad/adDetail.br?AD_NO=${ad.AD_NO}"><div
																class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																<div
																	class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																	<span
																		class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 jhdCRo"
																		data-background-image-id="27">
																		<img class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni" src="/brw/resources/images/3-girls.jpg"></span>
																</div>
															</div>
															<div
																class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																<div
																	class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																	<div
																		class="SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM">${ad.AD_NAME}</div>
																	<div
																		class="SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ">[${ad.AD_COMPANY}]・ [${ad.AD_GRADE}]</div>
																</div>
																<div></div>
															</div></a></li>
													</c:forEach>
													<div class="StackableUl__SpinnerContainer-gafxvv-0 gddnxb"></div>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 blMCgo" direction="left">
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
								</div>
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						
					</section>
				</section>
			</div>
		</div>
	</div>
	<script>
        window.ga=function(){ga.q.push(arguments)};ga.q=[];ga.l=+new Date;
        ga("create","UA-27006241-7","auto");
      </script>


	<script src="https://browser.sentry-cdn.com/4.6.4/bundle.min.js"
		crossorigin="anonymous"></script>



	<script
		src="https://d2rlq84xifqisi.cloudfront.net/javascripts/web.53717eacf562ba0874bf.js"
		crossorigin="anonymous"></script>


	<script src="https://www.google-analytics.com/analytics.js" async=""
		defer=""></script>


	<script>
        if ('serviceWorker' in navigator) {
          window.addEventListener('load', function() {
            navigator.serviceWorker.register('https://watcha.com/sw.js');
          });
        }
      </script>
</body>
</html>