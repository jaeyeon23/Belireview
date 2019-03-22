<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
   	<link rel="stylesheet" href="/brw/resources/css/detail2.css"> 
   	<link rel="stylesheet" href="/brw/resources/css/detail.css">
    <link rel="stylesheet" href="/brw/resources/css/detailgenre.css">
   	<%-- <script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>	 --%>
    <style>
    	ul{
			list-style: none outside none;
		    padding-left: 0;
            margin: 0;
		}
        .demo .item{
            margin-bottom: 60px;
        }
		.content-slider li{
		    background-color: #ed3020;
		    text-align: center;
		    color: #FFF;
		}
		.content-slider h3 {
		    margin: 0;
		    padding: 70px 0;
		}
		.demo{
			width: 800px;
		}
    </style>
   
    <script src="/brw/resources/js/jquery-1.4.4.min.js"></script>
    
	<script src="/brw/resources/js/slides.jquery.js"></script>
	
	<script>
	var id = "${ID}";
	var grade = "${grade}";
	var wi = "${wish}";
	var ra = ""
	var initValue = "${initValue}";
	var mcc = "${myComment}";
	var like = "${likeList}".split(",");
		$(function() {
			$("#cat-nav").hide();
		})
		
		$(function() {
			var ee;
			for (var i = 0; i < 10; i++) {
				ee = $('.ree' + i).html() + "px";
				$('.re' + (i + 1)).css("height", ee);
			}
		});//막대그래프 높이 조정

		$(function() {
			if (wi != "") {//보고싶어요에있을때
				$(".juRlmb").html("보기싫어요");
				$(".esugeU").css("background", "#f6f6f6");
				$(".vv").css('color', '#ff2f6e');
			}
			if (grade != "") {//평가했을때
				var rr = "r" + "${grade}";
				$('.r0').removeClass('r0').addClass(rr);
				$('.ccOSgS').html("${ra}");
			} else {
				$('.ccOSgS').html("평가하기");
			}
		});

		/* 로그인 유무 */
		$(function() {
			if (id == "") {//비로그인
				$(".gsSopE").click(function() {//보고싶어요
					alert("로그인 해주세요.");
					location.href = "<c:url value='/member/loginForm.br?${_csrf.parameterName}=${_csrf.token}' />"
				});
				$(".gZASBp").click(function() {//별점
					alert("로그인 해주세요.");
					location.href = "<c:url value='/member/loginForm.br?${_csrf.parameterName}=${_csrf.token}' />"
				});
			} else {//로그인
				if (mcc != "") { // 마이코멘트 숨기기 보여주기
					$(".writeComment").css("display", "none");
					$(".existComment").css("display", "block");
				} else {
					$(".writeComment").css("display", "block");
					$(".existComment").css("display", "none");
				}
				//작동 버튼 시작 post
				$(".vv").click(function() {//보고싶어요
					wish();
					return;
				});
				$('.wc').click(function() {
					comment();
				});
				$('.deleteComment').click(function() {
					deleteComment();
				});
				$('.mc').click(function() {
					updateComment();
				});
				$(".like").live("click", function() {//좋아요 버튼
					var cla = $(this).attr('class').split(" ")[5];
					commentlike(cla);
					return;
				});
				if (like.length > 0) {
					for (var i = 0; i < like.length; i++) {
						var tmp = like[i].replace("[", "").replace("]", "")
								.trim();
						$("." + tmp).html("좋아요취소");
					}
				}
			}
		}); //작동 버튼 끝
		/* 로그인 유무 */

		//좋아요
		function commentlike(cla) {
			$.ajax({
				async : true,
				type : 'POST',
				data : {
					ID : id,
					COMMENTLIKE : "c",
					CLA : cla,
					DRAMA_NO :
					<%=request.getParameter("DRAMA_NO")%>, DC_NO:$(".00"+cla).val()},
					url:"<c:url value='/drama/dramaDetail.br?${_csrf.parameterName}=${_csrf.token}' />",
					success : function(result){
					var r = result;
					var clike ="좋아요취소";
					var cnolike ="좋아요";
					if(r.add){
						$('.'+r.CLA).html(clike);
					}
					if(r.subtract){
						$('.'+r.CLA).html(cnolike);
					}
					$('.0'+r.CLA).html(result.DC_LIKE);
				}
			})
		}
		
		function deleteComment(){
			 $.ajax({
				 async:true,
				 type:'POST',
				 data:{ID:id,DELCOM:'DEL', DC_NO:"${myComment.DC_NO}",DRAMA_NO:<%=request.getParameter("DRAMA_NO")%>},
				 url:"<c:url value='/drama/dramaDetail.br?${_csrf.parameterName}=${_csrf.token}' />",
				 success:function(result){
					$(".writeComment").css("display","block");
					$(".existComment").css("display","none");
					$(".comen").html(result.comList); //코멘트 리스트
					$(".comnum").html(result.comNum); // 코멘트 숫자
				 }
			 })
		} 
		function updateComment(){
			$.ajax({
				 async:true,
				 type:'POST',
				 data:{ID:id,MCOM:$('.com2').val(), DRAMA_NO:<%=request.getParameter("DRAMA_NO")%>},
				 url:"<c:url value='/drama/dramaDetail.br?${_csrf.parameterName}=${_csrf.token}' />",
				 success:function(result){
					$(".writeComment").css("display","none");
					$(".existComment").css("display","block");
					$(".cc").html(result.myCom.DC_CONTENT);
					$(".comen").html(result.comList);
					$(".comnum").html(result.comNum);
				 }
			 })
		} 
		function comment(){
			 $.ajax({
				 async:true,
				 type:'POST',
				 data:{ID:id,COM:$('.com').val(), DRAMA_NO:<%=request.getParameter("DRAMA_NO")%>},
				 url:"<c:url value='/drama/dramaDetail.br?${_csrf.parameterName}=${_csrf.token}' />",
				 success:function(result){
					$(".writeComment").css("display","none");
					$(".existComment").css("display","block");
					$(".cc").html(result.myCom.DC_CONTENT);
					$(".comen").html(result.comList);
					$(".comnum").html(result.comNum);
				 }
			 })
		}
		 /* 보고싶어요 */
		function wish(){
			$.ajax({
				async : true,  
				type : 'POST',
				data : {ID:id , WISH:"w" , DRAMA_NO:<%=request.getParameter("DRAMA_NO")%>},
				url:"<c:url value='/drama/dramaDetail.br?${_csrf.parameterName}=${_csrf.token}' />",
				success : function(result){
					var w = result;
					var a = "보기싫어요";
					var s = "보고싶어요";
					if(w.add){
						$(".juRlmb").html(a);
						$(".esugeU").css("background","#f6f6f6");
						$(".vv").css('color','#ff2f6e');
					}
					if(w.subtract){
						$(".juRlmb").html(s);
						$(".esugeU").css("background",'#ff2f6e');
						$(".vv").css('color','#f6f6f6');
					}
				}
			})
		}
		/* 보고싶어요 */
		
		/* 별점 */
		function rating(rr){
			$.ajax({
				async : true,  
				type : 'POST',
				data : {ID:id , RATING:rr , DRAMA_NO:<%=request.getParameter("DRAMA_NO")%>},
				url:"<c:url value='/drama/dramaDetail.br?${_csrf.parameterName}=${_csrf.token}' />",
				success : function(result){
				}
			})
		}
		/* 별점 */
		
		/* 이미지슬라이드 */
		$(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: '/brw/resources/images/loading.gif',
				play: 5000,
				pause: 2500,
				hoverPause: true
			});
		});
		/* 이미지 슬라이드 */
		/* 별점 */
		$(function(){
			if(id==""||id==null){}
			else{
				var f = $('.gZASBp > a.r1');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r1');
				}, function() {
					$('.gZASBp > div' ).removeClass('r1').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r1'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}else{
						initValue = 'r1';
						r=0.5;
						$('.ccOSgS').html("최악이에요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r2');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r2');
				}, function() {
					$('.gZASBp > div' ).removeClass('r2').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r2'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}else{
						initValue = 'r2';
						r=1;
						$('.ccOSgS').html("싫어요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r3');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r3');
				}, function() {
					$('.gZASBp > div' ).removeClass('r3').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r3'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}else{
						initValue = 'r3';
						r=1.5;
						$('.ccOSgS').html("재미없어요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r4');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r4');
				}, function() {
					$('.gZASBp > div' ).removeClass('r4').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r4'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r4';
						r=2;
						$('.ccOSgS').html("별로에요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r5');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r5');
				}, function() {
					$('.gZASBp > div' ).removeClass('r5').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r5'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r5';
						r=2.5;
						$('.ccOSgS').html("부족해요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r6');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r6');
				}, function() {
					$('.gZASBp > div' ).removeClass('r6').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r6'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r6';
						r=3;
						$('.ccOSgS').html("보통이에요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r7');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r7');
				}, function() {
					$('.gZASBp > div' ).removeClass('r7').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r7'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r7';
						r=3.5;
						$('.ccOSgS').html("볼만해요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r8');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r8');
				}, function() {
					$('.gZASBp > div' ).removeClass('r8').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r8'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r8';
						r=4;
						$('.ccOSgS').html("재미있어요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r9');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r9');
				}, function() {
					$('.gZASBp > div' ).removeClass('r9').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r9'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r9';
						r=4.5;
						$('.ccOSgS').html("훌륭해요!");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r10');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r10');
				}, function() {
					$('.gZASBp > div' ).removeClass('r10').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r10'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r10';
						r=5;
						$('.ccOSgS').html("최고에요!");
						rating(r);
					}
				});
			}
		});
		/* 별점 */
	</script>
	<!-- 슬라이드 css -->
	<link rel="stylesheet" href="/brw/resources/css/global2.css">
</head>
<body> 
	<c:forEach begin="0" end="9" step="1" items="${ratio}"  varStatus="status" var='i'>
			<div class="ree${status.index}" style="display:none;" >${i}</div>
		</c:forEach>
	<div id="root">
		<div class="App__Self-m1g4ja-0 iBpXSE">
			<div class="NavTabManager__NavContainer-dbid0l-0 hhxQev">
				
				<section class="NavTabManager__Main-dbid0l-1 gISuLO">
					<div class="ContentPage__Self-se3skp-0 iXjEcc">
						<div class="ContentPage__Content-se3skp-1 iOUmnP">
							<div class="ContentPage__Background-se3skp-2 crpZES">
								<section class="ContentJumbotron__Self-yf8npk-0 iasdeP">
									<div class="ContentJumbotron__PosterContainer-yf8npk-1 jBAyJr">
										<div class="ContentJumbotron__BlurPosterBlock-yf8npk-2 eLFuK">
											<div class="ContentJumbotron__LeftBackground-yf8npk-6 cGzUVh"
												color="#364052"></div>
											<div class="ContentJumbotron__BlurPoster-yf8npk-4 WdAlN">
												<img class="WdAlN" src="/brw/resources/images/drama/main/${map.DRAMA_MAIN_IMAGE}"><!-- 이미지 -->
												<div class="ContentJumbotron__LeftGradient-yf8npk-8 aCymu"
													color="#364052"></div>
												<div class="ContentJumbotron__RightGradient-yf8npk-9 gShorF"
													color="#3A4457"></div>
											</div>
											<div class="ContentJumbotron__RightBackground-yf8npk-7 QxJZr"
												color="#3A4457"></div>
											<div class="ContentJumbotron__DimmedLayer-yf8npk-3 gPsULF"></div>
										</div>
										<div class="MaxWidthGrid-s193eej0-0 gXAICT">
											<div class="MaxWidthRow-s14yonsc-0 dCZZZZ">
												<div class="MaxWidthCol-s1fpp771-0 bLPhwL">
													<div class="ContentJumbotron__PosterWithRankingInfoBlock-yf8npk-10 cIaqHU">
														<div class="LazyLoadingImg__Self-s1jb87ps-0 cjQTNJ">
															<img class="LazyLoadingImg__Self-s1jb87ps-0 cjQTNJ" src="/brw/resources/images/drama/poster/${map.DRAMA_POSTER_IMAGE}">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="ContentJumbotron__Pane-yf8npk-12 cwWEGZ">
										<div class="MaxWidthGrid-s193eej0-0 gXAICT">
											<div class="MaxWidthRow-s14yonsc-0 dCZZZZ">
												<div class="MaxWidthCol-s1fpp771-0 bLPhwL">
													<div class="ContentJumbotron__PaneInner-yf8npk-13 eJceNg">
														<h1 class="ContentJumbotron__Title-yf8npk-14 jCFeyL">${map.DRAMA_NAME}</h1><!-- 제목 -->
														<div class="ContentJumbotron__Detail-yf8npk-15 bJHRjP">${map.DRAMA_DATE} ・ ${map.DRAMA_GENRE} ・ ${map.DRAMA_CHANNEL}</div><!-- 개봉일 장르 채널 -->
														<div class="ContentJumbotron__ContentRatings-yf8npk-16 epsYAr">평점 ★${map.DRAMA_GRADE}&nbsp;&nbsp;・&nbsp;&nbsp; <em>예상 ★${ratingPrediction}</em> <!-- 평점 -->
														</div>
														<div class="ContentJumbotron__ButtonBlock-yf8npk-17 bqrRYB">
															<div class="ContentActionButton__Self-s1nnw805-0 esugeU">
																<button class="ContentActionButton__ActionButton-s1nnw805-1 kLIPfy StylelessButton-phxvo7-0 gsSopE vv">
																	<span class="ContentActionButton__StatusWithImage-s1nnw805-2 fUUvwT">
																		<span class="ContentActionButton__ActionStatus-s1nnw805-4 juRlmb">보고싶어요</span>
																	</span>
																</button>
															</div>
														</div>
														<div class="ContentJumbotronRatingControl__Self-s1cw42ub-0 hIpgGL">
															<div class="ContentJumbotronRatingControl__Title-s1cw42ub-1 hqGvwK">
																<div class="RatingText__Self-s2g271e-0 ccOSgS"></div>
															</div>
															<div class="RatingControl__Self-s2c1yoc-0 ixVNUo">
																<div class="RatingControl__UnratedStars-s2c1yoc-1 gZASBp">
																	<span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="/brw/resources/images/detail/detail_grade"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="/brw/resources/images/detail/detail_grade"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="/brw/resources/images/detail/detail_grade"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="/brw/resources/images/detail/detail_grade"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="/brw/resources/images/detail/detail_grade"></span>
																	<div class="RatingControl__RatedStars-s2c1yoc-2 r0">
																		<span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="/brw/resources/images/detail/detail_graded"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="/brw/resources/images/detail/detail_graded"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="/brw/resources/images/detail/detail_graded"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="/brw/resources/images/detail/detail_graded"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="/brw/resources/images/detail/detail_graded"></span>
																	</div>
																	<a class="r10" ></a>
																	<a class="r9" ></a>
																	<a class="r8" ></a>
																	<a class="r7" ></a>
																	<a class="r6" ></a>
																	<a class="r5" ></a>
																	<a class="r4" ></a>
																	<a class="r3" ></a>
																	<a class="r2" ></a>
																	<a class="r1" ></a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<div class="ContentPage__ContentSections-se3skp-3 cZgqVh">
									<div class="MaxWidthGrid-s193eej0-0 bWXpcH">
										<div class="MaxWidthRow-s14yonsc-0 dCZZZZ">
											<div class="MaxWidthCol-s1fpp771-0 fGpdkH">
											<!-- 코멘트 작성 전 창 -->
												<div class="ContentMyCommentSection__SectionBlock-mhuscg-0 IsPDs writeComment">
													<div class="RoundedCornerBlock-s17n38ib-0 gPZLbT">
														<section
															class="ContentMyCommentSection__LeaveCommentSection-mhuscg-1 dxGvFB">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<div
																		class="ContentMyCommentSection__LeaveCommentBlock-mhuscg-2 bvmyee">
																		<h3
																			class="ContentMyCommentSection__Title-mhuscg-11 inwTWL">이
																			작품에 대한 ${map.NAME} 님의 평가를 글로 남겨보세요.</h3>
																		<div class="ContentMyCommentSection__ButtonBlock-mhuscg-12 kTSrnl">
																			<!-- modal 구동 버튼 (trigger) -->
																			<!-- 코멘트 작성창 -->
																			<button type="button"
																				class="ContentMyCommentSection__LeaveCommentButton-mhuscg-10 kYniqf MediumButton-lenhbs-0 kzufqJ Button-s48yp1i-0 guqtOb StylelessButton-phxvo7-0 gsSopE"
																				data-toggle="modal" data-target="#myModal1">코멘트
																				남기기</button>

																			<!-- Modal -->
																			<div class="modal fade" id="myModal1" tabindex="-1"
																				role="dialog" aria-labelledby="myModalLabel">
																				<div class="modal-dialog" role="document">
																					<div class="modal-content">
																						<div class="modal-header">
																							<button type="button" class="close"
																								data-dismiss="modal" aria-label="Close">
																								<span aria-hidden="true">&times;</span>
																							</button>
																							<h4 class="modal-title" id="myModalLabel"
																								align="middle">
																								<strong>${map.DRAMA_NAME}</strong>
																							</h4>

																						</div>
																						<div class="modal-body" align="center">
																							<div class="row">
																								<textarea style="resize: none;" class="com"
																									name="comment" cols="70" rows="20"
																									placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요."></textarea>
																							</div>
																						</div>
																						<div class="modal-footer">
																							<button type="submit" class="btn btn-default wc"
																								data-dismiss="modal">작성</button>

																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</section>
													</div>
												</div>
												<!-- 코멘트 작성 완료시 뜨는 창 -->
												<div class="ContentMyCommentSection__SectionBlock-mhuscg-0 IsPDs existComment">
													<div class="RoundedCornerBlock-s17n38ib-0 gPZLbT">
														<div class="Grid-zydj2q-0 cspjno">
															<div class="Row-s1apwm9x-0 c1">
																<section class="ContentMyCommentSection__MyCommentSection-mhuscg-3 jAXTYm">
																	<div class="ContentMyCommentSection__MyCommentBlock-mhuscg-6 fmWQqh">
																		<div class="ContentMyCommentSection__MyProfilePhotoBlock-mhuscg-4 jKiAlO">
																			<div class="ProfilePhoto__Self-s1v3isfu-1 fpMzxR RoundedImageBlock-k5m4n5-0 gUZYtN">
																				<div class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 jawsmT"></div>
																				<div class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																					<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx" src="/brw/resources/images/${PROFILE_IMAGE}" >
																				</div>
																			</div>
																		</div>
																		<div class="ContentMyCommentSection__MyComment-mhuscg-5 iBmFgp">
																			<div class="TextTruncate__Self-wvv1uj-0 edeoAV">
																				<div class="TextTruncate__Text-wvv1uj-1 gLsCNn cc"
																					style="white-space: pre-line;">${myComment.DC_CONTENT}</div><!-- 댓글내용 -->
																			</div>
																		</div>
																		<ul class="ContentMyCommentSection__CommentUpdateButtons-mhuscg-7 UbRpK VisualUl-s1vzev56-0 hgAYVH">
																			<li class="ContentMyCommentSection__CommentUpdateButtonListItem-mhuscg-8 rEOgj">
																				<button class="ContentMyCommentSection__CommentUpdateButton-mhuscg-9 eSMTCV StylelessButton-phxvo7-0 gsSopE deleteComment">
																					<img src="/brw/resources/images/detail/detail_comment_delete.svg"
																						alt="delete comment">삭제
																				</button>
																			</li>
																			<li class="ContentMyCommentSection__CommentUpdateButtonListItem-mhuscg-8 rEOgj">
																				<button data-toggle="modal" data-target="#myModal2"  class="ContentMyCommentSection__CommentUpdateButton-mhuscg-9 eSMTCV StylelessButton-phxvo7-0 gsSopE">
																					<img src="/brw/resources/images/detail/detail_comment_modify.svg"
																						alt="edit comment">수정
																				</button>
																			</li>
																		</ul>
																			<!-- Modal -->
																			<div class="modal fade" id="myModal2" tabindex="-1"
																				role="dialog" aria-labelledby="myModalLabel">
																				<div class="modal-dialog" role="document">
																					<div class="modal-content">
																						<div class="modal-header">
																							<button type="button" class="close"
																								data-dismiss="modal" aria-label="Close">
																								<span aria-hidden="true">&times;</span>
																							</button>
																							<h4 class="modal-title" id="myModalLabel"
																								align="middle">
																								<strong>${map.DRAMA_NAME}</strong>
																							</h4>

																						</div>
																						<div class="modal-body" align="center">
																							<div class="row">
																								<textarea style="resize: none;" class="com2" name="comment" cols="70" rows="20" ></textarea>
																							</div>
																						</div>
																						<div class="modal-footer">
																							<button type="submit" class="btn btn-default mc"
																								data-dismiss="modal">작성</button>

																						</div>
																					</div>
																				</div>
																			</div>
																	</div>
																</section>
															</div>
														</div>
													</div>
												</div>
												<!-- 코멘트가 있을때  -->
												<div
													class="ContentPage__ContentSectionsBlock-se3skp-7 cllZaN">
													<div class="RoundedCornerBlock-s17n38ib-0 gpSJNR">
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">내 예상별점</h2>
																		<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			<div class="ContentReasonSection__MyPredictedRatingBlock-s1eie0l9-0 gLxsYG">
																				${ratingPrediction}
																				<div class="ProfilePhoto__Self-s1v3isfu-1 fAYBdd RoundedImageBlock-k5m4n5-0 gUZYtN">
																					<div class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 jawsmT"></div>
																					<div class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																						<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx"
																							src="/brw/resources/images/${PROFILE_IMAGE}">
																					</div>
																				</div>
																			</div>
																		</div>
																	</header>
																</div>
															</div>
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<div
																		class="ContentReasonSection__ReasonListContainer-s1eie0l9-1 drPIAH">
																		<ul class="VisualUl-s1vzev56-0 hgAYVH">
																			<li
																				class="ContentReasonSection__ReasonListItem-s1eie0l9-2 ikOkkg"><div
																					class="ContentReasonSection__ReasonTitle-s1eie0l9-3 hOKaLN">선호하는 장르</div>
																				<div
																					class="ContentReasonSection__Tags-s1eie0l9-6 kCQkjw ContentReasonSection__ReasonValue-s1eie0l9-5 fIyVCO">
																					<span class="Tag__TagLink-u797lx-0 cwYdug"
																						color="#00aae6">#${map.DRAMA_GENRE}</span> 
																				</div></li>
																		</ul>
																	</div>
																	<hr
																		class="Divider__StylingMergedDivider-s11un6bw-1 jtXrQz Divider-s11un6bw-0 cVxSEp">
																</div>
															</div>
														</section>
														
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
														
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header
																		class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">기본
																			정보</h2>
																		
																			<div
																				class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																				<div
																					class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
																					<a href="/brw/drama/dramaInfo.br?DRAMA_NO=${map.DRAMA_NO}">더보기</a>
																				</div>
																			</div>
																		
																	</header>
																</div>
															</div>
															
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<article
																		class="ContentOverviewSection__Overview-s1yclw10-0 hEyokS">
																		<div
																			class="ContentOverviewSection__Summary-s1yclw10-1 kdMFQv">${map.DRAMA_NAME}
																			<br> <span
																				class="ContentOverviewSection__OverviewMeta-s1yclw10-2 bvwFIW">${map.DRAMA_DATE}
																				· ${map.DRAMA_CHANNEL} · ${map.DRAMA_GENRE}</span><br>
																			<span
																				class="ContentOverviewSection__OverviewMeta-s1yclw10-2 bvwFIW">${map.DRAMA_EPISODE}부작</span>
																		</div>
																	</article>
																	<hr
																		class="Divider__StylingMergedDivider-s11un6bw-1 jtXrQz Divider-s11un6bw-0 cVxSEp">
																</div>
															</div>
														</section>
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header
																		class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">출연/제작</h2>
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
																					class="ContentPeopleSection__PeopleStackableUl-s1qdagi5-0 dCFwKD StackableUl__StyledStackableUl-gafxvv-1 dYcNoO VisualUl-s1vzev56-0 hgAYVH">
																					<li class="ListItemWithProfilePhoto__Self-s1a35ruo-0 GRmjI">
																					<a lng="ko-KR"
																						class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD"
																						title="제임스 카메론" href="/ko-KR/people/178274">
																						<div class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																								<div class="ProfilePhoto__Self-s1v3isfu-1 cKevdV RoundedImageBlock-k5m4n5-0 gUZYtN">
																									<div class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 khTHxj"></div>
																									<div class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																										<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx kPGxuy"
																											src="/brw/resources/images/actor/${map.DRAMA_DIRECTOR}.jpg" >
																									</div>
																								</div>
																							</div>
																							<div class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																								<div class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																									<div class="ListItemWithProfilePhoto__Title-s1a35ruo-1 cSGZfW">${map.DRAMA_DIRECTOR}</div>
																									<div
																										class="ListItemWithProfilePhoto__Subtitle-s1a35ruo-2 cbqRVo">감독</div>
																								</div>
																								<div></div>
																							</div></a></li>
																							
																					<c:forEach items="${actor}" var="act">
																					<li class="ListItemWithProfilePhoto__Self-s1a35ruo-0 GRmjI">
																					<a lng="ko-KR" class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD"
																						title="샘 워싱턴" href="/ko-KR/people/114764"><div class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																								<div class="ProfilePhoto__Self-s1v3isfu-1 cKevdV RoundedImageBlock-k5m4n5-0 gUZYtN">
																									<div class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 fsVfFi"></div>
																									<div class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																										<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx  kPGxuy"
																											src="/brw/resources/images/actor/${act.ACTOR_IMAGE}">
																									</div>
																								</div>
																							</div>
																							<div class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																								<div class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																									<div class="ListItemWithProfilePhoto__Title-s1a35ruo-1 cSGZfW">${act.ACTOR_NAME}</div>
																									<div class="ListItemWithProfilePhoto__Subtitle-s1a35ruo-2 cbqRVo">배우</div>
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
															</div>
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<hr
																		class="Divider__StylingMergedDivider-s11un6bw-1 kAeKXS Divider-s11un6bw-0 cVxSEp">
																</div>
															</div>
														</section>
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header
																		class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">별점
																			그래프</h2>
																		<span
																			class="ContentRatingStatSection__RatingStatHeaderTopRight-s19qkcc2-0 itGSeD">평균
																			${map.DRAMA_GRADE}<br> <strong>(${totalGrade}명)</strong>
																		</span>
																	</header>
																</div>
															</div>
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<div class="RatingStat__Self-luia1n-0 iwHouL">
																		<div class="RatingStat__BarsContainer-luia1n-1 cTllXN">
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 krlvgk re1"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 euhMRX re2"
																					prefix="1"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 bHydWh re3"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 cbQtbT re4"
																					prefix="2"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 kGNaYb re5"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 izBOSd re6"
																					prefix="3"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 isYbOS re7"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 fQPWCL re8"
																					prefix="4"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 HjCEE re9"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 gMiOPw re10"
																					prefix="5"></span>
																			</div>
																		</div>
																	</div>
																	<hr class="Divider__StylingMergedDivider-s11un6bw-1 eRVukz Divider-s11un6bw-0 cVxSEp">
																</div>
															</div>
														</section>
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header
																		class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">코멘트</h2>
																		<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl comnum">${totalCount}</span>
																		<div
																			class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			<div
																				class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
																				<a href="/brw/drama/dramaComment.br?DRAMA_NO=${map.DRAMA_NO}">더보기</a>
																			</div>
																		</div>
																	</header>
																</div>
															</div>
															<div
																class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
																<div
																	class="PrimitiveHorizontalScrollable__ScrollBar-hy4esm-1 bVhHTK">
																	<div
																		class="PrimitiveHorizontalScrollable__ScrollingInner-hy4esm-2 iGzmWK">
																		<div class="Grid-zydj2q-0 cspjno">
																			<div class="Row-s1apwm9x-0 lowZpE">
																				<ul class="ContentCommentsSection__CommentHorizontalUl-s5mwulc-1 kBYzWA HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 kJrumC VisualUl-s1vzev56-0 hgAYVH comen">
																					<c:forEach items="${comment}" var="comment" varStatus="stat">
																						<!-- 코멘트 -->
																						<li class="HorizontalListItem-tt0z2b-0 hRbPKu">
																							<div class="BasicCommentItem__Comment-iqy0k7-0 UuRdd">
																								<div class="BasicCommentItem__TitleContainer-iqy0k7-1 jWsgqF">
																									<div class="BasicCommentItem__ProfileBlock-iqy0k7-2 dFeRwI">
																										<div class="ProfilePhoto__Self-s1v3isfu-1 lniNjX RoundedImageBlock-k5m4n5-0 gUZYtN">
																											<div class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 eKUOvr"></div>
																												<div class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																													<c:if test="${comment.PROFILE_IMAGE!=null}">
																														<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx" 
																															src="/brw/resources/images/user_profile/${comment.PROFILE_IMAGE}">
																													</c:if>
																													<c:if test="${comment.PROFILE_IMAGE==null}">
																													<img class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx" 
																														src="/brw/resources/images/Temporary_img.JPG">
																													</c:if>
																												</div>
																											</div>
																											<div class="UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ">
																												${comment.NAME} 
																												<input type="hidden" value="${comment.DC_NO}" class="00like${stat.index}"/>
																												<span class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF" src="/brw/resources/images/detail/detail_comment1.svg"></span>
																												<span class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv" src="/brw/resources/images/detail/detail_comment2.svg"></span>
																											</div>
																									</div>
																									<div class="BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP">
																										<img src="/brw/resources/images/detail/detail_comment_grade.svg"
																											width="16px" height="16px" alt="star"><span>${comment.DL_GRADE}</span>
																									</div>
																								</div>
																								<div class="BasicCommentItem__TextBlock-iqy0k7-3 eQRymK">
																									<div class="TextTruncate__Self-wvv1uj-0 jXBVmV">
																										<div class="TextTruncate__Text-wvv1uj-1 gLsCNn" style="white-space: pre-line;">${comment.DC_CONTENT}</div>
																									</div>
																								</div>
																								<div class="ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd">
																									<span class="ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD" src="/brw/resources/images/detail/detail_like.svg" width="18px" height="18px"></span>
																									<em class="0like${stat.index}">${comment.DC_LIKE}</em>
																								</div>
																								<div class="ContentlessCommentItem__UserActionBlock-s1n6rtl6-4 kJvkpH">
																									<button class="ContentlessCommentItem__UserActionButton-s1n6rtl6-5 kRhZsb StylelessButton-phxvo7-0 gsSopE like like${stat.index}">좋아요</button>
																								</div>
																							</div>
																						</li>
																					</c:forEach>
																					<div class="SpinnerContainer__Self-s16nvp7b-0 dvymnj"></div>
																				</ul>
																			</div>
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
																	direction="right"></div>
															</div>
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<hr class="Divider__StylingMergedDivider-s11un6bw-1 kAeKXS Divider-s11un6bw-0 cVxSEp">
																</div>
															</div>
														</section>
													</div>
												</div>

												<div class="RoundedCornerBlock-s17n38ib-0 iyaHUY">
													<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
														<div class="Grid-zydj2q-0 cspjno">
															<div class="Row-s1apwm9x-0 lowZpE">
																<header
																	class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																	<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">갤러리</h2>
																	<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			
																		</div>
																</header>
															</div>
														</div>
														
															
									<div id="container"> 
										<div id="example">
											<div id="slides">
												<div class="slides_container">
													<c:forEach begin="0" step="1" items="${image}"  varStatus="status" var='img'>
														<img src="/brw/resources/images/drama/content/${img}" width="570" height="270" alt="Slide ${status.index+1}">
													</c:forEach>
												</div>
												
												<a href="#" class="prev">
												<img src="/brw/resources/images/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
												
												<a href="#" class="next">
												<img src="/brw/resources/images/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
												
											</div>
											<img src="/brw/resources/images/example-frame.png" width="739" height="341" alt="Example Frame" id="frame">
										</div>
									</div>
							 
									<hr class="Divider__StylingMergedDivider-s11un6bw-1 jtXrQz Divider-s11un6bw-0 cVxSEp">
									<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
														<div class="Grid-zydj2q-0 cspjno">
															<div class="Row-s1apwm9x-0 lowZpE">
																<header
																	class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																	<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">비슷한 장르</h2>
																	<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl"><!-- 비슷한장르개수 --></span>
																	<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
																				<a href="/brw/mainSearch.br?GENRE=${map.DRAMA_GENRE}">더보기</a>
																			</div>
																		</div>
																</header>
															</div>
															
														</div>
											
													 <c:forEach items="${detailgenre}" var="detailgenrelist" >
														 <div class="col-sm-6 col-md-3">
														 	<a href="/brw/drama/dramaDetail.br?DRAMA_NO=${detailgenrelist.DRAMA_NO}">
														    <div class="detailgenre">
														      <img src="/brw/resources/images/drama/poster/${detailgenrelist.DRAMA_POSTER_IMAGE}">
														      <%-- <input type='hidden' class='IDX' value="${dramaList.DRAMA_NO}"> --%>
														      <div class="detailgenrefont">
														        <h3 class="genrename">#${detailgenrelist.DRAMA_NAME}</h3>
														        <p>#${detailgenrelist.DRAMA_DATE}・#${detailgenrelist.DRAMA_CHANNEL}</p>
														      </div>
														    </div>
														    </a>
														  </div>
													 </c:forEach>
													</section>
													<div></div>
												</div>
											</div>
										</div>
										<div class="ContentPage__HiddenBlockOnlyMdScreen-se3skp-10 jVScZl"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
					src="https://staticxx.facebook.com/connect/xd_arbiter/r/vy-MhgbfL4v.js?version=44#channel=f1d875ef1e50e5c&amp;origin=https%3A%2F%2Fwatcha.com"
					style="border: none;"></iframe>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
</body>
</html>