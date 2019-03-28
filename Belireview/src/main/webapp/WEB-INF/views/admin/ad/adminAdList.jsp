<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function orderby(url) {
		var orderby = document.getElementById("orderby").value;
	
		var searchNum = '<c:out value="${searchNum}"/>';
		var searchBox = '<c:out value="${searchBox}"/>';
	
		if (searchNum != null || searchNum != "") {
			post_to_url(url, {
				'orderby' : orderby,
				'searchNum' : searchNum,
				'searchBox' : searchBox
			}, "GET");
		} else {
			post_to_url(url, {
				'orderby' : orderby
			}, "GET");
		}
	}
	
	function searchNum_Box(url) {
		var searchNum = document.getElementById("searchNum").value;
		var searchBox = document.getElementById("searchBox").value;
		var orderby = "";
	
		if (searchNum == null || searchNum == "") {
			location.href = url;
		} else {
			post_to_url(url, {
				'orderby' : orderby,
				'searchNum' : searchNum,
				'searchBox' : searchBox
			}, "GET");
		}
	}
	
	function write_ad(){
		location.href = "/brw/admin/ad/write.br?${_csrf.parameterName}=${_csrf.token}";	
	}
	
	function update_ad(no){
		location.href = "/brw/admin/ad/modify.br?${_csrf.parameterName}=${_csrf.token}&no="+no;
	}
	
	function delete_ad(no){
		var check = confirm("정말로 삭제하시겠습니까?");
		
		if(check == true){
			var inputString = prompt('관리자 비밀번호를 입력하시오');
			if(inputString != null){
				post_to_url("/brw/admin/ad/delete.br?${_csrf.parameterName}=${_csrf.token}", {'no':no, 'password':inputString}, "POST");
			}
		}
	}
	
	$(document).ready(function() {
		var orderby = '<c:out value="${orderby}"/>';
		var searchNum = '<c:out value="${searchNum}"/>';
		
		$("#orderby").val(orderby);
		$("#searchNum").val(searchNum);
		
		var alert_value = '<c:out value="${alert_value}"/>';
		
		if(alert_value != null && alert_value != ""){
			alert(alert_value);
		}
	});
	
</script>
</head>
<body>
	<div class="container">
		<div style="float:left; margin:20pt auto;">
			<button class="btn btn-default" type="button" onclick="write_ad()">생성</button>
		</div>
		<div style="margin:20pt auto; float: right; width: 20%;" onchange="orderby('/brw/admin/ad.br?${_csrf.parameterName}=${_csrf.token}')">
			<select id="orderby" name="orderby" class="form-control">
				<option value="">----</option>
				<option value="1">조회순</option>
				<option value="2">별점 높은 순</option>
				<option value="3">별점 낮은 순</option>
			</select>
		</div>
		<table class="table table-hover">
			<thead align="center">
				<colgroup>
					<col width="5%" />
					<col width="30%" />
					<col width="30%" />
					<col width="5%" />
					<col width="5%" />
					<col width="25%" />
				</colgroup>
				<tr>
					<th>NO</th>
					<th>NAME</th>
					<th>COMPANY</th>
					<th>READCOUNT</th>
					<th>GRADE</th>
					<th>CHOOSE</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${admin != null}">
						<c:forEach items="${admin }" var="list">
							<tr>
								<td>${list.AD_NO}</td>
								<td>${list.AD_NAME}</td>
								<td>${list.AD_COMPANY}</td>
								<td>${list.AD_READCOUNT}</td>
								<td><fmt:formatNumber value="${list.AD_GRADE}" pattern="#.#"/></td>
								<td>
									<button class="btn btn-default" type="button" onclick="update_ad('${list.AD_NO}')">수정</button>
									<button class="btn btn-danger" type="button" onclick="delete_ad('${list.AD_NO}')">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">해당하는 값이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<nav>
			<div class='pag-center'>
				<ul class='pagination believe-pag'>
					${pagingHtml}
				</ul>
			</div>
		</nav>
		
		<div style="margin:20pt 30%;">
			<select name="searchNum" id="searchNum" class="form-control" style="width: 20%; float: left; min-width: 70pt;">
				<option value="">----</option>
				<option value="company">회사</option>
				<option value="name">이름</option>
			</select>
			<div class="input-group">
            	<input type="text" class="form-control search-wid" id="searchBox" placeholder="Search Here" value="${searchBox }" onkeypress="if (event.keyCode==13){searchNum_Box('/brw/admin/ad.br?${_csrf.parameterName}=${_csrf.token}');}">
	            <a href='javascript:void(0);' onclick="searchNum_Box('/brw/admin/ad.br?${_csrf.parameterName}=${_csrf.token}');" class="input-group-addon btn-side-serach" id="basic-addon1"><i class="fa fa-search"></i></a>
	        </div>			
		</div>
		
	</div>
</body>
</html>