<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/brw/resources/css/userList.css">
</head>
<body>
	<div id="root">
		<div class="App__Self-m1g4ja-0 iBpXSE">
			<div class="NavTabManager__NavContainer-dbid0l-0 hhxQev">
				<section class="NavTabManager__Main-dbid0l-1 ikHAvF">
					<section class="SectionWithShrinkHeaderBar__Self-s5xd6pi-0 bvFHSl">
						<header
							class="ShrinkHeaderBar__Self-kl2m8-0 ihFsHc HeaderBarPrimitive-s1yem7n2-0 iKUsMl">
							<div class="ShrinkHeaderBar__Buttons-kl2m8-1 gvGpvr">
								<div class="ShrinkHeaderBar__LeftButtons-kl2m8-5 dPdGEs">
									<button
										class="HeaderBackButton__TopLeftButton-s1sky4x3-0 lfxcSv HeaderCloseButton__TopLeftButton-odlno1-0 cLcmdI StylelessButton-phxvo7-0 gsSopE"></button>
								</div>
								<div class="ShrinkHeaderBar__RightButtons-kl2m8-6 kuosGj"></div>
							</div>
							<div class="ShrinkHeaderBar__LargeTitleBlock-kl2m8-2 VaXBb">
								<div class="ShrinkHeaderBar__LargeTitle-kl2m8-3 hwiyxo">영화</div>
							</div>
							<div class="ShrinkHeaderBar__SmallTitle-kl2m8-4 dCruGS">영화</div>
						</header>
						<section class="SectionWithHeader__Self-s1eyxltb-0 cKOKeW">
							<div class="Grid-zydj2q-0 cspjno">
								<div class="Row-s1apwm9x-0 lowZpE">
									<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
										<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">평가</h2>
										<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl">74</span>
										<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
											<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
												<a lng="ko-KR"
													href="/brw/user/userMovielist.br">더보기</a>
											</div>
										</div>
									</header>
								</div>
							</div>
							<div class="Grid-zydj2q-0 cspjno">
								<div
									class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
								
									<div class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 epjsYP">
										<div class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK">
											
											<div class="Row-s1apwm9x-0 lowZpE">
												
												<ul class="HorizontalUlWithContentPosterList__StyledHorizontalUlWithContentPosterList-rp5ukn-0 kVCLyu HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 fbzjBz VisualUl-s1vzev56-0 hgAYVH">
												<c:forEach items="${userList}" var="movielist" >
													<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO"><a lng="ko-KR" title="사바하" href="/ko-KR/contents/mOAZGJQ">
														<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																	<img class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb" src="/brw/resources/images/3-girls.jpg">
																</div>
															</div>
															<div class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																<div class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW">${movielist.MOVIE_NAME}</div>
																<div class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★${movielist.MOVIE_GRADE}</div>
															</div></a></li>
													<div class="SpinnerContainer__Self-s16nvp7b-0 dvymnj"></div>
													</c:forEach>	
												</ul>
												
											</div>
													
										</div>
									</div>
								
									<div
										class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu"
										direction="left">
										<div
											class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
									</div>
									<div
										class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 eweFwK"
										direction="right">
									</div>
								</div>
								<hr
									class="Divider__StylingMergedDivider-s11un6bw-1 boBaEC Divider-s11un6bw-0 cVxSEp">
								<div class="Row-s1apwm9x-0 lowZpE">
									<ul
										class="ArchivesPage__ArchivesByActionUl-s1wwx98n-0 ilkORL VisualUl-s1vzev56-0 hgAYVH">
										<li
											class="BasicList__Self-s1u6a09d-0 kvzwum TextListItem-s1ihj0qz-0 joaJwm"><div
												class="BasicList__Inner-s1u6a09d-1 diMgCn">
												<div class="BasicList__Title-s1u6a09d-2 fgolVx">
													<a lng="ko-KR"
														class="ArchivesPage__ArchivesActionListLink-s1wwx98n-2 giDjCr StylelessLocalLink-s1aqpmgk-1 gdyQIs"
														href="/ko-KR/users/zNM5NAwr22v26/contents/movies/wishes">보고싶어요<span
														class="ArchivesPage__ArchivesByActionCount-s1wwx98n-1 kyAwBf">43</span></a>
												</div>
												<div class="BasicList__Extra-s1u6a09d-3 dAxqVw"></div>
											</div></li>
									
									</ul>
								</div>
							</div>
						</section>
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


	<script>
        window.ga=function(){ga.q.push(arguments)};ga.q=[];ga.l=+new Date;
        ga("create","UA-27006241-7","auto");
      </script>


	<script src="https://browser.sentry-cdn.com/4.6.4/bundle.min.js"
		crossorigin="anonymous"></script>



	<script
		src="https://d2rlq84xifqisi.cloudfront.net/javascripts/web.9f7fa479dc526cbedf18.js"
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

	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
			<div>
				<iframe name="fb_xdm_frame_https" frameborder="0"
					allowtransparency="true" allowfullscreen="true" scrolling="no"
					allow="encrypted-media" id="fb_xdm_frame_https" aria-hidden="true"
					title="Facebook Cross Domain Communication Frame" tabindex="-1"
					src="https://staticxx.facebook.com/connect/xd_arbiter/r/vy-MhgbfL4v.js?version=44#channel=f392b7a570d6f2c&amp;origin=https%3A%2F%2Fwatcha.com"
					style="border: none;"></iframe>
			</div>
		</div>
	</div>
</body>
</html>