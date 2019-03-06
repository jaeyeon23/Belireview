<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function orderby() {
		var value = document.getElementById("orderby").value;
		
		post_to_url("/brw/admin/drama.br", {'orderby':value}, "POST");
	}
	
	function post_to_url(path, params, method) {
	    method = method || "post"; // 전송 방식 기본값을 POST로
	 
	    
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);
	 
	    //히든으로 값을 주입시킨다.
	    for(var key in params) {
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", key);
	        hiddenField.setAttribute("value", params[key]);
	 
	        form.appendChild(hiddenField);
	    }
	 
	    document.body.appendChild(form);
	    form.submit();
	}
	
</script>
</head>
<body>
	<div class="container">
		<div style="margin:20pt auto; float: right; width: 20%;" onchange="orderby()">
			<%-- <c:if test="${orderby }"></c:if> --%>
			<select id="orderby" name="orderby" class="form-control">
				<option value="1">조회순</option>
				<option value="2">장편순</option>
				<option value="3">단편순 </option>
				<option value="4">별점 높은 순</option>
				<option value="5">별점 낮은 순</option>
			</select>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>NO</th>
					<th>NAME</th>
					<th>CHANNEL</th>
					<th>GENRE</th>
					<th>DIRECTOR</th>
					<th>READCOUNT</th>
					<th>EPISODE</th>
					<th>GRADE</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${admin != null}">
						<c:forEach items="${admin }" var="list">
							<tr>
								<td>${list.DRAMA_NO}</td>
								<td>${list.DRAMA_NAME}</td>
								<td>${list.DRAMA_CHANNEL}</td>
								<td>${list.DRAMA_GENRE}</td>
								<td>${list.DRAMA_DIRECTOR}</td>
								<td>${list.DRAMA_READCOUNT}</td>
								<td>${list.DRAMA_EPISODE}</td>
								<td>${list.DRAMA_GRADE}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="9">해당하는 값이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<!-- <select name="searchNum" class="form-control" style="width: 10%; float: left;">
			<option>감독</option>
			<option>장르</option>
			<option>채널</option>
			<option>이름</option>
		</select>&nbsp;&nbsp;
		<div class="col-md-8">
			<input type="text" name="searchBox" class="form-control search-wid">
		</div> -->
	</div>
</body>
</html>