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
		var orderby = document.getElementById("orderby").value;
		var searchNum = document.getElementById("searchNum").value;
		var searchBox = document.getElementById("searchBox").value;
		
		if(orderby == null)
			orderby = 0;
		
		if(searchBox != null){
			post_to_url("/brw/admin/drama.br", {'orderby':orderby, 'searchNum':searchNum, 'searchBox':searchBox}, "GET");
		}else{
			post_to_url("/brw/admin/drama.br", {'orderby':orderby}, "GET");	
		}
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
	
	function write_drama(){
		location.href = "/brw/admin/drama/write.br";	
	}
	
	function update_drama(no){
		location.href = "/brw/admin/drama/modify.br?no="+no;
	}
	
	function delete_drama(no){
		var check = confirm("정말로 삭제하시겠습니까?");
		
		if(check == true){
			var inputString = prompt('관리자 비밀번호를 입력하시오');
			if(inputString != null){
				post_to_url("/brw/admin/drama/delete.br", {'id':no, 'password':inputString}, "POST");
			}
		}
	}
	
	
</script>
</head>
<body>
	<div class="container">
		<div style="float:left; margin:20pt auto;">
			<button class="btn btn-default" type="button" onclick="write_drama()">생성</button>
		</div>
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
					<th>DRAMA</th>
					<th>CHANNEL</th>
					<th>GENRE</th>
					<th>DIRECTOR</th>
					<th>READ</th>
					<th>EPISODE</th>
					<th>GRADE</th>
					<th>CHOOSE</th>
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
								<td>
									<button class="btn btn-default" type="button" onclick="update_drama('${list.DRAMA_NO}')">수정</button>
									<button class="btn btn-danger" type="button" onclick="delete_drama('${list.DRAMA_NO}')">삭제</button>
								</td>
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
		
		<div>
			<select name="searchNum" id="searchNum" class="form-control" style="width: 10%; float: left;">
				<option value="director">감독</option>
				<option value="genre">장르</option>
				<option value="channel">채널</option>
				<option value="name">이름</option>
			</select>
			<div class="input-group col-md-4">
				<form onsubmit="orderby()">
	            	<input type="text" class="form-control search-wid" id="searchBox" placeholder="Search Here" value="${searchBox }">
	            </form>
	            <a href='javascript:void(0);' onclick="orderby();" class="input-group-addon btn-side-serach" id="basic-addon1"><i class="fa fa-search"></i></a>
	        </div>			
		</div>
		
		<nav>
			<div class='pag-center'>
				<ul class='pagination believe-pag'>
					${pagingHtml}
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>