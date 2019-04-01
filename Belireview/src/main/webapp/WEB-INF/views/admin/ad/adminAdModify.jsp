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
	function check_value() {
		var f = document.admin_update_form_ad;
		
		if(f.name.value == ""){
			alert("제목을 다시 입력하세요");
			f.name.focus();
			
			return false;
		}
		
		if(f.link.value == ""){
			alert("제목을 다시 입력하세요");
			f.link.focus();
			
			return false;
		}
		
		if(f.content.value == ""){
			alert("영화 내용을 확인해 주세요.");
			f.content.focus();
			
			return false;
		}
		
		if(f.company.value == ""){
			alert("회사를 다시 입력하세요");
			f.link.focus();
			
			return false;
		}
		
		if(f.show_file.checked == true){
    		if(f.main_image.value == ""){
    			alert("드라마 메인 이미지를 확인해 주세요.");
    			f.main_image.focus();
    			
    			return false;
    		}
		}
		
		f.submit();
	}

	function cancel(){
		location.href = "/brw/admin/ad.br?${_csrf.parameterName}=${_csrf.token}";
	}
	
	$(document).ready(function() {
		$(".subb").hide();
		$("#show_file").click(function() 
		{
			if($(".subb").css("display")=="none"){
				$(".subb").slideUp("fast");
				$("#text").html("기존 이미지 사용");				
			}else{
				$("#text").html("새로운 이미지 사용");
			}
			$(".subb").slideToggle("fast"); 
		})
	});
	
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_update_form_ad" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<h3 class="blog-post-title">
					NAME
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="name" value="${admin.AD_NAME }">
				</div>
				<h3 class="blog-post-title">
					LINK
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="link" value="${admin.AD_LINK}">
				</div>
				<h3 class="blog-post-title">
					CONTENT
				</h3>
				<div>
					<textarea rows="8" cols="80" id="content" name="content" class="form-control">${admin.AD_CONTENT }</textarea>
				</div>
				<h3 class="blog-post-title">
					COMPANY
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="company" value="${admin.AD_COMPANY }">
				</div>
				<h3 class="blog-post-title">
					GRADE
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="grade" value="${admin.AD_GRADE }" readonly>
				</div>
				<div>
					<br><br><strong>새로운 이미지 사용시 check</strong>
				</div>
				<div id="show_file_menu">
					<br><input type="checkbox" name="show_file" id="show_file"><span id="text">새로운 이미지 사용</span>
				</div>
				<div class="subb">
					<h3 class="blog-post-title">
						MAIN_IMAGE
					</h3>
					<div>
						<input type="file" class="btn btn-primary btn-send-message" name="main_image">
					</div>
				</div>
				
				<div style="padding-top: 20pt; padding-bottom: 20pt">
					<button type="button" class="btn btn-primary" onclick="check_value()">수정</button>
					<button type="reset" class="btn btn-default">리셋</button>
					<button type="button" class="btn btn-default" onclick="cancel()">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>