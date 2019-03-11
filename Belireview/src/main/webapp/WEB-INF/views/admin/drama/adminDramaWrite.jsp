<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
        var gfv_count = 1;
     
        $(document).ready(function(){
            $("#addFile").on("click", function(e){ //파일 추가 버튼
                e.preventDefault();
                fn_addFile();
            });
             
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        });

        function fn_addFile(){
            var str = "<p><input type='file' class='btn btn-primary btn-send-message' name='content_image_"+(gfv_count++)+"'><a href='#this' class='btn btn-link' name='delete'>삭제</a></p>";
            $("#fileDiv").append(str);
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        }
         
        function fn_deleteFile(obj){
            obj.parent().remove();
        }
        
        function cancel() {
			location.href="/brw/admin/drama.br";
		}
        
        function check_value() {
    		var f = document.admin_write_form_drama;
    		
    		if(f.name.value == ""){
    			alert("드라마 제목을 다시 입력하세요");
    			f.name.focus();
    			
    			return false;
    		}
    		
    		if(f.date.value == ""){
    			alert("드라마 시작 날짜를 다시 입력하세요");
    			f.date.focus();
    			
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
    		
    		if(f.poster_image.value == ""){
    			alert("드라마 포스터를 확인해 주세요.");
    			f.poster_image.focus();
    			
    			return false;
    		}
    		
    		if(f.main_image.value == ""){
    			alert("드라마 메인 이미지를 확인해 주세요.");
    			f.main_image.focus();
    			
    			return false;
    		}
    		
    		if(f.content_image.value == ""){
    			alert("드라마 서브 이미지를 확인해 주세요.");
    			f.content_image.focus();
    			
    			return false;
    		}
    		
    		f.submit();
    	}
    </script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_write_form_drama" method="post" enctype="multipart/form-data">
				<h3 class="blog-post-title">
					NAME
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="name">
				</div>
				<h3 class="blog-post-title">
					DATE
				</h3>
				<div>
					<input type="date" class="form-control search-wid" name="date">
				</div>
				<h3 class="blog-post-title">
					CHANNEL
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="channel">
				</div>
				<h3 class="blog-post-title">
					GENRE
				</h3>
				<div>
					<select name="genre" class="form-control">
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
					<input type="text" class="form-control search-wid" name="director">
				</div>
				<h3 class="blog-post-title">
					CONTENT
				</h3>
				<div>
					<textarea rows="8" cols="80" id="content" name="content" class="form-control"></textarea>
				</div>
				<h3 class="blog-post-title">
					EPISODE
				</h3>
				<div>
					<input type="number" class="form-control search-wid" name="episode">
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
				<div id="fileDiv">
					<input type="file" class="btn btn-primary btn-send-message" name="content_image"><br>
				</div>
				<div>
					<a href="#this" class="btn" id="addFile">파일 추가</a>
				</div>	
				<div style="padding-top: 20pt; padding-bottom: 20pt">
					<button type="button" class="btn btn-primary" onclick="check_value()">생성</button>
					<button type="reset" class="btn btn-default">리셋</button>
					<button type="button" class="btn btn-default" onclick="cancel()">취소</button>
				</div>
				<input type="hidden" name="media" value="drama">
			</form>
		</div>
	</div>
</body>
</html>