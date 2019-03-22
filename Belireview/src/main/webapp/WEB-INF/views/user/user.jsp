<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 .del_link {
		color:grey;
		float:right;
}
</style>
<meta charset="UTF-8">
 	<link href="/brw/resources/Jcss/user.css" rel="stylesheet">    
 	
  <!--   <script src="/brw/resources/js/jquery-1.4.4.min.js"></script>
   -->  
  <style type="text/css">
#pro_mus:hover {
	cursor: pointer;
}


/* 파일 업로드 css */
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #3b8686;  /* 버튼색 */
	cursor: pointer;
	border: 1px solid #3b8686;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox label:hover {
	background-color: #2f6363;
}

.filebox label:active {
	background-color: #367c36;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#btns input[type="button"] {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #BDBDBD;  /* 버튼색 */
	cursor: pointer;
	border: 1px solid #BDBDBD;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}
</style>
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
									<div class="ProfilePhoto__Self-s1v3isfu-1 khVLwR RoundedImageBlock-k5m4n5-0 gUZYtN" data-toggle="modal" data-target="#myModal" id="pro_mus">
									<c:if test="${sessionScope.PROFILE_IMAGE == null }">
                                          <img src="/brw/resources/images/ican/no_pro.png" alt="bag" width="130%" height="130%" >
                                    </c:if>
                                    <c:if test="${sessionScope.PROFILE_IMAGE != null }">
                                          <img src="/brw/resources/images/user_profile/${sessionScope.PROFILE_IMAGE}" alt="bag" width="100%" height="100%" >
                                    </c:if>
									</div>
										<img src="/brw/resources/images/ican/set_ups.JPG" width="20" height="20" style="position:relative; border-radius:170px; margin-left:40px; margin-top:-20px;" data-toggle="modal"  id="pro_mus" data-target="#myModal" >
									<div class="UserPage__NameBlock-s1uda3mb-5 ircOdU">
										<h1 class="UserPage__Name-s1uda3mb-6 bBzugj">
											${sessionScope.NAME} 님
										</h1> 
									</div>
									<div class="UserPage__AboutMe-s1uda3mb-8 jxRxZJ">
										<div class="TextTruncate__Self-wvv1uj-0 laNFWG">
											<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
												style="white-space: pre-line;">보유포인트</div>
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
														href="/brw/user/userMovie.br?ID=${sessionScope.ID}">
														<ul	class="UserPage__CategoryArchives-s1uda3mb-14 euCuQb VisualUl-s1vzev56-0 hgAYVH">
															<li class="UserPage__CategoryArchivesName-s1uda3mb-15 bcgVAG">영화</li>
															<li class="UserPage__CategoryArchivesRatedCount-s1uda3mb-16 hgxhwm">★${totalCountM}</li>
															<li class="UserPage__CategoryArchivesWishedCount-s1uda3mb-17 ejKSYx">보고싶어요<strong>&nbsp;${totalMyMovieLike}</strong></li>
														</ul>
													</a>
												</li>
												<li class="UserPage__CategoryArchivesListItem-s1uda3mb-12 haIrVX HorizontalListItem-tt0z2b-0 hRbPKu">
													<a lng="ko-KR" class="UserPage__CategoryArchivesLink-s1uda3mb-13 grPhHT" background="[object Object]"
														href="/brw/user/userDrama.br?ID=${sessionScope.ID}">
												 	<ul class="UserPage__CategoryArchives-s1uda3mb-14 bEvUuy VisualUl-s1vzev56-0 hgAYVH">
															<li class="UserPage__CategoryArchivesName-s1uda3mb-15 bcgVAG">드라마</li>
															<li class="UserPage__CategoryArchivesRatedCount-s1uda3mb-16 hgxhwm">★${totalCountD}</li>
															<li class="UserPage__CategoryArchivesWishedCount-s1uda3mb-17 ejKSYx">보고싶어요<strong>&nbsp;${totalMyDramaLike}</strong></li>
													</ul>
													</a>
												</li>
												<li	class="UserPage__CategoryArchivesListItem-s1uda3mb-12 haIrVX HorizontalListItem-tt0z2b-0 hRbPKu">
													<a	lng="ko-KR"	class="UserPage__CategoryArchivesLink-s1uda3mb-13 cKYVzh"
													background="[object Object]" href="/brw/user/userAD.br?ID=${sessionScope.ID}">
													 <ul class="UserPage__CategoryArchives-s1uda3mb-14 iqxyWB VisualUl-s1vzev56-0 hgAYVH">
															<li	class="UserPage__CategoryArchivesName-s1uda3mb-15 bcgVAG">광고</li>
															<li	class="UserPage__CategoryArchivesRatedCount-s1uda3mb-16 hgxhwm">★${totalCountA}</li>
													
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
				<br>
					<a href="/brw/user/userDeleteForm.br" class="del_link">회원탈퇴</a>
				<br>	
				</div>
		</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel" align="middle">
						<strong>프로필사진</strong>
					</h4>
				</div>
				<form method="post" name="frm" enctype="multipart/form-data" class="probootstrap-form" action="userModify_Pro.br?${_csrf.parameterName}=${_csrf.token}" onsubmit="return check();">
				<input type="hidden"  id="id" name="id" value="${ID}" >
				<div class="modal-body" align="center">
					<div class="row">
							<c:if test="${PROFILE_IMAGE == null }">
								<img src="/brw/resources/images/ican/no_pro.png" alt="profile_img" height="100px" width="90px"  id="proimg">
							</c:if>
							<c:if test="${PROFILE_IMAGE != null }">
								<img src="/brw/resources/images/user_profile/${sessionScope.PROFILE_IMAGE}" alt="profile_img" height="100px" width="90px"  id="proimg">
							</c:if>
						<br><br>
						<div id ="btns">
							<div class="filebox" id="filebox" style="float: left">
 								 <label for="profile_image">사진선택</label>
 								 <input type="file" id="profile_image" name="profile_image" accept="image/gif,image/jpeg,image/png, image/jpg" onchange="chk_file_type(this)" >
							</div>	 
							<div style="float: left; margin-left:2%;">
								<input type="button" onclick="removes(this.form)" value="삭제" >
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-default"  value="변경">
				</div>
				</form>
			</div>
		</div>
		</div>
		
		
		
		<script type="text/JavaScript">
			var file_ok = null;
			
			function check() {
				if(file_ok !=null || $("#profile_image").val() != ""){
					alert("프로필변경이 완료되었습니다");
					return true;
				}else{
					alert("변경할 사진을 선택해주세요.");
					return false;
				}
				
			}	

			function removes(obj){
				$('#proimg').attr('src', "/brw/resources/images/ican/no_pro.png");
				$("#profile_image").val("");
				file_ok = "ok";
			}
						
			/* 프로필시진 변경 관련 스크립뜨 */
			function chk_file_type(obj) { /*이미지 파일만 올릴수 있게 설정 */
				var file_kind = obj.value.lastIndexOf('.');
				var file_name = obj.value.substring(file_kind + 1, obj.length);
				var file_type = file_name.toLowerCase();

				var check_file_type = new Array();

				check_file_type = [ 'jpg', 'gif', 'png', 'jpeg', 'bmp' ];

				if (check_file_type.indexOf(file_type) == -1) {
					alert('이미지 파일만 선택할 수 있습니다.');
					$('#proimg').attr('src', "/brw/resources/images/ican/no_pro.png");
					$("#profile_image").val("");
					return false;
				}
			}
			

			$(document).ready(function() {
				/*  이미지 미리보기  */
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
						reader.onload = function(e) {
							//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
							$('#proimg').attr('src', e.target.result);
							//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
							//(아래 코드에서 읽어들인 dataURL형식)
						}
						reader.readAsDataURL(input.files[0]);
						//File내용을 읽어 dataURL형식의 문자열로 저장
					}
				}//readURL()--
				//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
				$("#profile_image").change(function() {
					//alert(this.value); //선택한 이미지 경로 표시
					readURL(this);
				});
			});
		</script>
</body>
</html>
