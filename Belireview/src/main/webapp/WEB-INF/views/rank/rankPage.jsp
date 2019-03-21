<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="blog">
			<div class="row">
				<div class="col-md-8 blog-content detail">
					<div class="row">
						<div class="col-md-12 blog-block">
							<ul id="myTab" class="nav nav-tabs newest" role="tablist">
								<li role="presentation" class="active"><a href="#1"
									id="cat-1" role="tab" data-toggle="tab" aria-controls="1"
									aria-expanded="true">관객순</a></li>
								<li role="presentation"><a href="#2" role="tab" id="cat-2"
									data-toggle="tab" aria-controls="2">평점순</a></li>
								<li role="presentation"><a href="#3" role="tab" id="cat-3"
									data-toggle="tab" aria-controls="3">조회순</a></li>
							</ul>

							<div id="myTabContent" class="tab-content">
								<!-- 관객순 -->
								<div role="tabpanel" class="tab-pane fade in active" id="1"
									aria-labelledby="cat-1">
									<c:forEach items="${movie_total }" var="list">
										<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}">${list.MOVIE_NAME }</a>
										<br>
									</c:forEach>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="2"
									aria-labelledby="cat-2">
									<c:forEach items="${movie_grade }" var="list">
										<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}">${list.MOVIE_NAME }</a><br>
									</c:forEach>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="3"
									aria-labelledby="cat-3">
									<c:forEach items="${movie_read }" var="list">
										<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.MOVIE_NO}">${list.MOVIE_NAME }</a><br>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 sidebar">
					<div class="sidebar-inner">
						<div>
							<h4>전체 인기검색어</h4>
								<c:forEach items="${rank5_total }" var="list">
									${list.SEARCH_TEXT }<br>
								</c:forEach>
						</div>				
						<div>	
							<h4>영화 인기검색어</h4>
								<c:forEach items="${rank5_movie }" var="list">
									<a href="/brw/movie/movieDetail.br?MOVIE_NO=${list.NO}">${list.SEARCH_TEXT }</a><br>
								</c:forEach>
						</div>
						<div>
							<h4>드라마 인기검색어</h4>
								<c:forEach items="${rank5_drama }" var="list">
									<a href="/brw/drama/dramaDetail.br?DRAMA_NO=${list.NO}">${list.SEARCH_TEXT }</a><br>
								</c:forEach>
						</div>
						<div>
							<h4>배우 인기검색어</h4>
								<c:forEach items="${rank5_actor }" var="list">
									${list.SEARCH_TEXT }<br>
								</c:forEach>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>