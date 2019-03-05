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
	function delete_user(id) {
		var check = confirm("정말로 삭제하시겠습니까?");
		
		if(check == true){
			var inputString = prompt('사용자 비밀번호를 입력하시오');
			if(inputString != null){
				post_to_url("/brw/admin/delete.br", {'id':id, 'password':inputString}, "POST");
			}
		}
	}
	
	/* $(document).ready(function(){
		var str = <c:out value="${str}"/>
			
		if(str != null){
			alert(str);
		}
	}); */
	
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

	function update_user(id){
		location.href = "/brw/admin/modify.br?id="+id;
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table" align="center">
			<thead class="thead-dark">
				<tr>
					<th>NO</th>
					<th>ID</th>
					<th>NAME</th>
					<th>ADMIN</th>
					<th>CHOOSE</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(admin) > 0}">
						<c:forEach items="${admin }" var="list">
							<tr>
								<td>${list.MEMBER_NO }</td>
								<td>${list.ID }</td>
								<td>${list.NAME }</td>
								<td>
									<c:choose>
										<c:when test="${list.ADMIN == 1}">
											TRUE										
										</c:when>
										<c:otherwise>
											FALSE
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<form name="myForm">
										<button class="btn btn-default" type="button" onclick="update_user('${list.ID}')">수정</button>&nbsp;
										<button class="btn btn-danger" type="button" onclick="delete_user('${list.ID}')">삭제</button>

										<!-- modal 구동 버튼 (trigger) --> 
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${list.ID }">프로필 미리보기</button>
										<!-- Modal -->
										<div class="modal fade" id="myModal${list.ID }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
														<h4 class="modal-title" id="myModalLabel">${list.NAME }님의 프로필</h4>
													</div>
													<div class="modal-body" align="center">
														<c:choose>
															<c:when test="${list.PROFILE_IMAGE != null }">
																<img src="/brw/resources/images/user_profile/${list.PROFILE_IMAGE }" class="img-responsive">
															</c:when>
															<c:otherwise>
																<img src="https://static.nid.naver.com/images/web/user/default.png" class="img-responsive">
															</c:otherwise>
														</c:choose>
														<br>
														<table class="table table-striped">
															<tr>
																<th>
																	아이디
																</th>
																<td>
																	${list.ID }
																</td>
															</tr>
															<tr>
																<th>
																	이메일
																</th>
																<td>
																	${list.EMAIL }
																</td>
															</tr>
															<tr>
																<th>
																	회원 가입 날짜
																</th>
																<td>
																	<c:set var="date" value="${list.REGDATE }"/>
																	${fn:substring(date,0,11) }
																</td>
															</tr>	
														</table>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">사용자가 없습니다</td>
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
	</div>
</body>
</html>