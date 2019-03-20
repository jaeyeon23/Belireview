<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
   	<link rel="stylesheet" href="/brw/resources/css/detail2.css">
   	<link rel="stylesheet" href="/brw/resources/css/detail.css">
	<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
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
		
		 $(function(){
			 if(wi!=""){//보고싶어요에있을때
				$(".juRlmb").html("보기싫어요");
			 }
			 if(grade != ""){//평가했을때
			  	var rr = "r"+"${grade}";
			  	$('.r0').removeClass('r0').addClass(rr);
			  	$('.ccOSgS').html("${ra}");
			 }else{
				$('.ccOSgS').html("평가하기");
			 }
		 });  
		 /* 로그인 유무 */
		$(function(){ 
			if(id==""){//비로그인
				$(".gsSopE").click(function(){//보고싶어요
					alert("로그인 해주세요.");
					location.href="<c:url value='/member/loginForm.br' />"
					});
				$(".gZASBp").click(function(){//별점
					alert("로그인 해주세요.");
					location.href="<c:url value='/member/loginForm.br' />"
				});
			}else{//로그인
				if(mcc != ""){
					$(".writeComment").css("display","none");
					$(".existComment").css("display","block");
				}else{
					$(".writeComment").css("display","block");
					$(".existComment").css("display","none");
				}
				$(".vv").click(function(){//보고싶어요
					wish();
					return;
				});
				$('.wc').click(function(){
					comment();
				});
				 $('.deleteComment').click(function(){
					deleteComment();
				}); 
				 $('.mc').click(function(){
					updateComment();
				}); 
			}
		});
		 /* 로그인 유무 */
		
		function deleteComment(){
			 $.ajax({
				 async:true,
				 type:'POST',
				 data:{ID:id,DELCOM:'DEL', DC_NO:"${myComment.ADC_NO}",AD_NO:<%=request.getParameter("AD_NO")%>},
				 url:"<c:url value='/AD/ADDetail.br' />",
				 success:function(result){
					$(".writeComment").css("display","block");
					$(".existComment").css("display","none");
					
				 }
			 })
			 
		} 
		function updateComment(){
			$.ajax({
				 async:true,
				 type:'POST',
				 data:{ID:id,MCOM:$('.com2').val(), AD_NO:<%=request.getParameter("AD_NO")%>},
				 url:"<c:url value='/ad/adDetail.br' />",
				 success:function(result){
					$(".writeComment").css("display","none");
					$(".existComment").css("display","block");
					alert(result.myCom.DC_CONTENT);
					$(".gLsCNn").html(result.myCom.ADC_CONTENT);
				 }
			 })
		} 
		function comment(){
			 $.ajax({
				 async:true,
				 type:'POST',
				 data:{ID:id,COM:$('.com').val(), AD_NO:<%=request.getParameter("AD_NO")%>},
				 url:"<c:url value='/AD/ADDetail.br' />",
				 success:function(result){
					$(".writeComment").css("display","none");
					$(".existComment").css("display","block");
					alert(result.myCom.DC_CONTENT);
					$(".gLsCNn").html(result.myCom.ADC_CONTENT);
				 }
			 })
		}
		 /* 보고싶어요 */
		function wish(){
			$.ajax({
				async : true,  
				type : 'POST',
				data : {ID:id , WISH:"w" , AD_NO:<%=request.getParameter("AD_NO")%>},
				url:"<c:url value='/ad/adDetail.br' />",
				success : function(result){
					var w = result;
					var a = "보기싫어요";
					var s = "보고싶어요";
					if(w.add){
						$(".juRlmb").html(a);
					}
					if(w.subtract){
						$(".juRlmb").html(s);
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
				data : {ID:id , RATING:rr , AD_NO:<%=request.getParameter("AD_NO")%>},
				url:"<c:url value='/ad/adDetail.br' />",
				success : function(result){
				}
				/* $('.gZASBp > a.r1'); */
			})
		}
		/* 별점 */
		
	
		/* 별점 */
		
	
		$(function(){
			
			if(id==""||id==null){}
			else{
				/* initValue = $('.gZASBp > div').attr("class").split(" ")[1]; */

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
	
	<link rel="stylesheet" href="/brw/resources/css/global2.css">
</head>
<body> 
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
												<img class="WdAlN" src="/brw/resources/images/3-girls.jpg"><!-- 이미지 -->
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
													<div
														class="ContentJumbotron__PosterWithRankingInfoBlock-yf8npk-10 cIaqHU">
														<div class="LazyLoadingImg__Self-s1jb87ps-0 cjQTNJ">
															<img class="LazyLoadingImg__Self-s1jb87ps-0 cjQTNJ"
																alt="사바하의 포스터" data-image-id="100"
																src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1547575268/nc6h9mynmwu5zi7n7jr0.jpg">
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
														<h1 class="ContentJumbotron__Title-yf8npk-14 jCFeyL">${map.AD_NAME}</h1><!-- 제목 -->
														<div class="ContentJumbotron__Detail-yf8npk-15 bJHRjP">${map.AD_COMPANY}</div><!--  -->
														<div class="ContentJumbotron__ContentRatings-yf8npk-16 epsYAr">평점 ★${map.AD_GRADE}&nbsp;&nbsp;・&nbsp;&nbsp;<!-- 평점 -->
														</div>
													
														<div
															class="ContentJumbotronRatingControl__Self-s1cw42ub-0 hIpgGL">
															<div
																class="ContentJumbotronRatingControl__Title-s1cw42ub-1 hqGvwK">
																<div class="RatingText__Self-s2g271e-0 ccOSgS"></div>
															</div>
															<div class="RatingControl__Self-s2c1yoc-0 ixVNUo">
																<div class="RatingControl__UnratedStars-s2c1yoc-1 gZASBp">
																	<span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0VFRSIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0VFRSIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0VFRSIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0VFRSIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																		class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 kBCBic"
																		src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0VFRSIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span>
																	<div class="RatingControl__RatedStars-s2c1yoc-2 r0">
																		<span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGREQ2MyIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGREQ2MyIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGREQ2MyIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGREQ2MyIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span><span
																			class="RatingControl__StarImg-s2c1yoc-9 irzhJG UIImg-s3jz6tx-0 gBImux"
																			src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGREQ2MyIgZD0iTTIyIDMzLjQ0NEw5LjgzIDQyLjMyN2MtLjc4NC41NzItMS44NDItLjE5Ni0xLjUzOS0xLjExOGw0LjY4Ny0xNC4zMkwuNzY5IDE4LjA2Yy0uNzg3LS41NjktLjM4My0xLjgxMi41ODgtMS44MWwxNS4wNjcuMDMzIDQuNjI0LTE0LjM0Yy4yOTgtLjkyNCAxLjYwNi0uOTI0IDEuOTA0IDBsNC42MjQgMTQuMzQgMTUuMDY3LS4wMzNjLjk3MS0uMDAyIDEuMzc1IDEuMjQxLjU4OCAxLjgxbC0xMi4yMDkgOC44MjkgNC42ODggMTQuMzJjLjMwMi45MjItLjc1NiAxLjY5LTEuNTQgMS4xMThMMjIgMzMuNDQ0eiIvPgogICAgPC9nPgo8L3N2Zz4K"></span>
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
																			작품에 대한 ${map.ID} 님의 평가를 글로 남겨보세요.</h3>
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
																							<h4 class="modal-title" id="myModalLabel"align="middle">
																								<strong>${map.AD_NAME}</strong>
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
																<section
																	class="ContentMyCommentSection__MyCommentSection-mhuscg-3 jAXTYm">
																	<div
																		class="ContentMyCommentSection__MyCommentBlock-mhuscg-6 fmWQqh">
																		<div
																			class="ContentMyCommentSection__MyProfilePhotoBlock-mhuscg-4 jKiAlO">
																			<div
																				class="ProfilePhoto__Self-s1v3isfu-1 fpMzxR RoundedImageBlock-k5m4n5-0 gUZYtN">
																				<div
																					class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 jawsmT"></div>
																				<div
																					class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																					<img
																						class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx"
																						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" >
																				</div>
																			</div>
																		</div>
																		<div
																			class="ContentMyCommentSection__MyComment-mhuscg-5 iBmFgp">
																			<div class="TextTruncate__Self-wvv1uj-0 edeoAV">
																				<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																					style="white-space: pre-line;">${myComment.ADC_CONTENT}</div><!-- 댓글내용 -->
																			</div>
																		</div>
																		<ul
																			class="ContentMyCommentSection__CommentUpdateButtons-mhuscg-7 UbRpK VisualUl-s1vzev56-0 hgAYVH">
																			<li
																				class="ContentMyCommentSection__CommentUpdateButtonListItem-mhuscg-8 rEOgj"><button
																					class="ContentMyCommentSection__CommentUpdateButton-mhuscg-9 eSMTCV StylelessButton-phxvo7-0 gsSopE deleteComment">
																					<img
																						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0EwQTBBMCIgZD0iTTUuMjUgMTQuMjVoNy41di03LjVoMS41VjE1YS43NS43NSAwIDAgMS0uNzUuNzVoLTlhLjc1Ljc1IDAgMCAxLS43NS0uNzVWNi43NWgxLjV2Ny41ek0xMiA0LjVoMy43NVY2SDIuMjVWNC41SDZWM2EuNzUuNzUgMCAwIDEgLjc1LS43NWg0LjVBLjc1Ljc1IDAgMCAxIDEyIDN2MS41em0tMS41IDB2LS43NWgtM3YuNzVoM3pNNi43NSA2Ljc1aDEuNXY2Ljc1aC0xLjVWNi43NXptMyAwaDEuNXY2Ljc1aC0xLjVWNi43NXoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
																						alt="delete comment">삭제
																				</button></li>
																			<li
																				class="ContentMyCommentSection__CommentUpdateButtonListItem-mhuscg-8 rEOgj"><button data-toggle="modal" data-target="#myModal2" 
																					class="ContentMyCommentSection__CommentUpdateButton-mhuscg-9 eSMTCV StylelessButton-phxvo7-0 gsSopE">
																					<img
																						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0EwQTBBMCIgZD0iTTIuMTggMTUuMzlsLjcwMy0zLjk4IDMuNzEzIDMuNzEyLTMuOTgxLjcwMmEuMzc0LjM3NCAwIDAgMS0uNDM0LS40MzR6bTEuNDk4LTQuNzc2bDYuMzY0LTYuMzY0IDMuNzEzIDMuNzEyLTYuMzY0IDYuMzY0LTMuNzEzLTMuNzEyek0xNS42MDcgNS4wNGEuNzUuNzUgMCAwIDEgMCAxLjA2bC0xLjA2IDEuMDYxLTMuNzEzLTMuNzEyIDEuMDYtMS4wNmEuNzUuNzUgMCAwIDEgMS4wNiAwbDIuNjUzIDIuNjUxeiIvPgogICAgPC9nPgo8L3N2Zz4K"
																						alt="edit comment">수정
																				</button></li>
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
																								<strong>${map.AD_NAME}</strong>
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
												<!-- 광고  -->
												
											<div class="ContentPage__ContentSectionsBlock-se3skp-7 cllZaN">
													<div class="RoundedCornerBlock-s17n38ib-0 gpSJNR">
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																<header
																	class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																	<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">광고</h2>
																</header>
															</div>
														</div>
											
												<!--광고 영상 -->
													<div class="Grid-zydj2q-0 cspjno"> 
																<div class="Row-s1apwm9x-0 lowZpE">
															<!-- <img src="/brw/resources/images//new-ribbon.png" width="112" height="112" alt="New Ribbon" id="ribbon"> -->
													        	<div align="center" >
																		<iframe width="650" height="350" src="https://www.youtube.com/embed/cYC6kQFHz2A?amp;autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
																
																</div>
																	<hr class="Divider__StylingMergedDivider-s11un6bw-1 jtXrQz Divider-s11un6bw-0 cVxSEp">		
															</div>
														
														</div>
														</section>
												
										
												<!-- 기본정보 -->
												
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header
																		class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">기본 정보</h2>
																	</header>
																</div>
															</div>
															
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<article
																		class="ContentOverviewSection__Overview-s1yclw10-0 hEyokS">
																		<div class="ContentOverviewSection__Summary-s1yclw10-1 kdMFQv">${map.AD_NAME}
																			<br> 
																			<span class="ContentOverviewSection__OverviewMeta-s1yclw10-2 bvwFIW">${map.AD_COMPANY}
																			</span><br>
																			<span class="ContentOverviewSection__OverviewMeta-s1yclw10-2 bvwFIW">${map.AD_CONTENT}
																			</span><br>
																	
																		</div>
																	</article>
																	<hr class="Divider__StylingMergedDivider-s11un6bw-1 jtXrQz Divider-s11un6bw-0 cVxSEp">
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
																			${map.AD_GRADE}<br> <strong>(3만명)</strong>
																		</span>
																	</header>
																</div>
															</div>
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<div class="RatingStat__Self-luia1n-0 iwHouL">
																		<div class="RatingStat__BarsContainer-luia1n-1 cTllXN">
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 krlvgk"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 euhMRX"
																					prefix="1"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 bHydWh"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 cbQtbT"
																					prefix="2"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 kGNaYb"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 izBOSd"
																					prefix="3"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 isYbOS"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 fQPWCL"
																					prefix="4"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 HjCEE"></span>
																			</div>
																			<div class="RatingStat__BarArea-luia1n-2 fkyWIw">
																				<span class="RatingStat__Bar-luia1n-3 gMiOPw"
																					prefix="5"></span>
																			</div>
																		</div>
																	</div>
																	<hr
																		class="Divider__StylingMergedDivider-s11un6bw-1 eRVukz Divider-s11un6bw-0 cVxSEp">
																</div>
															</div>
														</section>
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header
																		class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">코멘트</h2>
																		<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl">${totalCount}</span>
																		<div
																			class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			<div
																				class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
																				<a href="/brw/ad/adComment.br?AD_NO=${map.AD_NO}">더보기</a>
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
																				<ul
																					class="ContentCommentsSection__CommentHorizontalUl-s5mwulc-1 kBYzWA HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 kJrumC VisualUl-s1vzev56-0 hgAYVH">
																					<c:forEach items="${comment}" var="comment">
																						<!-- 코멘트 -->
																						<li class="HorizontalListItem-tt0z2b-0 hRbPKu">
																							<div
																								class="BasicCommentItem__Comment-iqy0k7-0 UuRdd">
																								<div
																									class="BasicCommentItem__TitleContainer-iqy0k7-1 jWsgqF">
																									<div
																										class="BasicCommentItem__ProfileBlock-iqy0k7-2 dFeRwI">
																										<a lng="ko-KR"
																											class="StylelessLocalLink-s1aqpmgk-1 gdyQIs"
																											title="이동진 평론가"
																											href="/ko-KR/users/DgwxAeQYNxrMj"><div
																												class="ProfilePhoto__Self-s1v3isfu-1 lniNjX RoundedImageBlock-k5m4n5-0 gUZYtN">
																												<div
																													class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 eKUOvr"></div>
																												<div
																													class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																													<img
																														class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx"
																														src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																														alt="이동진 평론가의 사진">
																												</div>
																											</div>
																											<div
																												class="UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ">
																												${comment.ID} <span
																													class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF"
																													src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgICAgICA8cGF0aCBpZD0iYyIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPC9tYXNrPgogICAgICAgIDx1c2UgZmlsbD0iIzNEM0QzRCIgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBkPSJNMy40IDIuOGgxLjJ2OUgzLjR6TTUuOCA1LjJIN3Y3LjJINS44ek04LjIgNy42aDEuMnY0LjhIOC4yeiIgbWFzaz0idXJsKCNiKSIvPgogICAgICAgIDxwYXRoIGZpbGw9IiNGRkYiIGQ9Ik04LjIgNy42SDEzdjEuMkg4LjJ6TTUuOCA1LjJIMTN2MS4ySDUuOHpNMy40IDIuOGg5VjRoLTl6IiBtYXNrPSJ1cmwoI2IpIi8+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjM0QzRDNEIiBzdHJva2Utb3BhY2l0eT0iLjE1IiBzdHJva2Utd2lkdGg9Ii4yNSIgZD0iTTcuMDAzIDEwLjk3NmMtLjA0MS0uMDM2LjE2LjE0LjIwNi4xNzguMjMyLjE5Mi4zOS4yNDUuNjA2LjE3NS4yNDgtLjA4LjMyOC0uMjIyLjQyMy0uNjQ0LjA0MS0uMTguMDUtLjIyLjA3NS0uMzA0LjA5NS0uMzI5LjI0Mi0uNTY5LjUwNS0uNzYuMDM4LS4wMjguMDc2LS4wNTIuMTE1LS4wNzUuMzA0LS4xNzYuNTUzLS4xOTcgMS4wMzctLjE1Mi40NzUuMDQ0LjYyNi4wMTcuNzgzLS4yYS40OC40OCAwIDAgMCAuMTAxLS4zMTdjLS4wMDUtLjEyOS0uMDM0LS4yMS0uMTY4LS41MjMtLjE5OC0uNDYxLS4yNS0uNzQ5LS4xMjYtMS4xMy4xMTQtLjM1Mi4zMjEtLjU2Ny42NzctLjc4OC4wNDctLjAyOS4xMDQtLjA2My4yMDItLjEyLjMyNi0uMTk3LjQzNi0uMzI1LjQzNi0uNTc1IDAtLjI0OS0uMTEtLjM3Ny0uNDM2LS41NzNhMTQuMDAzIDE0LjAwMyAwIDAgMS0uMjAyLS4xMjFjLS4zNTYtLjIyMS0uNTYzLS40MzYtLjY3Ny0uNzg3LS4xMjQtLjM4My0uMDcyLS42Ny4xMjYtMS4xMzIuMTM0LS4zMTMuMTYzLS4zOTMuMTY4LS41MjJhLjQ4LjQ4IDAgMCAwLS4xMDEtLjMxOGMtLjE1Ny0uMjE2LS4zMDgtLjI0My0uNzgzLS4yLS40ODQuMDQ2LS43MzMuMDI1LTEuMDM3LS4xNTFhMS4zMjYgMS4zMjYgMCAwIDEtLjExNS0uMDc1Yy0uMjYzLS4xOTEtLjQxLS40MzEtLjUwNS0uNzZhNC4zOTIgNC4zOTIgMCAwIDEtLjA3NS0uMzA0QzguMTQzLjM3NiA4LjA2My4yMzQgNy44MTUuMTU0IDcuNi4wODQgNy40NDEuMTM3IDcuMjEuMzI5Yy0uMDQ2LjAzNy0uMjQ4LjIxNC0uMjA2LjE3OC0uMzUuMzAzLS42MTUuNDQtMS4wMDMuNDQtLjM4OCAwLS42NTMtLjEzNy0xLjAwMy0uNDQuMDQxLjAzNi0uMTYtLjE0LS4yMDYtLjE3OC0uMjMyLS4xOTItLjM5LS4yNDUtLjYwNi0uMTc1LS4yNDguMDgtLjMyOC4yMjItLjQyMy42NDQtLjA0MS4xOC0uMDUuMjItLjA3NS4zMDQtLjA5NS4zMjktLjI0Mi41NjktLjUwNS43NmExLjMyNiAxLjMyNiAwIDAgMS0uMTE1LjA3NWMtLjMwNC4xNzYtLjU1My4xOTctMS4wMzcuMTUyLS40NzUtLjA0NC0uNjI2LS4wMTctLjc4My4yYS40OC40OCAwIDAgMC0uMTAxLjMxN2MuMDA1LjEyOS4wMzQuMjEuMTY4LjUyMi4xOTguNDYyLjI1Ljc1LjEyNiAxLjEzMi0uMTE0LjM1LS4zMjEuNTY2LS42NzcuNzg3bC0uMjAyLjEyYy0uMzI2LjE5Ny0uNDM2LjMyNS0uNDM2LjU3NCAwIC4yNS4xMS4zNzguNDM2LjU3NGwuMjAyLjEyMWMuMzU2LjIyLjU2My40MzYuNjc3Ljc4Ny4xMjQuMzgyLjA3Mi42Ny0uMTI2IDEuMTMxLS4xMzQuMzE0LS4xNjMuMzk0LS4xNjguNTIzYS40OC40OCAwIDAgMCAuMTAxLjMxOGMuMTU3LjIxNi4zMDguMjQzLjc4My4yLjQ4NC0uMDQ2LjczMy0uMDI1IDEuMDM3LjE1MS4wMzkuMDIzLjA3Ny4wNDcuMTE1LjA3NS4yNjMuMTkxLjQxLjQzMS41MDUuNzYuMDI0LjA4NC4wMzQuMTIzLjA3NS4zMDQuMDk1LjQyMi4xNzUuNTY0LjQyMy42NDQuMjE2LjA3LjM3NC4wMTcuNjA2LS4xNzUuMDQ2LS4wMzguMjQ4LS4yMTQuMjA2LS4xNzguMzUtLjMwMy42MTUtLjQ0IDEuMDAzLS40NC4zODggMCAuNjUzLjEzNyAxLjAwMy40NHptLTEuODQyLjE4OHoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="></span><span
																													class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv"
																													src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPC9tYXNrPgogICAgICAgIDx1c2UgZmlsbD0iI0ZGMkY2RSIgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBkPSJNNi43NTQgNi43NTR2LTQuOGgxLjJ2NmgtMy42di0xLjJoMi40eiIgbWFzaz0idXJsKCNiKSIgdHJhbnNmb3JtPSJyb3RhdGUoNDUgNi4xNTQgNC45NTQpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="></span>
																											</div></a>
																									</div>
																									<div
																										class="BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP">
																										<img
																											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
																											width="16px" height="16px" alt="star"><span>${comment.AL_GRADE}</span>
																									</div>
																								</div>
																								<div
																									class="BasicCommentItem__TextBlock-iqy0k7-3 eQRymK">
																									<a lng="ko-KR" class="StylelessLocalLink-s1aqpmgk-1 gdyQIs" href="/ko-KR/comments/69oMvny6VLMal">
																									<div class="TextTruncate__Self-wvv1uj-0 jXBVmV">
																											<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																												style="white-space: pre-line;">${comment.AD_CONTENT}</div>
																										</div></a>
																								</div>
																								<div
																									class="ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd">
																									<span
																										class="ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD"
																										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																										width="18px" height="18px"></span><em>${comment.AD_LIKE}</em>
																								</div>
																								<div
																									class="ContentlessCommentItem__UserActionBlock-s1n6rtl6-4 kJvkpH">
																									<button
																										class="ContentlessCommentItem__UserActionButton-s1n6rtl6-5 kRhZsb StylelessButton-phxvo7-0 gsSopE">좋아요</button>
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
																										
														</section>
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
	</div>

</body>
</html>