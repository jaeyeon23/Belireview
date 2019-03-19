<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

	$(document).ready(function() {
		var orderby = '<c:out value="${orderby}"/>';
		var searchNum = '<c:out value="${searchNum}"/>';

		$("#orderby").val(orderby);
		$("#searchNum").val(searchNum);

		var alert_value = '<c:out value="${alert_value}"/>';

		if (alert_value != null && alert_value != "") {
			alert(alert_value);
		}
	});
	
	function write_actor() {
		location.href='/brw/admin/actor/write.br';
	}
	
	function delete_actor(no){
		var check = confirm("정말로 삭제하시겠습니까?");
		
		if(check == true){
			var inputString = prompt('관리자 비밀번호를 입력하시오');
			if(inputString != null){
				post_to_url("/brw/admin/actor/delete.br", {'no':no, 'password':inputString}, "POST");
			}
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div style="float:left; margin:20pt auto;">
			<button class="btn btn-default" type="button" onclick="write_actor()">생성</button>
		</div>
		<div style="margin:20pt auto; float: right; width: 20%;" onchange="orderby('/brw/admin/actor.br')">
			<select id="orderby" name="orderby" class="form-control">
				<option value="">----</option>
				<option value="1">이름순</option>
				<option value="2">이름 역순</option>
			</select>
		</div>

		<div class="newest-content">
			<div class="newest-tab" style="padding-top:50pt;">
				<div class="row clearfix">
					<c:forEach items="${admin }" var="list" varStatus="stat">
						<div class="col-md-3 prdct-grid">
							<div class="product-fade">
								<div class="product-fade-wrap">
									<div id="product-image${stat.index + 1}" class="owl-carousel owl-theme">
										<div class="item">
											<c:if test="${list.ACTOR_IMAGE != NULL}">
												<img src="/brw/resources/images/actor/${list.ACTOR_IMAGE }" class="img-responsive" onmouseover="">
											</c:if>
											<c:if test="${list.ACTOR_IMAGE == NULL }">
												<img src="https://static.nid.naver.com/images/web/user/default.png" class="img-responsive">
											</c:if>
										</div>
									</div>
									<div class="product-fade-ct">
                                   		<div class="product-fade-control">
                                        	<div class="clearfix"></div>
                                           		<a href="javascript:void(0);" onclick="delete_actor(${list.ACTOR_NO})" class="btn btn-to-cart"><span>삭제</span><div class="clearfix"></div></a>
                                        </div>
									</div>
									
								</div>
								<div class="product-name">
									<a href="/brw/admin/actor/modify.br?no=${list.ACTOR_NO }">${list.ACTOR_NAME }</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>		
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
				<option value="name">이름</option>
			</select>
			<div class="input-group">
            	<input type="text" class="form-control search-wid" id="searchBox" placeholder="Search Here" value="${searchBox }" onkeypress="if (event.keyCode==13){searchNum_Box('/brw/admin/actor.br');}">
	            <a href="javascript:void(0);" onclick="searchNum_Box('/brw/admin/actor.br');" class="input-group-addon btn-side-serach" id="basic-addon1"><i class="fa fa-search"></i></a>
	        </div>			
		</div>
	</div>
</body>
</html>
