<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link rel="stylesheet" href="/brw/resources/css/list.css">
</head>
<body>
	<div class="row a">
		<c:forEach items="${list}" var="movieList" >
			 <div class="col-sm-6 col-md-3">
			 	<a href="/brw/movie/movieDetail.br">
			    <div class="thumbnail">
			      <img src="/brw/resources/images/3-girls.jpg">
			      <div class="caption">
			         <h3>${movieList.MOVIE_NAME}</h3>
			        <p>${movieList.MOVIE_DATE}・${movieList.MOVIE_COUNTRY}・${movieList.MOVIE_GENRE}</p>
			      </div>
			    </div>
			    </a>
			  </div>
		  </c:forEach> 
	</div>
</body>
</html>