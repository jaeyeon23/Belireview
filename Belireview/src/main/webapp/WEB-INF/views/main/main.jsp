<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	/* function realtime() {
		var list = null;
		
		alert("ggg");
		
		$.ajax({
			url : "/brw/realtimeAjax.br?${_csrf.parameterName}=${_csrf.token}",
			dataType: "json",
			async : false,
			success: function(data){
				var result = data.json;
				
				$.each(result, function(idx, val) {
					alert(val.SEARCH_TEXT);
				});
			}
		});
		
		alert("test");
		
		setTimeout("realtime()", 10000);
	}
	
	window.onload = function() {
		realtime();
	} */
	
	 $(function() {
			if ("${ID}" == "") {//비로그인
				$(".vv").click(function(e) {//보고싶어요
					e.preventDefault();
					alert("로그인 해주세요.");
					location.href = "<c:url value='/member/loginForm.br?${_csrf.parameterName}=${_csrf.token}' />"
				});
			
			} else {//로그인
				//작동 버튼 시작 post
				$(".vv").click(function(e) {//보고싶어요
					e.preventDefault();
					var no = $(this).attr('value');
					var type = $(this).attr('value2');
					like(no,type);
				});
			}
		}); //작동 버튼 끝 
		
		
		function like(no,type) {
			var id = "${ID}";
			$.ajax({
				type : 'POST',
				data : (type=="d") ? {DRAMA_NO:no,ID:id}:{MOVIE_NO:no ,ID:id},
				url:"<c:url value='/like.br?${_csrf.parameterName}=${_csrf.token}'/>",
				success : function(result){
				}
			})
		}
</script>
</head>

<body>
	<!-- Slider start -->
	<div id="main-slider">
		<div id="home-slider" class="owl-carousel owl-theme">
			<div class="item">
				<img src="/brw/resources/images/main_slide1.jpg" alt="slide-1"
					class="img-responsive">
				<div class="slider-desc">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="slide-offers-left">
									<div class="slide-offers-title">
										<span>드라마</span>
									</div>
									<p>
										<font color="black">도깨비<br />arraival in believe store</font>
									</p>
									<a href="/brw/drama/dramaList.br" class="btn btn-blue">리뷰보러가기</a>
								</div>
							</div>
							<!-- 
							<div class="col-md-6">
								<div class="slide-offers-right">
									<div class="slide-offers-title">
										<span>영화</span><br />FASHION
									</div>
									<p>
										New & Fvhresh collection<br />arraival in believe store
									</p>
									<a href="/brw/movie/movieList.br" class="btn btn-magenta">영화</a>
								</div>
							</div>
							 -->
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="/brw/resources/images/main_slide2.jpg" alt="slide-2"
					class="img-responsive">
				<div class="slider-desc">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="slide-offers-left">
									<div class="slide-offers-title">
										<span>광고</span><br />for online order
									</div>
									<p>
										New & Fvhresh collection<br />arraival in believe store
									</p>
									<a href="/brw/ad/adList.br" class="btn btn-blue">AD</a>
								</div>
							</div>
							<div class="col-md-6"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="/brw/resources/images/main_slide3.jpg" alt="slide-2"
					class="img-responsive">
				<div class="slider-desc">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="slide-offers-left">
									<div class="slide-offers-title">
										<span>영화</span><br />보헤미안 랩소디
									</div>
									<p>
										New & Fvhresh collection<br />arraival in believe store
									</p>
									<a href="/brw/ad/adList.br" class="btn btn-blue">리뷰보러가기</a>
								</div>
							</div>
							<div class="col-md-6"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Slider end -->

	<div id="content">
		<!-- Content -->
		<div class="container">
			<div class="home-content">
				<div class="cat-offers">
					<div class="row">
						<div class="col-md-4">
							<div class="cat-sec-1">
								<img src="/brw/resources/images/movie_cinema.jpg"
									class="img-responsive" alt="">
								<div class="cat-desc">
									<div class="cat-inner">
										<div class="cat-title">
											<font color="white">MOVIE</font>
										</div>
										<a href="/brw/movie/movieList.br" class="btn btn-border"><font color="white">Show Now</font></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="cat-sec-2">
								<img src="/brw/resources/images/drama_image.jpg"
									class="img-responsive" alt="">
								<div class="cat-desc">
									<div class="cat-inner">
										<div class="cat-title">
											DRAMA
										</div>
										<a href="/brw/drama/dramaList.br" class="btn btn-border">Show Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="cat-sec-3">
								<img src="/brw/resources/images/cat-3.jpg"
									class="img-responsive" alt="">
								<div class="cat-desc">
									<div class="cat-inner">
										<div class="cat-title">
											ADVERTISEMENT
										</div>
										<a href="/brw/ad/adList.br" class="btn btn-border">Show Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="newest">
			<div class="container">
				<div class="newest-content">
					<div class="newest-tab">
						<ul id="myTab" class="nav nav-tabs newest" role="tablist">
							<li role="presentation" class="active"><a href="#1"
								id="cat-1" role="tab" data-toggle="tab" aria-controls="1"
								aria-expanded="true">Drama</a></li>
							<li role="presentation"><a href="#2" role="tab" id="cat-2"
								data-toggle="tab" aria-controls="2">Movie</a></li>
							<li role="presentation"><a href="#3" role="tab" id="cat-3"
								data-toggle="tab" aria-controls="3">Advertisement</a></li>
						</ul>
			
						<div id="myTabContent" class="tab-content">
							<!-- drama start -->
							<div role="tabpanel" class="tab-pane fade in active" id="1"	aria-labelledby="cat-1">
								<div class="row clearfix">
									<c:forEach items="${drama_list }" var="list" varStatus="status">
										<div class="col-md-3 prdct-grid">
											<div class="product-fade">
												<div class="product-fade-wrap">
													<%-- <div id="product-image${status.index + 1 }" class="owl-carousel owl-theme"> --%>
		                                        	<c:forTokens items="${list.DRAMA_POSTER_IMAGE }" var="image" delims=", ">
			                                            <div class="item"><img src="/brw/resources/images/drama/poster/${image }" alt="" class="img-responsive"></div>
			                                        </c:forTokens>
			                                        <!-- </div> -->
													<div class="product-fade-ct">
			                                        	<div class="product-fade-control">
				                                            <div class="to-left">
				                                                <a href="" class="vv" value="${list.DRAMA_NO}" value2="d"><i class="fa fa-heart"></i></a>
				                                                <a href="/brw/mainSearch.br?searchText=${list.DRAMA_NAME}" ><i class="fa fa-search"></i></a>
				                                            </div>
			                                                <div class="clearfix"></div>
			                                               	<a href="/brw/drama/dramaDetail.br?DRAMA_NO=${list.DRAMA_NO}" class="btn btn-to-cart"><span>자세히 보기</span><div class="clearfix"></div></a>
			                                            </div>
													</div>
												</div>
			                                </div>
			                                <div class="product-name">
												<a href="">${list.DRAMA_NAME }</a>
											</div>
			                            </div>
									</c:forEach>
								</div>
							</div>
							<!-- drama end -->
							
							<!-- movie start -->
							<div role="tabpanel" class="tab-pane fade" id="2" aria-labelledby="cat-2">
								<div class="row clearfix">
									<c:forEach items="${movie_list }" var="list" varStatus="status">
										<div class="col-md-3 prdct-grid">
											<div class="product-fade">
												<div class="product-fade-wrap">
													<%-- <div id="product-image${status.index + 1 }" class="owl-carousel owl-theme"> --%>
		                                        	<c:forTokens items="${list.MOVIE_POSTER_IMAGE }" var="image" delims=", ">
			                                            <div class="item"><img src="/brw/resources/images/movie/poster/${image }" alt="" class="img-responsive"></div>
			                                        </c:forTokens>
			                                        <!-- </div> -->
													<div class="product-fade-ct">
			                                        	<div class="product-fade-control">
				                                            <div class="to-left">
				                                                <a href="" class="vv" value="${list.MOVIE_NO}" value2="m"><i class="fa fa-heart"></i></a>
				                                                <a href="/brw/mainSearch.br?searchText=${list.MOVIE_NAME}" ><i class="fa fa-search"></i></a>
				                                            </div>
			                                                <div class="clearfix"></div>
			                                               	<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}" class="btn btn-to-cart"><span>자세히 보기</span><div class="clearfix"></div></a>
			                                            </div>
													</div>
												</div>
			                                </div>
			                                <div class="product-name">
												<a href="">${list.MOVIE_NAME }</a>
											</div>
			                            </div>
									</c:forEach>
								</div>
							</div>
							<!-- movie end -->
							
							<!-- ad start -->
							<div role="tabpanel" class="tab-pane fade" id="3" aria-labelledby="cat-3">
								<div class="row clearfix">
									<c:forEach items="${ad_list }" var="list" varStatus="status">
										<div class="col-md-3 prdct-grid">
											<div class="product-fade">
												<div class="product-fade-wrap">
													<%-- <div id="product-image${status.index + 1 }" class="owl-carousel owl-theme"> --%>
		                                        	<c:forTokens items="${list.AD_POSTER_IMAGE }" var="image" delims=", ">
			                                            <div class="item"><img src="${list.AD_POSTER_IMAGE}" alt="" class="img-responsive"></div>
			                                        </c:forTokens>
			                                        <!-- </div> -->
													<div class="product-fade-ct">
			                                        	<div class="product-fade-control">
				                                            <div class="to-left">
				                                                <a href="/brw/mainSearch.br?searchText=${list.AD_NAME}" ><i class="fa fa-search"></i></a>
				                                            </div>
			                                                <div class="clearfix"></div>
			                                               	<a href="/brw/ad/adDetail.br?AD_NO=${list.AD_NO}" class="btn btn-to-cart"><span>자세히 보기</span><div class="clearfix"></div></a>
			                                            </div>
													</div>
												</div>
			                                </div>
			                                <div class="product-name">
												<a href="">${list.AD_NAME }</a>
											</div>
			                            </div>
									</c:forEach>
								</div>
							</div>
							<!-- ad end -->
						</div>
		           </div>
              </div>
          </div>
      </div>

	<div class="brands">
		<div class="container">
			<div class="brands-inner">
				<div class="brand-title">
					<span>Brands</span>
				</div>

				<div id="slider-home">
					<!-- Slider -->
					<div id="brand-carousel" class="owl-carousel owl-theme">
						<div class="item">
							<img src="/brw/resources/images/brand/kbs.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/sbs.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/mbc.jpg" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/jtbc.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/tvn.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/cjenm.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/lotte.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/netfilx.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/watcha.png" alt="slide-1"
								class="img-responsive">
						</div>
						<div class="item">
							<img src="/brw/resources/images/brand/new.png" alt="slide-1"
								class="img-responsive">
						</div>
					</div>
				</div>
				<!-- Slider -->

			</div>
		</div>
	</div>
	
	<div class="content-offers">
		<div class="container">
			<div class="ct-offers">
				<div class="ct-offers-title">
					Tommy Hilfiger<br />Women’s
				</div>
				<p>The generated Lorem Ipsum is therefore always free from
					repetition, injected humour</p>
				<a href="" class="btn btn-blue">Discover more Product</a>
			</div>
		</div>
	</div>
	</div>
	<!-- Content -->
	
	<div>
		<c:forEach items="${realtime }" var="list">
			<div>${list.SEARCH_TEXT }</div>
		</c:forEach>
	</div>
</body>
</html>
