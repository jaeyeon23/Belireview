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
		var f = document.admin_update_form_drama;
		
		if(f.name.value == ""){
			alert("이름을 다시 입력하세요");
			f.name.focus();
			
			return false;
		}
		
		if(f.channel.value == ""){
			alert("채널을 다시 입력하세요");
			f.channel.focus();
			
			return false;
		}
		
		if(f.genre.value == ""){
			alert("장르를 다시 입력하세요");
			f.genre.focus();
			
			return false;
		}
		
		if(f.director.value == ""){
			alert("감독을 확인해 주세요.");
			f.director.focus();
			
			return false;
		}
		
		if(f.content.value == ""){
			alert("드라마 내용을 확인해 주세요.");
			f.content.focus();
			
			return false;
		}
		
		if(f.episode.value == ""){
			alert("에피소드를 확인해 주세요.");
			f.episode.focus();
			
			return false;
		}
		
		f.submit();
	}

	function cancel(){
		location.href = "/brw/admin/drama.br";
	}
	
	$(document).ready(function() {
		var drama_genre = '<c:out value="${admin.DRAMA_GENRE}"/>';
		
		$("#genre").val(drama_genre);
	});
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_update_form_drama" method="post" enctype="multipart/form-data">
				<h3 class="blog-post-title">
					NAME
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="name" value="${admin.DRAMA_NAME }">
				</div>
				<h3 class="blog-post-title">
					DATE
				</h3>
				<div>${fn:substring(TextValue,0,3) }
					<c:set value="${admin.DRAMA_DATE }" var="drama_date"></c:set>
					<input type="date" class="form-control search-wid" name="date" value="${fn:substring(drama_date,0,10) }">
				</div>
				<h3 class="blog-post-title">
					CHANNEL
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="channel" value="${admin.DRAMA_CHANNEL }">
				</div>
				<h3 class="blog-post-title">
					GENRE
				</h3>
				<div>
					<select id="genre" name="genre" class="form-control">
						<option value="로맨스">로맨스</option>
						<option value="공포•호러">공포•호러</option>
						<option value="판타지">판타지</option>
						<option value="메디컬">메디컬</option>
						<option value="애니메이션">애니메이션</option>
						<option value="예능">예능</option>
						<option value="코미디">코미디</option>
						<option value="종교">종교</option>
						<option value="SF">SF</option>
						<option value="재난">재난</option>
						<option value="드라마">드라마</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<h3 class="blog-post-title">
					DIRECTOR
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="director" value="${admin.DRAMA_DIRECTOR }">
				</div>
				<h3 class="blog-post-title">
					CONTENT
				</h3>
				<div>
					<textarea rows="8" cols="80" id="content" class="form-control">${admin.DRAMA_CONTENT }</textarea>
				</div>
				<h3 class="blog-post-title">
					EPISODE
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="episode" value="${admin.DRAMA_EPISODE }">
				</div>
				<h3 class="blog-post-title">
					GRADE
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="grade" value="${admin.DRAMA_GRADE }" readonly>
				</div>
				<h3 class="blog-post-title">
					POSTER_IMAGE
				</h3>
				<div>
					<input type="file" class="btn btn-primary btn-send-message" name="poster_image">
				</div>
				<h3 class="blog-post-title">
					MAIN_IMAGE
				</h3>
				<div>
					<input type="file" class="btn btn-primary btn-send-message" name="main_image">
				</div>
				<h3 class="blog-post-title">
					CONTENT_IMAGE
				</h3>
				<div>
					<input type="file" class="btn btn-primary btn-send-message" name="content_image">
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