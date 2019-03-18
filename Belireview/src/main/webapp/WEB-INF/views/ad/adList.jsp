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
		<c:forEach items="${list}" var="adList" >
			 <div class="col-sm-6 col-md-3">
			 	<a href="/brw/ad/adDetail.br?AD_NO=${adList.AD_NO}"/>
			    <div class="thumbnail">
			      <img src="/brw/resources/images/3-girls.jpg">
			      <div class="caption">
			         <h3>${adList.AD_NAME}</h3>
			        <p>${adList.AD_COMPANY}・${adList.AD_READCOUNT}</p>
			      </div>   
			    </div>
			    </a>
			  </div>
		  </c:forEach> 
	</div>
</body>
</html>