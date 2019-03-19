<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/brw/resources/css/info.css">
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
										class="HeaderBackButton__TopLeftButton-s1sky4x3-0 lfxcSv HeaderCloseButton__TopLeftButton-odlno1-0 cLcmdI StylelessButton-phxvo7-0 gsSopE" 
										onclick="location.href='/brw/drama/dramaDetail.br?DRAMA_NO=${map.DRAMA_NO}&DRAMA_NAME=${map.DRAMA_NAME}'"></button>
								</div>
								<div class="ShrinkHeaderBar__RightButtons-kl2m8-6 kuosGj"></div>
							</div>
							<div class="ShrinkHeaderBar__LargeTitleBlock-kl2m8-2 VaXBb">
								<div class="ShrinkHeaderBar__LargeTitle-kl2m8-3 hwiyxo">기본
									정보</div>
							</div>
							<div class="ShrinkHeaderBar__SmallTitle-kl2m8-4 dCruGS">기본
								정보</div>
						</header>
						<!--  -->
						
						<!--  -->
						<div class="Grid-zydj2q-0 cspjno">
							<div class="Row-s1apwm9x-0 lowZpE">
								<ul
									class="ContentOverviewPage__DescriptionUl-s3r5qer-0 clVeys VisualUl-s1vzev56-0 hgAYVH">
									<dl class="ContentOverviewPage__DescriptionList-s3r5qer-1 jnXdZY">
										<dt
											class="ContentOverviewPage__DescriptionTitle-s3r5qer-2 dYypmT">원제</dt>
										<dd
											class="ContentOverviewPage__DescriptionDetail-s3r5qer-3 lkqwKE">${map.DRAMA_NAME}</dd>
									</dl>
									<dl class="ContentOverviewPage__DescriptionList-s3r5qer-1 jnXdZY">
										<dt
											class="ContentOverviewPage__DescriptionTitle-s3r5qer-2 dYypmT">제작
											연도</dt>
										<dd
											class="ContentOverviewPage__DescriptionDetail-s3r5qer-3 lkqwKE">${map.DRAMA_DATE}</dd>
									</dl>
									<dl class="ContentOverviewPage__DescriptionList-s3r5qer-1 jnXdZY">
										<dt
											class="ContentOverviewPage__DescriptionTitle-s3r5qer-2 dYypmT">채널</dt>
										<dd
											class="ContentOverviewPage__DescriptionDetail-s3r5qer-3 lkqwKE">${map.DRAMA_CHANNEL}</dd>
									</dl>
									<dl class="ContentOverviewPage__DescriptionList-s3r5qer-1 jnXdZY">
										<dt
											class="ContentOverviewPage__DescriptionTitle-s3r5qer-2 dYypmT">장르</dt>
										<dd
											class="ContentOverviewPage__DescriptionDetail-s3r5qer-3 lkqwKE">${map.DRAMA_GENRE}</dd>
									</dl>
									<dl
										class="ContentOverviewPage__DescriptionList-s3r5qer-1 jnXdZY">
										<dt
											class="ContentOverviewPage__DescriptionTitle-s3r5qer-2 dYypmT">몇부작</dt>
										<dd
											class="ContentOverviewPage__DescriptionDetail-s3r5qer-3 lkqwKE">${map.DRAMA_EPISODE}부작</dd>
									</dl>
									<dl class="ContentOverviewPage__DescriptionList-s3r5qer-1 knqOhM">
										<dt
											class="ContentOverviewPage__DescriptionTitle-s3r5qer-2 dYypmT">내용</dt>
										<dd
											class="ContentOverviewPage__SummaryDetail-s3r5qer-4 jrdcaY">${map.DRAMA_CONTENT}</dd>
									</dl>
								</ul>
							</div>
						</div>
					</section>
				</section>
			</div>
			</div>
			</div>
</body>
</html>