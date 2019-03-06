<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/brw/resources/css/detail3.css">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <link rel="stylesheet"  href="/brw/resources/css/lightslider.css"/>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="/brw/resources/js/lightslider.js"></script> 
    <script>
      
    	 $(document).ready(function() {
			$("#content-slider").lightSlider({
                loop:true,
              	auto:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
		});
    </script>
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
												<img src="/brw/resources/images/3-girls.jpg"><!-- 이미지 -->
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
														<h1 class="ContentJumbotron__Title-yf8npk-14 jCFeyL">${map.DRAMA_NAME}</h1><!-- 제목 -->
														<div class="ContentJumbotron__Detail-yf8npk-15 bJHRjP">${map.DRAMA_DATE} ・ ${map.DRAMA_GENRE} ・ ${map.DRAMA_CHANNEL}</div><!-- 개봉일 장르 채널 -->
														<div class="ContentJumbotron__ContentRatings-yf8npk-16 epsYAr">${map.DRAMA_GRADE}&nbsp;&nbsp;・&nbsp;&nbsp;<!-- <em>예상 ★2.7</em> --><!-- 평점 -->
														</div>
														<div
															class="ContentJumbotron__ButtonBlock-yf8npk-17 bqrRYB">
															<div class="ContentActionButton__Self-s1nnw805-0 esugeU">
																<button
																	class="ContentActionButton__ActionButton-s1nnw805-1 kLIPfy StylelessButton-phxvo7-0 gsSopE">
																	<span
																		class="ContentActionButton__StatusWithImage-s1nnw805-2 fUUvwT"><span
																		class="ContentActionButton__StatusImage-s1nnw805-3 eNXtVj UIImg-s3jz6tx-0 ytaVa"
																		src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMjRweCIgaGVpZ2h0PSIyNHB4IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogc2tldGNodG9vbCA1MC4yICg1NTA0NykgLSBodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2ggLS0+CiAgICA8dGl0bGU+NjMwMjYxNEEtQzhBMy00MkMwLTlDQzctQTBEQzNDOEM1NTVDPC90aXRsZT4KICAgIDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4KICAgIDxkZWZzPjwvZGVmcz4KICAgIDxnIGlkPSJJY29ucy0mYW1wOy1Bc3NldHMiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSJJY29uLS8tSWNBZGRXaGl0ZSIgZmlsbD0iI0ZGRkZGRiI+CiAgICAgICAgICAgIDxyZWN0IGlkPSJSZWN0YW5nbGUtMyIgeD0iMTEiIHk9IjQuNSIgd2lkdGg9IjIiIGhlaWdodD0iMTUiIHJ4PSIxIj48L3JlY3Q+CiAgICAgICAgICAgIDxyZWN0IGlkPSJSZWN0YW5nbGUtMy1Db3B5IiB4PSI0LjUiIHk9IjExIiB3aWR0aD0iMTUiIGhlaWdodD0iMiIgcng9IjEiPjwvcmVjdD4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPg=="></span><span
																		class="ContentActionButton__ActionStatus-s1nnw805-4 juRlmb">보고싶어요</span></span>
																</button>
																<button
																	class="ContentActionButton__ActionDropDownButton-s1nnw805-5 honxC StylelessButton-phxvo7-0 gsSopE"
																	aria-label="Open action sheet">
																	<svg
																		class="ArrowDropDown__ArrowDropDownSvg-s1q43qr1-0 jcYGoT"
																		fill="" width="24" height="24" viewBox="0 0 24 24">
																		<path fill="#FFF" fill-rule="evenodd"
																			d="M12 16l6-6H6z"></path></svg>
																</button>
															</div>
														</div>
														<div
															class="ContentJumbotronRatingControl__Self-s1cw42ub-0 hIpgGL">
															<div
																class="ContentJumbotronRatingControl__Title-s1cw42ub-1 hqGvwK">
																<div class="RatingText__Self-s2g271e-0 ccOSgS">평가하기</div>
															</div>
															<div class="RatingControl__Self-s2c1yoc-0 ixVNUo">
																<div
																	class="RatingControl__UnratedStars-s2c1yoc-1 gZASBp">
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
												<div
													class="ContentPage__ContentSectionsBlock-se3skp-7 cllZaN">
													<div class="RoundedCornerBlock-s17n38ib-0 gpSJNR">
														<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<header
																		class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																		<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">내
																			예상별점</h2>
																		<div
																			class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			<div
																				class="ContentReasonSection__MyPredictedRatingBlock-s1eie0l9-0 gLxsYG">
																				★2.7
																				<div
																					class="ProfilePhoto__Self-s1v3isfu-1 fAYBdd RoundedImageBlock-k5m4n5-0 gUZYtN">
																					<div
																						class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 jawsmT"></div>
																					<div
																						class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																						<img
																							class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx"
																							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																							alt="김상협의 사진">
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
																						color="#00aae6">#장르</span>
																						<span class="Tag__TagLink-u797lx-0 dDivuT"
																						color="#ff8644">#장르</span>
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
																				<a href="/brw/movie/movieInfo.br">더보기</a>
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
																			class="ContentOverviewSection__Summary-s1yclw10-1 kdMFQv">${map.DRAMA_NAME} <br>
																			<span
																				class="ContentOverviewSection__OverviewMeta-s1yclw10-2 bvwFIW">${map.DRAMA_DATE}
																				· ${map.DRAMA_CHANNEL} · ${map.DRAMA_GENRE}</span><br>
																			<span
																				class="ContentOverviewSection__OverviewMeta-s1yclw10-2 bvwFIW">${map.DRAMA_EPISODE}</span>
																		</div>
																		<div class="TextTruncate__Self-wvv1uj-0 bzjOJW">
																			<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																				style="white-space: pre-line;">${map.DRAMA_CONTENT}</div>
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
																					<li
																						class="ListItemWithProfilePhoto__Self-s1a35ruo-0 GRmjI"><a
																						lng="ko-KR"
																						class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD"
																						title="장재현" href="/ko-KR/people/167398"><div
																								class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																								<div
																									class="ProfilePhoto__Self-s1v3isfu-1 cKevdV RoundedImageBlock-k5m4n5-0 gUZYtN">
																									<div
																										class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 ctlVML"></div>
																									<div
																										class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																										<img
																											class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx"
																											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																											alt="장재현의 사진">
																									</div>
																								</div>
																							</div>
																							<div
																								class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																								<div
																									class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																									<div
																										class="ListItemWithProfilePhoto__Title-s1a35ruo-1 cSGZfW">${map.DRAMA_DIRECTOR}</div>
																									<div
																										class="ListItemWithProfilePhoto__Subtitle-s1a35ruo-2 cbqRVo">감독</div>
																								</div>
																								<div></div>
																							</div></a></li>
																					<li class="ListItemWithProfilePhoto__Self-s1a35ruo-0 GRmjI"><a
																						lng="ko-KR"
																						class="InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD"
																						title="이다윗" href="/ko-KR/people/193392"><div
																								class="InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr">
																								<div
																									class="ProfilePhoto__Self-s1v3isfu-1 cKevdV RoundedImageBlock-k5m4n5-0 gUZYtN">
																									<div
																										class="ProfilePhoto__ProfilePhotoImage-s1v3isfu-0 iEEsou"></div>
																									<div
																										class="ProfilePhoto__DefaultImageContainer-s1v3isfu-2 kPGxuy">
																										<img
																											class="defaultImage__ProfileImg-s1kn91bx-1 iaxVtx"
																											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iI0UwRTBFMCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0yNCAyMS4yNzhhOC41NyA4LjU3IDAgMCAxLTguNTcxLTguNTdBOC41NzEgOC41NzEgMCAxIDEgMjQgMjEuMjc3TTQzLjUxOSA0My44NjVjLjU2NCAwIDEuMDMzLS40NjggMS4wMDMtMS4wMzFDNDMuOTYzIDMyLjQyNCAzNC45ODkgMjQuMTUgMjQgMjQuMTVjLTEwLjk4OSAwLTE5Ljk2MyA4LjI3NC0yMC41MjIgMTguNjgzLS4wMy41NjMuNDM5IDEuMDMgMS4wMDMgMS4wM2gzOS4wMzh6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																											alt="이다윗의 사진">
																									</div>
																								</div>
																							</div>
																							<div class="InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr">
																								<div
																									class="InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI">
																									<div
																										class="ListItemWithProfilePhoto__Title-s1a35ruo-1 cSGZfW">이다윗</div>
																									<div
																										class="ListItemWithProfilePhoto__Subtitle-s1a35ruo-2 cbqRVo">조연</div>
																								</div>
																								<div></div>
																							</div></a></li>
																					<div class="StackableUl__SpinnerContainer-gafxvv-0 gddnxb"></div>
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
																	direction="right">
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
																			${map.DRAMA_GRADE}<br>
																		<strong>(3만명)</strong>
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
																		<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl">4000+</span>
																		<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
																				<a href="/brw/movie/movieComment.br">더보기</a>
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
																				<ul class="ContentCommentsSection__CommentHorizontalUl-s5mwulc-1 kBYzWA HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 kJrumC VisualUl-s1vzev56-0 hgAYVH">
																					<c:forEach items="${comment}" var="comment"> <!-- 코멘트 -->
																					<li class="HorizontalListItem-tt0z2b-0 hRbPKu">
																						<div class="BasicCommentItem__Comment-iqy0k7-0 UuRdd">
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
						                                                                              <div class="UserNameWithBadges__Self-s1bd3hgj-0 brZhrQ"> ${comment.ID}
						                                                                              <span class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 eBREVF"
						                                                                                    src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgICAgICA8cGF0aCBpZD0iYyIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPC9tYXNrPgogICAgICAgIDx1c2UgZmlsbD0iIzNEM0QzRCIgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBkPSJNMy40IDIuOGgxLjJ2OUgzLjR6TTUuOCA1LjJIN3Y3LjJINS44ek04LjIgNy42aDEuMnY0LjhIOC4yeiIgbWFzaz0idXJsKCNiKSIvPgogICAgICAgIDxwYXRoIGZpbGw9IiNGRkYiIGQ9Ik04LjIgNy42SDEzdjEuMkg4LjJ6TTUuOCA1LjJIMTN2MS4ySDUuOHpNMy40IDIuOGg5VjRoLTl6IiBtYXNrPSJ1cmwoI2IpIi8+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjM0QzRDNEIiBzdHJva2Utb3BhY2l0eT0iLjE1IiBzdHJva2Utd2lkdGg9Ii4yNSIgZD0iTTcuMDAzIDEwLjk3NmMtLjA0MS0uMDM2LjE2LjE0LjIwNi4xNzguMjMyLjE5Mi4zOS4yNDUuNjA2LjE3NS4yNDgtLjA4LjMyOC0uMjIyLjQyMy0uNjQ0LjA0MS0uMTguMDUtLjIyLjA3NS0uMzA0LjA5NS0uMzI5LjI0Mi0uNTY5LjUwNS0uNzYuMDM4LS4wMjguMDc2LS4wNTIuMTE1LS4wNzUuMzA0LS4xNzYuNTUzLS4xOTcgMS4wMzctLjE1Mi40NzUuMDQ0LjYyNi4wMTcuNzgzLS4yYS40OC40OCAwIDAgMCAuMTAxLS4zMTdjLS4wMDUtLjEyOS0uMDM0LS4yMS0uMTY4LS41MjMtLjE5OC0uNDYxLS4yNS0uNzQ5LS4xMjYtMS4xMy4xMTQtLjM1Mi4zMjEtLjU2Ny42NzctLjc4OC4wNDctLjAyOS4xMDQtLjA2My4yMDItLjEyLjMyNi0uMTk3LjQzNi0uMzI1LjQzNi0uNTc1IDAtLjI0OS0uMTEtLjM3Ny0uNDM2LS41NzNhMTQuMDAzIDE0LjAwMyAwIDAgMS0uMjAyLS4xMjFjLS4zNTYtLjIyMS0uNTYzLS40MzYtLjY3Ny0uNzg3LS4xMjQtLjM4My0uMDcyLS42Ny4xMjYtMS4xMzIuMTM0LS4zMTMuMTYzLS4zOTMuMTY4LS41MjJhLjQ4LjQ4IDAgMCAwLS4xMDEtLjMxOGMtLjE1Ny0uMjE2LS4zMDgtLjI0My0uNzgzLS4yLS40ODQuMDQ2LS43MzMuMDI1LTEuMDM3LS4xNTFhMS4zMjYgMS4zMjYgMCAwIDEtLjExNS0uMDc1Yy0uMjYzLS4xOTEtLjQxLS40MzEtLjUwNS0uNzZhNC4zOTIgNC4zOTIgMCAwIDEtLjA3NS0uMzA0QzguMTQzLjM3NiA4LjA2My4yMzQgNy44MTUuMTU0IDcuNi4wODQgNy40NDEuMTM3IDcuMjEuMzI5Yy0uMDQ2LjAzNy0uMjQ4LjIxNC0uMjA2LjE3OC0uMzUuMzAzLS42MTUuNDQtMS4wMDMuNDQtLjM4OCAwLS42NTMtLjEzNy0xLjAwMy0uNDQuMDQxLjAzNi0uMTYtLjE0LS4yMDYtLjE3OC0uMjMyLS4xOTItLjM5LS4yNDUtLjYwNi0uMTc1LS4yNDguMDgtLjMyOC4yMjItLjQyMy42NDQtLjA0MS4xOC0uMDUuMjItLjA3NS4zMDQtLjA5NS4zMjktLjI0Mi41NjktLjUwNS43NmExLjMyNiAxLjMyNiAwIDAgMS0uMTE1LjA3NWMtLjMwNC4xNzYtLjU1My4xOTctMS4wMzcuMTUyLS40NzUtLjA0NC0uNjI2LS4wMTctLjc4My4yYS40OC40OCAwIDAgMC0uMTAxLjMxN2MuMDA1LjEyOS4wMzQuMjEuMTY4LjUyMi4xOTguNDYyLjI1Ljc1LjEyNiAxLjEzMi0uMTE0LjM1LS4zMjEuNTY2LS42NzcuNzg3bC0uMjAyLjEyYy0uMzI2LjE5Ny0uNDM2LjMyNS0uNDM2LjU3NCAwIC4yNS4xMS4zNzguNDM2LjU3NGwuMjAyLjEyMWMuMzU2LjIyLjU2My40MzYuNjc3Ljc4Ny4xMjQuMzgyLjA3Mi42Ny0uMTI2IDEuMTMxLS4xMzQuMzE0LS4xNjMuMzk0LS4xNjguNTIzYS40OC40OCAwIDAgMCAuMTAxLjMxOGMuMTU3LjIxNi4zMDguMjQzLjc4My4yLjQ4NC0uMDQ2LjczMy0uMDI1IDEuMDM3LjE1MS4wMzkuMDIzLjA3Ny4wNDcuMTE1LjA3NS4yNjMuMTkxLjQxLjQzMS41MDUuNzYuMDI0LjA4NC4wMzQuMTIzLjA3NS4zMDQuMDk1LjQyMi4xNzUuNTY0LjQyMy42NDQuMjE2LjA3LjM3NC4wMTcuNjA2LS4xNzUuMDQ2LS4wMzguMjQ4LS4yMTQuMjA2LS4xNzguMzUtLjMwMy42MTUtLjQ0IDEuMDAzLS40NC4zODggMCAuNjUzLjEzNyAxLjAwMy40NHptLTEuODQyLjE4OHoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="></span><span
						                                                                                    class="UserNameWithBadges__SmallBadge-s1bd3hgj-1 bAndNa UIImg-s3jz6tx-0 kyuoIv"
						                                                                                    src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTYgMTAuNjYxYy0uOTI3IDAtMS4xMzEgMS4wMjItMS44NTQuNzg3LS43MjMtLjIzNS0uMjg4LTEuMTgxLTEuMDM4LTEuNzI2LS43NS0uNTQ1LTEuNTE1LjE2MS0xLjk2Mi0uNDU0LS40NDctLjYxNS40NjEtMS4xMjUuMTc1LTIuMDA2QzEuMDM0IDYuMzggMCA2LjUwMiAwIDUuNzQyczEuMDM0LS42NCAxLjMyLTEuNTJjLjI4Ny0uODgzLS42Mi0xLjM5Mi0uMTc0LTIuMDA3LjQ0Ny0uNjE1IDEuMjEyLjA5MSAxLjk2Mi0uNDU0UzMuNDIzLjI3IDQuMTQ2LjAzNUM0Ljg2OS0uMiA1LjA3My44MjEgNiAuODIxUzcuMTMxLS4xOTkgNy44NTQuMDM1Yy43MjMuMjM1LjI4OCAxLjE4MSAxLjAzOCAxLjcyNi43NS41NDUgMS41MTUtLjE2MSAxLjk2Mi40NTQuNDQ3LjYxNS0uNDYxIDEuMTI0LS4xNzUgMi4wMDYuMjg3Ljg4MiAxLjMyMS43NiAxLjMyMSAxLjUycy0xLjAzNC42NC0xLjMyIDEuNTJjLS4yODcuODgyLjYyIDEuMzkyLjE3NCAyLjAwNy0uNDQ3LjYxNS0xLjIxMi0uMDkxLTEuOTYyLjQ1NHMtLjMxNSAxLjQ5LTEuMDM4IDEuNzI2Yy0uNzIzLjIzNS0uOTI3LS43ODctMS44NTQtLjc4N3oiLz4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPC9tYXNrPgogICAgICAgIDx1c2UgZmlsbD0iI0ZGMkY2RSIgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBkPSJNNi43NTQgNi43NTR2LTQuOGgxLjJ2NmgtMy42di0xLjJoMi40eiIgbWFzaz0idXJsKCNiKSIgdHJhbnNmb3JtPSJyb3RhdGUoNDUgNi4xNTQgNC45NTQpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="></span>
						                                                                              </div></a>
						                                                                        </div>
						                                                                        <div
						                                                                           class="BasicCommentItem__UserActionStatus-iqy0k7-4 cMGqAP">
						                                                                           <img
						                                                                              src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
						                                                                              width="16px" height="16px" alt="star"><span>2.5</span>
						                                                                        </div>
						                                                                     </div>
						                                                                     <div
						                                                                        class="BasicCommentItem__TextBlock-iqy0k7-3 eQRymK">
						                                                                        <a lng="ko-KR"
						                                                                           class="StylelessLocalLink-s1aqpmgk-1 gdyQIs"
						                                                                           href="/ko-KR/comments/69oMvny6VLMal"><div
						                                                                              class="TextTruncate__Self-wvv1uj-0 jXBVmV">
						                                                                              <div
						                                                                                 class="TextTruncate__Text-wvv1uj-1 gLsCNn"
						                                                                                 style="white-space: pre-line;">${comment.DC_CONTENT}</div>
						                                                                           </div></a>
						                                                                     </div>
						                                                                     <div
						                                                                        class="ContentlessCommentItem__LikeReplyBlock-s1n6rtl6-1 bSwpdd">
						                                                                        <span class="ContentlessCommentItem__LikeImage-s1n6rtl6-2 jmhzoz UIImg-s3jz6tx-0 jSJJRD"
						                                                                           src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
						                                                                           width="18px" height="18px"></span><em>${comment.DC_LIKE}</em>
						                                                                     </div>
						                                                                     <div
						                                                                        class="ContentlessCommentItem__UserActionBlock-s1n6rtl6-4 kJvkpH">
						                                                                        <button
						                                                                           class="ContentlessCommentItem__UserActionButton-s1n6rtl6-5 kRhZsb StylelessButton-phxvo7-0 gsSopE">좋아요</button>
						                                                                     </div>
						                                                                  </div></li>
																						</c:forEach>
																					<div
																						class="SpinnerContainer__Self-s16nvp7b-0 dvymnj"></div>
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
																	direction="right">
																</div>
															</div>
															<div class="Grid-zydj2q-0 cspjno">
																<div class="Row-s1apwm9x-0 lowZpE">
																	<hr
																		class="Divider__StylingMergedDivider-s11un6bw-1 kAeKXS Divider-s11un6bw-0 cVxSEp">
																</div>
															</div>
														</section>
													</div>
												</div>
											</div>
										
												<div class="RoundedCornerBlock-s17n38ib-0 iyaHUY">
													<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
														<div class="Grid-zydj2q-0 cspjno">
															<div class="Row-s1apwm9x-0 lowZpE">
																<header
																	class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																	<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">갤러리</h2>
																	<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl">703</span>
																	<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			
																		</div>
																</header>
															</div>
														</div>
														 <div
															class="PrimitiveHorizontalScrollable__ScrollBarContainer-hy4esm-0 hUyjJn">
																<div class="item">
																	<ul id="content-slider" class="content-slider">
																		<li>
																			<h3>1</h3>
																		</li>
																		<li>
																			<h3>2</h3>
																		</li>
																		<li>
																			<h3>3</h3>
																		</li>
																		<li>
																			<h3>4</h3>
																		</li>
																		<li>
																			<h3>5</h3>
																		</li>
																		<li>
																			<h3>6</h3>
																		</li>
																	</ul>
																</div>
												
											<div class="MaxWidthCol-s1fpp771-0 fGpdkH">
												<div class="RoundedCornerBlock-s17n38ib-0 iyaHUY">
													<section class="SectionWithHeader__Self-s1eyxltb-0 gAYeFO">
														<div class="Grid-zydj2q-0 cspjno">
															<div class="Row-s1apwm9x-0 lowZpE">
																<header
																	class="SectionWithHeader__Header-s1eyxltb-1 cuiACK">
																	<h2 class="SectionWithHeader__Title-s1eyxltb-2 kwjefp">비슷한 장르</h2>
																	<span class="TitleSuffixForNumber-l2d30g-0 ejtPKl">703</span>
																	<div class="SectionWithHeader__TopRight-s1eyxltb-3 bZaEfL">
																			<div class="SectionWithViewMore__ViewMore-xtbl7q-0 bhbIbv">
																				<a href="/brw/movie/movieComment.br">더보기</a>
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
																				class="ContentDeckSection__DeckHorizontalUl-s1xkjjf8-0 dGBnhH HorizontalUl__StyledHorizontalUl-s1lfz4bc-0 eVxIzP VisualUl-s1vzev56-0 hgAYVH">
																				<li
																					class="ContentDeckSection__DeckCollage-s1xkjjf8-1 eHppBK HorizontalListItem-tt0z2b-0 hRbPKu"><a
																					lng="ko-KR" title="단 1%의 반전이라도!!!!!!"
																					href="/ko-KR/decks/SAzhL1LStc7d"><div
																							class="ContentDeckSection__DeckPostersBlock-s1xkjjf8-2 hTJJpD">
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="209"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="210"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="211"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="212"></span>
																							</div>
																						</div>
																						<ul
																							class="ContentDeckSection__DeckInfo-s1xkjjf8-3 eoOquJ VisualUl-s1vzev56-0 hgAYVH">
																							<li
																								class="ContentDeckSection__DeckTitle-s1xkjjf8-4 gGVjvL"><div
																									class="TextTruncate__Self-wvv1uj-0 laNFWG">
																									<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																										style="white-space: pre-line;">단 1%의
																										반전이라도!!!!!!</div>
																								</div></li>
																							<li
																								class="ContentDeckSection__DeckLikeCount-s1xkjjf8-5 iKvIaj">좋아요
																								2426</li>
																						</ul></a></li>
																				<li
																					class="ContentDeckSection__DeckCollage-s1xkjjf8-1 eHppBK HorizontalListItem-tt0z2b-0 hRbPKu"><a
																					lng="ko-KR" title="2016/7/1 ~~"
																					href="/ko-KR/decks/rwZdNJ0krzvO"><div
																							class="ContentDeckSection__DeckPostersBlock-s1xkjjf8-2 hTJJpD">
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="213"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="214"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="215"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="216"></span>
																							</div>
																						</div>
																						<ul
																							class="ContentDeckSection__DeckInfo-s1xkjjf8-3 eoOquJ VisualUl-s1vzev56-0 hgAYVH">
																							<li
																								class="ContentDeckSection__DeckTitle-s1xkjjf8-4 gGVjvL"><div
																									class="TextTruncate__Self-wvv1uj-0 laNFWG">
																									<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																										style="white-space: pre-line;">2016/7/1
																										~~</div>
																								</div></li>
																							<li
																								class="ContentDeckSection__DeckLikeCount-s1xkjjf8-5 iKvIaj">좋아요
																								94</li>
																						</ul></a></li>
																				<li
																					class="ContentDeckSection__DeckCollage-s1xkjjf8-1 eHppBK HorizontalListItem-tt0z2b-0 hRbPKu"><a
																					lng="ko-KR" title="Honest 박정민"
																					href="/ko-KR/decks/pytrFLcewdqw"><div
																							class="ContentDeckSection__DeckPostersBlock-s1xkjjf8-2 hTJJpD">
																							<div
																								class="ContentPosterWithFallbackImg__FallbackImg-s1d414re-0 gJWbRf"
																								src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0Q0RDRENCIgZD0iTTQyIDQxLjI1aC01LjM4MnYtNy41NjZoNi42MzJWNDBjMCAuNjg5LS41NjEgMS4yNS0xLjI1IDEuMjV6TTQuNzUgNDB2LTYuMzE2aDYuNjMydjcuNTY2SDZjLS42ODkgMC0xLjI1LS41NjEtMS4yNS0xLjI1ek02IDYuNzVoNS4zODJ2Ny41NjZINC43NVY4YzAtLjY4OS41NjEtMS4yNSAxLjI1LTEuMjV6TTQzLjI1IDh2Ni4zMTZoLTYuNjMyVjYuNzVINDJjLjY4OSAwIDEuMjUuNTYxIDEuMjUgMS4yNXptLTYuNjMyIDI0LjE4NGg2LjYzMlYyNC43NWgtNi42MzJ2Ny40MzR6TTEyLjg4MiA0MS4yNWgyMi4yMzZ2LTE2LjVIMTIuODgydjE2LjV6TTQuNzUgMzIuMTg0aDYuNjMyVjI0Ljc1SDQuNzV2Ny40MzR6bTAtOC45MzRoNi42MzJ2LTcuNDM0SDQuNzV2Ny40MzR6bTguMTMyIDBoMjIuMjM2VjYuNzVIMTIuODgydjE2LjV6bTIzLjczNiAwaDYuNjMydi03LjQzNGgtNi42MzJ2Ny40MzR6TTQyIDUuMjVINkEyLjc1MiAyLjc1MiAwIDAgMCAzLjI1IDh2MzJBMi43NTIgMi43NTIgMCAwIDAgNiA0Mi43NWgzNkEyLjc1MiAyLjc1MiAwIDAgMCA0NC43NSA0MFY4QTIuNzUyIDIuNzUyIDAgMCAwIDQyIDUuMjV6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo="></div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="217"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="218"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="219"></span>
																							</div>
																						</div>
																						<ul
																							class="ContentDeckSection__DeckInfo-s1xkjjf8-3 eoOquJ VisualUl-s1vzev56-0 hgAYVH">
																							<li
																								class="ContentDeckSection__DeckTitle-s1xkjjf8-4 gGVjvL"><div
																									class="TextTruncate__Self-wvv1uj-0 laNFWG">
																									<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																										style="white-space: pre-line;">Honest
																										박정민</div>
																								</div></li>
																							<li
																								class="ContentDeckSection__DeckLikeCount-s1xkjjf8-5 iKvIaj">좋아요
																								87</li>
																						</ul></a></li>
																				<li
																					class="ContentDeckSection__DeckCollage-s1xkjjf8-1 eHppBK HorizontalListItem-tt0z2b-0 hRbPKu"><a
																					lng="ko-KR" title="IN THE CINEMA"
																					href="/ko-KR/decks/4Y0spXPuIie6"><div
																							class="ContentDeckSection__DeckPostersBlock-s1xkjjf8-2 hTJJpD">
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="220"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="221"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="222"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="223"></span>
																							</div>
																						</div>
																						<ul
																							class="ContentDeckSection__DeckInfo-s1xkjjf8-3 eoOquJ VisualUl-s1vzev56-0 hgAYVH">
																							<li
																								class="ContentDeckSection__DeckTitle-s1xkjjf8-4 gGVjvL"><div
																									class="TextTruncate__Self-wvv1uj-0 laNFWG">
																									<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																										style="white-space: pre-line;">IN THE
																										CINEMA</div>
																								</div></li>
																							<li
																								class="ContentDeckSection__DeckLikeCount-s1xkjjf8-5 iKvIaj">좋아요
																								54</li>
																						</ul></a></li>
																				<li
																					class="ContentDeckSection__DeckCollage-s1xkjjf8-1 eHppBK HorizontalListItem-tt0z2b-0 hRbPKu"><a
																					lng="ko-KR" title="신"
																					href="/ko-KR/decks/SIycdWakv3Ju"><div
																							class="ContentDeckSection__DeckPostersBlock-s1xkjjf8-2 hTJJpD">
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="224"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="225"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="226"></span>
																							</div>
																							<div
																								class="LazyLoadingBackground__StylingMerged-cgbyi4-2 fiwrWr LazyLoadingBackground__Self-cgbyi4-0 dxPvni">
																								<span
																									class="LazyLoadingBackground__BackgroundImage-cgbyi4-1 bqtNip"
																									data-background-image-id="227"></span>
																							</div>
																						</div>
																						<ul
																							class="ContentDeckSection__DeckInfo-s1xkjjf8-3 eoOquJ VisualUl-s1vzev56-0 hgAYVH">
																							<li
																								class="ContentDeckSection__DeckTitle-s1xkjjf8-4 gGVjvL"><div
																									class="TextTruncate__Self-wvv1uj-0 laNFWG">
																									<div class="TextTruncate__Text-wvv1uj-1 gLsCNn"
																										style="white-space: pre-line;">신</div>
																								</div></li>
																							<li
																								class="ContentDeckSection__DeckLikeCount-s1xkjjf8-5 iKvIaj">좋아요
																								43</li>
																						</ul></a></li>
																				<div
																					class="SpinnerContainer__Self-s16nvp7b-0 dvymnj"></div>
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
																direction="right">
															</div>
														</div>
													</section>
													<div></div>
												</div>
											</div>
										</div>
										<div
											class="ContentPage__HiddenBlockOnlyMdScreen-se3skp-10 jVScZl"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
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
		src="https://d2rlq84xifqisi.cloudfront.net/javascripts/web.252a3d891922d57180ff.js"
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
					src="https://staticxx.facebook.com/connect/xd_arbiter/r/vy-MhgbfL4v.js?version=44#channel=f1d875ef1e50e5c&amp;origin=https%3A%2F%2Fwatcha.com"
					style="border: none;"></iframe>
			</div>
		</div>
	</div>
</body>
</html>