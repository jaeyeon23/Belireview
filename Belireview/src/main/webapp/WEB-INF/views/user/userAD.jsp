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
		$('.vv').css('display',"none");
	})
	$(function(){
		$('.r1').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
				submenu.slideUp();
            }else{
            	submenu.slideDown();
            }
		})
		$('.r2').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r3').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r4').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r5').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r6').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r7').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r8').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r9').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
		$('.r10').click(function(){
			var submenu = $(this).find('.vv');
			if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
		})
	});
	
	$(function() {
		$('.all').click(function() {
			$('.all').removeClass('kSevvv').addClass('hyUMrr');
			$('.grade').removeClass('hyUMrr').addClass('kSevvv');
			$('.all_data').removeClass('cknbzg').addClass('hgPHZk');
			$('.grade_data').removeClass('hgPHZk').addClass('cknbzg');
		})
	})

	$(function() {
		$('.grade').click(function() {
			$('.grade').removeClass('kSevvv').addClass('hyUMrr');
			$('.all').removeClass('hyUMrr').addClass('kSevvv');
			$('.grade_data').removeClass('cknbzg').addClass('hgPHZk');
			$('.all_data').removeClass('hgPHZk').addClass('cknbzg');
		})
	})

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
											class="HeaderBackButton__TopLeftButton-s1sky4x3-0 lfxcSv HeaderCloseButton__TopLeftButton-odlno1-0 cLcmdI StylelessButton-phxvo7-0 gsSopE" onclick="history.go(-1)"></button>
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
								<li
									class="Tab__Self-oxzsyv-1 dwGsZW Tab__List-oxzsyv-0 hyUMrr all">전체</li>
								<li
									class="Tab__Self-oxzsyv-1 dwGsZW Tab__List-oxzsyv-0 kSevvv grade">점수별</li>
								
							</ul>
						</div>
					</div>
					<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
						<div class="HideableBlock__Self-ikumnu-0 hgPHZk all_data">
							<section class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
								<div class="Grid-zydj2q-0 cspjno">
									<div class="Row-s1apwm9x-0 lowZpE">
										<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH">
											<c:forEach items="${useradAll}" var="useradAll">
												<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
														<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
														<a href="/brw/ad/adDetail.br?AD_NO=${useradAll.AD_NO}">
															<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																	<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb"
																	src="${useradAll.AD_POSTER_IMAGE}">
															</div>
														</div>
														<div class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
															<div
																class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW">${useradAll.AD_NAME}</div></a>
															<div
																class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★${useradAll.AD_AVG_GRADE}</div>
															<div
																class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl GRADE">★${useradAll.AL_GRADE}</div>
																
														</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
							</section>
						</div>
						</section>
				
						
						<!-- 점수별 -->
						<div class="HideableBlock__Self-ikumnu-0 cknbzg grade_data">
							<section class="ArchiveRatingsPage__ByRatingSections-s1ojhyk5-1 fmQknq">
								<c:forEach  var="i" begin="1" end="10" step="1" varStatus="stat">
									<c:set var="rating" value="${((10-i)*0.5)+0.5}"></c:set>
								<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO r${i}"><!-- 5점 -->
									<div class="Grid-zydj2q-0 cspjno">
										<div class="Row-s1apwm9x-0 lowZpE">
											<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
												<h3 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">${rating}점 준 광고 </h3>
												<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"> <!-- 5.0준 영화 개수 -->
												</span>
											</header>
										</div>
									</div>
									<div class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
										<section class="SectionWithShrinkHeaderAndTabs__TabContentsContainer-tt2x7j-0 dnkVDn">
											<div class="HideableBlock__Self-ikumnu-0 hgPHZk">
												<section	class="ArchiveRatingsPage__AllSection-s1ojhyk5-0 fMnTHB">
													<div class="Grid-zydj2q-0 cspjno">
														<div class="Row-s1apwm9x-0 lowZpE">
															<ul class="ContentGrid__ContentGridUsedInArchive-x2fbsz-1 gScTqD ContentGrid-x2fbsz-0 cwhjMF VisualUl-s1vzev56-0 hgAYVH vv rr${i}">
																<c:forEach items="${useradAll}" var="useradAll">
																	 <c:if test="${useradAll.AL_GRADE == rating}">  
																<li class="ContentListItemWithPoster__Self-swai1z-0 hKRvvO">
																	
																		<div class="ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ">
																		<a href="/brw/ad/adDetail.br?AD_NO=${useradAll.AD_NO}">
																			<div class="LazyLoadingImg__Self-s1jb87ps-0 csJkbb">
																				<img class="LazyLoadingImg__Image-s1jb87ps-1 csJkbb"
																					src="${useradAll.AD_POSTER_IMAGE}">
																			</div>
																		</div>
																		<div class="ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy">
																			<div class="ContentListItemWithPoster__ContentTitle-swai1z-3 dXMJZW">${useradAll.AD_NAME}</div></a>
																			<div class="ContentListItemWithPoster__ContentRating-swai1z-4 jYxobl">★${useradAll.AD_AVG_GRADE}</div>
																		</div> 
															
																</li>
																 </c:if> 
																</c:forEach>
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
								</section><!-- 5점 -->
								</c:forEach>
								</section>
							</div>
					</section>
					</div>
		</div>
	</div>
</body>
</html>