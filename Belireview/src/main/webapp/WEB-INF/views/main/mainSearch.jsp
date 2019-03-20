<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/brw/resources/css/mainsearch4.css">
<script type="text/javascript">
	var mainPage = moviePage = dramaPage = adPage = 1;
	var block = 10;
	var maintotal = ${mainTotal};
	var movietotal = ${movieTotal};
	var dramatotal = ${dramaTotal};
	var adtotal = ${adTotal};
	var searchText = "${request}";
	
	/* 메인검색 페이징 및 넘기기 */
	$(function(){
		$(".mainNext").click(function(){
			if(maintotal>mainPage*block){
				mainPage += 1;
			}
			mainNext(mainPage);
		})
		$(".mainPrev").click(function(){
			mainPage = mainPage -1 < 1 ? 1:mainPage-1;
			mainPrev(mainPage);
		})	
	})

	function mainNext(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText},
			url:"<c:url value='/mainSearch2.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".mainSearch").html(result.searchMain);
			}
		})
	}
	function mainPrev(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText},
			url:"<c:url value='/mainSearch2.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".mainSearch").html(result.searchMain);		
			}
		})
	}
	/* 검색영화 페이징 및 넘기기 */
	
	$(function(){
		$(".movieNext").click(function(){
			if(movietotal>moviePage*block){
				moviePage += 1;
			}
			movieNext(moviePage);
		})
		$(".moviePrev").click(function(){
			moviePage = moviePage -1 < 1 ? 1:moviePage-1;
			moviePrev(moviePage);
		})	
	})	
	
	function movieNext(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText, type:1},
			url:"<c:url value='/mdaSearch.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".movieSearch").html(result.mdaSearch);		
			}
		})
	}
	function moviePrev(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText, type:1},
			url:"<c:url value='/mdaSearch.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".movieSearch").html(result.mdaSearch);		
			}
		})
	}
	
	/* 검색드라마 페이징 및 넘기기 */
	$(function(){
		$(".dramaNext").click(function(){
			if(dramatotal>dramaPage*block){
				dramaPage += 1;
			}
			dramaNext(dramaPage);
		})
		$(".dramaPrev").click(function(){
			dramaPage = dramaPage -1 < 1 ? 1:dramaPage-1;
			dramaPrev(dramaPage);
		})	
	})	
	
	function dramaNext(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText,type:2},
			url:"<c:url value='/mdaSearch.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".dramaSearch").html(result.mdaSearch);		
			}
		})
	}
	function dramaPrev(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText,type:2},
			url:"<c:url value='/mdaSearch.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".dramaSearch").html(result.mdaSearch);		
			}
		})
	}
	
	/* 검색광고 페이징 및 넘기기 */
	$(function(){
		$(".adNext").click(function(){
			if(adtotal>adPage*block){
				adPage += 1;
			}
			adNext(adPage);
		})
		$(".adPrev").click(function(){
			adPage = adPage -1 < 1 ? 1:adPage-1;
			adPrev(adPage);
		})	
	})	
	
	function adNext(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText,type:3},
			url:"<c:url value='/mdaSearch.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".adSearch").html(result.mdaSearch);		
			}
		})
	}
	function adPrev(currentPage){
		$.ajax({
			async:true,
			type:'POST',
			data:{currentPage:currentPage, searchText:searchText,type:3},
			url:"<c:url value='/mdaSearch.br?${_csrf.parameterName}=${_csrf.token}'/>",
			
			success:function(result){
				$(".adSearch").html(result.mdaSearch);		
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
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">${request} 검색 결과</h2>
									</header>
								</div>
							</div>
							
							<div class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
								<div class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 epjsYP">
									<div class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK" style="transform: translateX(0px);">
										<div class="Grid-zydj2q-0 cspjno">
											<div class="Row-s1apwm9x-0 lowZpE">
												<ul class="HorizontalUlWithContentPosterList__StyledHorizontalUlWithContentPosterList-rp5ukn-0 kVCLyu HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 fbzjBz VisualUl-s1vzev56-0 hgAYVH mainSearch">
													<c:forEach items="${searchMain}" var="result">
													<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
													<c:choose>
														<c:when test="${result.TYPE=='영화'}">
														<a href="/brw/movie/movieDetail.br?MOVIE_NO=${result.NO}">
														</c:when>
														<c:when test="${result.TYPE=='TV'}">
														<a href="/brw/drama/dramaDetail.br?DRAMA_NO=${result.NO}">
														</c:when>
														<c:otherwise>
														<a href="/brw/ad/adDetail.br?AD_NO=${result.NO}">
														</c:otherwise>
													</c:choose>
														<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
															<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																<img class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb" data-image-id="20" src="/brw/resources/images/${result.IMAGE}">
															</div>
														</div>
														<div class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
															<div class="SearchResultsSection__TopResultItemTitle-s1qazrkm-1 kBOijn">${result.NAME}</div>
															<div class="SearchResultsSection__TopResultItemExtraInfo-s1qazrkm-2 dGUMNT">${result.DATE} ・  ${result.GENRE}</div>
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
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD mainPrev"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh mainNext"></div>
								</div>
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						
						<!-- 영화 -->
						<c:if test="${searchMovie.size() != 0}">
						<section class="SectionWithHeader__Self-s1eyxltb-0 cVpbhx">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">영화</h2>
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
												<ul	class="SearchResultsSection__ResultStackableUl-s1qazrkm-4 gdjZVu StackableUl__StyledStackableUl-gafxvv-1 LNYRd VisualUl-s1vzev56-0 hgAYVH movieSearch">
													<c:forEach items="${searchMovie}" var="movie">
													<li class="StackableListItem-s18nuw36-0 cIJjio">
													<a lng="ko-KR" class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD" title="${request}" href="/brw/movie/movieDetail.br?MOVIE_NO=${movie.MOVIE_NO}">
														<div class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																<div class="LazyLoadingBackground-cgbyi4-0 cioRyq LazyLoadingBackgroundw__Self-s1stfhov-0 jXCeuY" alt="${request}">
																	<span class="LazyLoadingBackgroundw__BackgroundImage-s1stfhov-1 mPWPS" data-background-image-id="38">
																		<img class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni" src="/brw/resources/images/movie/poster/${movie.MOVIE_POSTER_IMAGE}"></span>
																</div>
															</div>
															<div class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																<div
																	class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																	<div
																		class="SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM">${movie.MOVIE_NAME}</div>
																	<div
																		class="SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ">${movie.MOVIE_DATE}・ ${movie.MOVIE_GENRE}</div>
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
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD moviePrev"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh movieNext"></div>
								</div>
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						</c:if>
						<!-- 영화 -->
						
						<!-- TV -->
						<c:if test="${searchDrama.size() != 0}">
						<section class="SectionWithHeader__Self-s1eyxltb-0 cVpbhx">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">TV</h2>
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
													class="SearchResultsSection__ResultStackableUl-s1qazrkm-4 gdjZVu StackableUl__StyledStackableUl-gafxvv-1 LNYRd VisualUl-s1vzev56-0 hgAYVH dramaSearch">
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
																		<img class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni" src="/brw/resources/images/drama/poster/${drama.DRAMA_POSTER_IMAGE}">
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
																		class="SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ">${drama.DRAMA_DATE} ・${drama.DRAMA_GENRE}</div>
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
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD dramaPrev"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh dramaNext"></div>
								</div>
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						</c:if>
						<!-- TV -->
						
						
						<!-- AD -->
						<c:if test="${searchAd.size() != 0}">
						<section class="SectionWithHeader__Self-s1eyxltb-0 cVpbhx">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">광고</h2>
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
													class="SearchResultsSection__ResultStackableUl-s1qazrkm-4 gdjZVu StackableUl__StyledStackableUl-gafxvv-1 LNYRd VisualUl-s1vzev56-0 hgAYVH adSearch">
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
																		<img class="LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni" src="/brw/resources/images/ad/poster${ad.AD_POSTER_IMAGE}"></span>
																</div>
															</div>
															<div
																class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																<div
																	class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																	<div
																		class="SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM">${ad.AD_NAME}</div>
																	<div
																		class="SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ">${ad.AD_READCOUNT} ・ ${ad.AD_COMPANY}</div>
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
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD adPrev"></div>
								</div>
								
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh adNext"></div>
								</div>
							</div>
							<hr	class="Divider__StylingMergedDivider-s11un6bw-1 kwWkAv Divider-s11un6bw-0 cVxSEp">
						</section>
						</c:if>
						<!-- AD -->
						
					</section>
				</section>
			</div>
		</div>
	</div>
	
</body>
</html>