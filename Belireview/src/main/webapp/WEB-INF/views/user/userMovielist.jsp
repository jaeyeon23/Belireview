<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="/brw/resources/css/user_ratings.css" rel="stylesheet">    
<title>Insert title here</title>

<script>
	$(function(){
		$('.b').click(function(){
			$('.b').removeClass('kSevvv').addClass('hyUMrr');
			$('.a').removeClass('hyUMrr').addClass('kSevvv');
			$('.c').removeClass('cknbzg').addClass('hgPHZk');
			$('.d').removeClass('hgPHZk').addClass('cknbzg');
		})
	}
	)
	
	$(function(){
		$('.a').click(function(){
			$('.b').removeClass('hyUMrr').addClass('kSevvv');
			$('.a').removeClass('kSevvv').addClass('hyUMrr');
			$('.d').removeClass('cknbzg').addClass('hgPHZk');
			$('.c').removeClass('hgPHZk').addClass('cknbzg');
		})
	}
	)
</script>
</head>

<body>
	<div id="root">
		<div class="App__Self-m1g4ja-0 iBpXSE">
			<div class="NavTabManager__NavContainer-dbid0l-0 hhxQev">
				<section class="NavTabManager__Main-dbid0l-1 ikHAvF">
					<div
						class="SectionWithHeaderAndTabs__HeaderContainer-s1yrzzr-1 ikHKKR">
						<div class="SectionWithHeaderAndTabs__Header-s1yrzzr-2 eQWXwX">
							<header
								class="ShrinkHeaderBar__Self-kl2m8-0 jVwLYV HeaderBarPrimitive-s1yem7n2-0 iKUsMl">
								<div class="ShrinkHeaderBar__Buttons-kl2m8-1 gvGpvr">
									<div class="ShrinkHeaderBar__LeftButtons-kl2m8-5 dPdGEs">
										<button
											class="HeaderBackButton__TopLeftButton-s1sky4x3-0 lfxcSv HeaderCloseButton__TopLeftButton-odlno1-0 cLcmdI StylelessButton-phxvo7-0 gsSopE"></button>
									</div>
									<div class="ShrinkHeaderBar__RightButtons-kl2m8-6 kuosGj"></div>
								</div>
								<div class="ShrinkHeaderBar__LargeTitleBlock-kl2m8-2 VaXBb">
									<div class="ShrinkHeaderBar__LargeTitle-kl2m8-3 hwiyxo">평가한
										작품들</div>
								</div>
								<div class="ShrinkHeaderBar__SmallTitle-kl2m8-4 dCruGS">평가한
									작품들</div>
							</header>
							<ul
								class="SectionWithHeaderAndTabs__TabsUl-s1yrzzr-0 bZUEQn VisualUl-s1vzev56-0 hgAYVH">
								<li class="Tab__Self-oxzsyv-1 dwGsZW Tab__List-oxzsyv-0 hyUMrr a">전체</li>
								<li class="Tab__Self-oxzsyv-1 dwGsZW Tab__List-oxzsyv-0 kSevvv b">점수별</li>
							</ul>
						</div>
					</div>
					<section
						class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
						<div class="HideableBlock__Self-ikumnu-0 hgPHZk d">
							<section class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
								<div class="Grid-zydj2q-0 cspjno">
									<div class="Row-s1apwm9x-0 lowZpE">
										<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
										<c:forEach items="${userMovieAll}" var="userMovieAll" >
											<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO"><a
												lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
												href="/ko-KR/contents/mdKBRkR"><div
														class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
														<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
															<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb"
																data-image-id="1"
																src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
														</div>
													</div>
													<div
														class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
														<div
															class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW">${userMovieAll.MOVIE_NAME}</div>
														<div
															class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★${userMovieAll.MOVIE_GRADE}</div>
													</div></a></li>
										</c:forEach>
										</ul>
									</div>
								</div>
								<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
							</section>
						</div>
					<!-- 점수별 -->
						<div class="HideableBlock__Self-ikumnu-0 cknbzg c">
							<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">5.0점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 5.0준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">4.5점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 4.5준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">4.0점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 4.0준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">3.5점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 3.5준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">3.0점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 3.0준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">2.5점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 2.5준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">2.0점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 2.0준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">1.5점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 1.5준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">1.0점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 1.0준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
								<section
								class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">0.5점 준 영화</h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 0.5준 영화 개수 --></span>
												<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
													<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
														<a lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26/contents/movies/ratings/10">더보기</a>
													</div>
												</div>
											</header>
										</div>
									</div>
									<div
										class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk c">
												<section
													class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
																
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																<a lng="ko-KR" title="배트맨 대 슈퍼맨: 저스티스의 시작"
																	href="/ko-KR/contents/mdKBRkR">
																	<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb" data-image-id="1" 
																				src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466152598/nzclx33kbkeecgvtl7ms.jpg">
																			</div>
																		</div>
																		<div
																			class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div
																				class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW"></div>
																			<div
																				class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★</div>
																		</div></a></li>
															</ul>
														</div>
													</div>
													<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
												</section>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
												direction="left">
												<div
													class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
											</div>
											<div
												class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg"
												direction="right">
												<div
													class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
											</div>
									</div>
									<hr
										class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								</section>
							</section>
						</div>
					</section>
				</section>
				<footer class="BottomNavTab__Self-s4qy030-0 enKJRs">
					<nav class="BottomNavTab__Nav-s4qy030-1 cYcXMw">
						<ul
							class="BottomNavTab__NavTabUl-s4qy030-2 dXUUJN VisualUl-s1vzev56-0 hgAYVH">
							<li class="BottomNavTabItem__NavTabItem-s3ngus-0 cuUxyj"><a
								lng="ko-KR" href="/ko-KR"><svg
										class="IcTabHome__IcTabHomeSvg-l3yg5u-0 eAmlne" fill="#ff2f6e"
										width="28" height="28" viewBox="0 0 24 24">
										<g fill="none">
										<path d="M0 0h24v24H0z"></path>
										<path class="fillTarget" fill="#A0A0A0"
											d="M15.333 17.037c0-1.828-1.492-3.31-3.333-3.31-1.84 0-3.333 1.482-3.333 3.31v3.636a.5.5 0 0 0 .5.5h5.666a.5.5 0 0 0 .5-.5v-3.636zM3.154 9.077l7-5.463a3 3 0 0 1 3.692 0l7 5.462A3 3 0 0 1 22 11.442V21.5a.5.5 0 0 1-.5.5h-19a.5.5 0 0 1-.5-.5V11.442a3 3 0 0 1 1.154-2.366z"></path></g></svg>
									<div class="BottomNavTabItem__TabName-s3ngus-1 fkatbi">홈</div></a></li>
							<li class="BottomNavTabItem__NavTabItem-s3ngus-0 cuUxyj"><a
								lng="ko-KR" href="/ko-KR/review"><svg
										class="IcTabRate__IcTabRateSvg-s14weq8i-0 kbdfGI"
										xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
										fill="#a0a0a0" width="28" height="28">
										<g fill="none">
										<path class="fillTarget" fill="#C3C3C3"
											d="M12 18.073L6.263 22.26c-.673.491-1.579-.168-1.32-.959l2.21-6.75-5.756-4.161c-.674-.488-.327-1.554.505-1.552l7.102.016 2.18-6.76c.255-.792 1.376-.792 1.631 0l2.18 6.76 7.102-.016c.832-.002 1.179 1.064.505 1.552l-5.756 4.162 2.21 6.75c.259.79-.647 1.45-1.32.958L12 18.073z"></path></g></svg>
									<div class="BottomNavTabItem__TabName-s3ngus-1 dlSxZx">평가하기</div></a></li>
							<li class="BottomNavTabItem__NavTabItem-s3ngus-0 cuUxyj"><a
								lng="ko-KR" href="/ko-KR/users/zNM5NAwr22v26"><svg
										class="IcTabMyPage__IcTabMyPageSvg-s1htv7sk-0 ajGhs"
										fill="#a0a0a0" width="28" height="28" viewBox="0 0 24 24">
										<g fill="none">
										<path d="M0 0h24v24H0z"></path>
										<path class="fillTarget" fill="#A0A0A0"
											d="M22 19.522V21.5a.5.5 0 0 1-.5.5h-19a.5.5 0 0 1-.5-.5v-1.978a5.783 5.783 0 0 1 5.783-5.783h8.434A5.783 5.783 0 0 1 22 19.522zM12 11.26c-2.301 0-4.167-1.85-4.167-4.13C7.833 4.848 9.7 3 12 3c2.301 0 4.167 1.85 4.167 4.13 0 2.282-1.866 4.13-4.167 4.13z"></path></g></svg>
									<div class="BottomNavTabItem__TabName-s3ngus-1 dlSxZx">마이페이지</div></a></li>
						</ul>
					</nav>
				</footer>
			</div>
		</div>
	</div>

</body>
</body>
</html>