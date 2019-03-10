<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<link href="/brw/resources/Jcss/user.css" rel="stylesheet">    
</head>
<body>
		<div class="UserPage__Container-s1uda3mb-1 MccqW">
			<div class="MaxWidthGrid-s193eej0-0 hgjwgN">
				<div class="RoundedCornerBlock-s17n38ib-0 fkoUiJ">
					<section class="UserPage__MyPage-s1uda3mb-2 XAfXh">
						<div class="UserPage__WallPaper-s1uda3mb-3 jIGVCN">
							<a class="UserPage__CptButtonContainer-s1uda3mb-21 dPHYWi StylelessHref-s54tapo-0 bPfYRm"
								href="userModifyPass.br">회원 정보 수정
								<span class="UserPage__CptIcon-s1uda3mb-22 kRnoRE"></span>
							</a>
						</div>
						<div class="Grid-zydj2q-0 cspjno">
							<div class="Row-s1apwm9x-0 lowZpE">
								<header class="UserPage__ProfileHeader-s1uda3mb-4 hLoozo">
									<div class="ProfilePhoto__Self-s1v3isfu-1 khVLwR RoundedImageBlock-k5m4n5-0 gUZYtN">
									<c:if test="${sessionScope.PROFILE_IMAGE == null }">
                                          <img src="/brw/resources/images/Temporary_img.JPG" alt="bag" width="130%" height="130%" >
                                    </c:if>
                                    <c:if test="${sessionScope.PROFILE_IMAGE != null }">
                                          <img src="/brw/resources/images/${sessionScope.PROFILE_IMAGE}" alt="bag" width="100%" height="100%" >
                                    </c:if>
									</div>
									<div class="UserPage__NameBlock-s1uda3mb-5 ircOdU">
										<h1 class="UserPage__Name-s1uda3mb-6 bBzugj">
											${sessionScope.NAME} 님
										</h1> 
									</div>
									<div class="UserPage__AboutMe-s1uda3mb-8 jxRxZJ">
										<div class="TextTruncate__Self-wvv1uj-0 laNFWG">
											<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
												style="white-space: pre-line;">빌리뷰 시작일 : 겸사겸사 채워넣기</div>
										</div>
									</div>
								</header>
							</div>
							<div class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
								<div class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 epjsYP">
									<div class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK">
										<div class="Row-s1apwm9x-0 lowZpE">
											<ul class="UserPage__CategoryArchivesUl-s1uda3mb-11 bMIvQx HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 fbzjBz VisualUl-s1vzev56-0 hgAYVH">
												<li class="UserPage__CategoryArchivesListItem-s1uda3mb-12 haIrVX HorizontalListItem-tt0z2b-0 hRbPKu">
													<a lng="ko-KR" class="UserPage__CategoryArchivesLink-s1uda3mb-13 hVVlOn" background="[object Object]"
														href="/ko-KR/users/ZBm5Rj7y645d4/contents/movies">
														<ul	class="UserPage__CategoryArchives-s1uda3mb-14 euCuQb VisualUl-s1vzev56-0 hgAYVH">
															<li class="UserPage__CategoryArchivesName-s1uda3mb-15 bcgVAG">영화</li>
															<li class="UserPage__CategoryArchivesRatedCount-s1uda3mb-16 hgxhwm">★<!-- -->0</li>
															<li class="UserPage__CategoryArchivesWishedCount-s1uda3mb-17 ejKSYx">좋아요<strong>0</strong></li>
														</ul>
													</a>
												</li>
												<li class="UserPage__CategoryArchivesListItem-s1uda3mb-12 haIrVX HorizontalListItem-tt0z2b-0 hRbPKu">
													<a lng="ko-KR" class="UserPage__CategoryArchivesLink-s1uda3mb-13 grPhHT" background="[object Object]"
														href="/ko-KR/users/ZBm5Rj7y645d4/contents/tv_seasons">
												 	<ul class="UserPage__CategoryArchives-s1uda3mb-14 bEvUuy VisualUl-s1vzev56-0 hgAYVH">
															<li class="UserPage__CategoryArchivesName-s1uda3mb-15 bcgVAG">드라마</li>
															<li class="UserPage__CategoryArchivesRatedCount-s1uda3mb-16 hgxhwm">★<!-- -->0</li>
															<li class="UserPage__CategoryArchivesWishedCount-s1uda3mb-17 ejKSYx">좋아요<strong>0</strong></li>
													</ul>
													</a>
												</li>
												<li	class="UserPage__CategoryArchivesListItem-s1uda3mb-12 haIrVX HorizontalListItem-tt0z2b-0 hRbPKu">
													<a	lng="ko-KR"	class="UserPage__CategoryArchivesLink-s1uda3mb-13 cKYVzh"
													background="[object Object]" href="/ko-KR/users/ZBm5Rj7y645d4/contents/books">
													 <ul class="UserPage__CategoryArchives-s1uda3mb-14 iqxyWB VisualUl-s1vzev56-0 hgAYVH">
															<li	class="UserPage__CategoryArchivesName-s1uda3mb-15 bcgVAG">광고</li>
															<li	class="UserPage__CategoryArchivesRatedCount-s1uda3mb-16 hgxhwm">★<!-- -->0</li>
															<li	class="UserPage__CategoryArchivesWishedCount-s1uda3mb-17 ejKSYx">좋아요<strong>0</strong></li>
													 </ul>
													 </a>
												</li>
												<div class="SpinnerContainer__Self-s16nvp7b-0 dvymnj"></div>
											</ul>
										</div>
									</div>
								</div>
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 kCjzvu" direction="left">
									<div class="PrimitiveHorizontalScrollable__BackwardButton-hy4esm-5 bWflCD"></div>
								</div>
								<div class="arrow_button PrimitiveHorizontalScrollable__ArrowButtonBlock-hy4esm-3 dllGvg" direction="right">
									<div class="PrimitiveHorizontalScrollable__ForwardButton-hy4esm-4 cfipNh"></div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
</body>
</html>
