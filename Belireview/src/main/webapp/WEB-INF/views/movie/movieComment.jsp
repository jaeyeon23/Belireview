<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/brw/resources/css/comment.css">
<script>
	var like= "${likeList}".split(","); 
	var id="${ID}";
	$(function(){ 
		if(id==""||id==null){//비로그인
			$(".like").click(function(){//좋아요
				alert("로그인 해주세요.");
				location.href="<c:url value='/member/loginForm.br?${_csrf.parameterName}=${_csrf.token}' />"
				});
		
		}else{//로그인
			$(document).on("click",'.like',function(){//좋아요
				var cla = $(this).attr('class').split(" ")[5];
				commentlike(cla);
				return;
			});
			if(like==""||like==null){
				$(".like").html("좋아요")
			}else{
				for(var i=0;i<like.length;i++){
					var tmp = like[i].replace("[","").replace("]","").trim();
					$("."+tmp).html("좋아요취소");
				}
			} 
		}
	});
	function commentlike(cla){
		$.ajax({
			async : true,  
			type : 'POST',
			data : {ID:id , COMMENTLIKE:"c" ,CLA:cla , MOVIE_NO:<%=request.getParameter("MOVIE_NO")%>, MC_NO:$(".00"+cla).val()},
			url:"<c:url value='/movie/movieComment.br?${_csrf.parameterName}=${_csrf.token}' />",
			success : function(result){
					var r = result;
					var clike = "좋아요취소";
					var cnolike =  "좋아요";
					if(r.add){
						$('.'+r.CLA).html(clike);
					}
					if(r.subtract){
						$('.'+r.CLA).html(cnolike);
					}
					$('.0'+r.CLA).html(result.MC_LIKE);
			}
		})
	}
	function orderby(url) {
		$.ajax({
			type : 'POST',
			data : {ID:id,MOVIE_NO:<%=request.getParameter("MOVIE_NO")%>,orderby:$('#orderby').val()},
			url:url,
			success : function(result){
				$('.comen').html(result.commentList);
				var likeList = result.likeList;
				if(likeList.length != 0){
					for(var i=0;i<likeList.length;i++){
						$("."+likeList[i]).html("좋아요취소");
					}					
				}
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
					<section class="SectionWithShrinkHeaderBar__Self-s5xd6pi-0 bvFHSl">
						<header
							class="ShrinkHeaderBar__Self-kl2m8-0 ihFsHc HeaderBarPrimitive-s1yem7n2-0 iKUsMl">
							<div class="ShrinkHeaderBar__Buttons-kl2m8-1 gvGpvr">
								<div class="ShrinkHeaderBar__LeftButtons-kl2m8-5 dPdGEs">
									<button class="HeaderBackButton__TopLeftButton-s1sky4x3-0 lfxcSv HeaderCloseButton__TopLeftButton-odlno1-0 cLcmdI StylelessButton-phxvo7-0 gsSopE" onclick="history.go(-1)"></button>
								</div>
								<div class="ShrinkHeaderBar__RightButtons-kl2m8-6 kuosGj"></div>
							</div>
							<div class="ShrinkHeaderBar__LargeTitleBlock-kl2m8-2 VaXBb">
								<div class="ShrinkHeaderBar__LargeTitle-kl2m8-3 hwiyxo">코멘트</div>
								<div style="float: right; width: 20%;" onchange="orderby('/brw/movie/movieComment.br?${_csrf.parameterName}=${_csrf.token}')">
									<select id="orderby" name="orderby" class="form-control">
										<option value="">----</option>
										<option value="1">좋아요순</option>
										<option value="2">최신순</option>
									</select>
								</div>
							</div>
							<div class="ShrinkHeaderBar__SmallTitle-kl2m8-4 dCruGS">코멘트</div>
						</header>
						<div class="Grid-zydj2q-0 cspjno">
							<div class="Row-s1apwm9x-0 lowZpE">
								<div class="ContentCommentsPage__CommentLists-s9miehw-0 bMVaMG">
									<ul class="VisualUl-s1vzev56-0 hgAYVH comen">
									<c:forEach items="${moviecomment}" var="moviecommentlist" varStatus="stat"><!-- 시작 -->
										<div class="BasicCommentItem__Comment-iqy0k7-0 iNWJNm">
											<div class="BasicCommentItem__TitleContainer-iqy0k7-1 jWsgqF">
												<div class="BasicCommentItem__ProfileBlock-iqy0k7-2 dFeRwI">
														<div class="ProfilePhoto__Self-s1v3isfu-1 lniNjX RoundedImageBlock-k5m4n5-0 gUZYtN">
															<div class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 kgJrze"></div>
															<div class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																<c:if test="${moviecommentlist.PROFILE_IMAGE!=null}">
																	<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx" 
																		src="/brw/resources/images/user_profile/${moviecommentlist.PROFILE_IMAGE}">
																</c:if>
																<c:if test="${moviecommentlist.PROFILE_IMAGE==null}">
																	<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx" 
																		src="/brw/resources/images/ican/no_pro.png">
																</c:if>
															</div>
														</div>
														<div class="UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ">
															${moviecommentlist.NAME}
															<input type="hidden" value="${moviecommentlist.MC_NO}" class="00like${stat.index}"/>
															<span class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF"
																src="/brw/resources/images/detail/detail_comment1.svg"></span><span
																class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv"
																src="/brw/resources/images/detail/detail_comment2.svg"></span>
														</div>
												</div>
												<div class="BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP">
													<img src="/brw/resources/images/detail/detail_comment_grade.svg"
														width="16px" height="16px" alt="star"><span>${moviecommentlist.ML_GRADE}</span>
												</div>
											</div>
											<div class="BasicCommentItem__TextBlock-iqy0k7-3 gVqTAw">
												<div class="ContentlessCommentItem__Text-s1n6rtl6-0 eMbWQD">${moviecommentlist.MC_CONTENT}</div>
											</div>
											<div class="ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd">
												<span class="ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD" src="/brw/resources/images/detail/detail_like.svg"
													width="18px" height="18px"></span><em class="0like${stat.index}">${moviecommentlist.MC_LIKE}</em>
											</div>
											<div class="ContentlessCommentItem__UserActionBlock-s1n6rtl6-4 kJvkpH">
												<button class="ContentlessCommentItem__UserActionButton-s1n6rtl6-5 kRhZsb StylelessButton-phxvo7-0 gsSopE like like${stat.index}">좋아요</button>
											</div>
										</div>
										<div class="PrimitiveInfinityScroll__Self-abb99t-0 iMsRxa"></div>
										</c:forEach><!-- 끝 -->
									</ul>
								</div>
							</div>
						</div>
					</section>
				</section>
			</div>
		</div>
	</div>

	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
			<div>
				<iframe name="fb_xdm_frame_https" frameborder="0"
					allowtransparency="true" allowfullscreen="true" scrolling="no"
					allow="encrypted-media" id="fb_xdm_frame_https" aria-hidden="true"
					title="Facebook Cross Domain Communication Frame" tabindex="-1"
					src="https://staticxx.facebook.com/connect/xd_arbiter/r/vy-MhgbfL4v.js?version=44#channel=f2994a59506ece4&amp;origin=https%3A%2F%2Fwatcha.com"
					style="border: none;"></iframe>
			</div>
		</div>
	</div>
</body>
</html>