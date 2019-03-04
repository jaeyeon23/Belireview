<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link rel="stylesheet" href="/brw/resources/css/list.css">
</head>
<body>
	<div class="row a">
		<%-- <c:forEach var="liist" items="" varStatus="stat"> --%>
			 <div class="col-sm-6 col-md-3">
			 	<a href="/brw/movie/movieDetail.br">
			    <div class="thumbnail">
			      <img src="/brw/resources/images/3-girls.jpg">
			      <div class="caption">
			        <h3>제목</h3>
			        <p>기타</p>
			      </div>
			    </div>
			    </a>
			  </div>
		  <%-- </c:forEach> --%>
	</div>
</body>
</html>