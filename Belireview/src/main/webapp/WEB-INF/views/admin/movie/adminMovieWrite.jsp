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
			location.href="/brw/admin/movie.br?${_csrf.parameterName}=${_csrf.token}";
		}
        
        function check_value() {
    		var f = document.admin_write_form_movie;
    		
    		if(f.name.value == ""){
    			alert("영화 제목을 다시 입력하세요");
    			f.name.focus();
    			
    			return false;
    		}
    		
    		if(f.date.value == ""){
    			alert("영화 시작 날짜를 다시 입력하세요");
    			f.date.focus();
    			
    			return false;
    		}
    		
    		if(f.country.value == ""){
    			alert("나라를 다시 입력하세요");
    			f.country.focus();
    			
    			return false;
    		}
    		
    		if(f.genre.value == ""){
    			alert("장르를 다시 입력하세요");
    			f.genre.focus();
    			
    			return false;
    		}
    		
    		if(f.total_count.value == ""){
    			alert("관객수를 다시 입력하세요");
    			f.total_count.focus();
    			
    			return false;
    		}
    		
    		if(f.director.value == ""){
    			alert("감독을 확인해 주세요.");
    			f.director.focus();
    			
    			return false;
    		}
    		
    		if(f.content.value == ""){
    			alert("영화 내용을 확인해 주세요.");
    			f.content.focus();
    			
    			return false;
    		}
    		
    		if(f.runningtime.value == ""){
    			alert("러닝타임을 확인해 주세요.");
    			f.runningtime.focus();
    			
    			return false;
    		}
    		
    		if(f.poster_image.value == ""){
    			alert("영화 포스터를 확인해 주세요.");
    			f.poster_image.focus();
    			
    			return false;
    		}
    		
    		if(f.main_image.value == ""){
    			alert("영화 메인 이미지를 확인해 주세요.");
    			f.main_image.focus();
    			
    			return false;
    		}
    		
    		if(f.content_image.value == ""){
    			alert("영화 서브 이미지를 확인해 주세요.");
    			f.content_image.focus();
    			
    			return false;
    		}
    		
    		f.submit();
    	}
        
		$(function() {
    		
    		$("#autocompleteTextMovie").autocomplete({
    			source: function(request, response){
    				$.ajax({
    					url: "/brw/ajaxActorWrite.br",
    					dataType: "json",
    					data:{
    						searchValue: request.term
    					},
    					success: function(args){
    						response(
    							$.map(args, function(item) {
    								return{
    									label:item.name,
    									value:item.no
    								}
    							})
    						);
    					}
    				});
    			},
    			minLength:1,
    		});
    	});
        
        function movie_textarea_write() {
    		var txt = document.getElementById('movie_textarea');
    		var area_split = txt.value.split(", ");
    		var tmp = 0;
    	
    		for(var i in area_split){
    			if(area_split[i] == $('#autocompleteTextMovie').val()){
    				tmp = 1;
    			}
    		}
    		
    		if(tmp != 1){
    			if(txt.value != ""){
    				txt.value += ", " + $('#autocompleteTextMovie').val();	
    			}else{
    				txt.value = $('#autocompleteTextMovie').val();
    			}
    		}
    		
    		$("#autocompleteTextMovie").val("");
    	}
        
        function reset_movie_area() {
    		var txt = document.getElementById('movie_textarea');
    		
    		txt.value = "";
    	}
        
    </script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_write_form_movie" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
					COUNTRY
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="country">
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
						<option value="영화">드라마</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<h3 class="blog-post-title">
					TOTAL_COUNT
				</h3>
				<div>
					<input type="number" class="form-control search-wid" name="total_count">
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
					RUNNING_TIME
				</h3>
				<div>
					<input type="number" class="form-control search-wid" name="runningtime">
				</div>
				<h3 class="blog-post-title">
					ACTOR
				</h3>
				<div>
					<input type="text" class="form-control search-wid" id="autocompleteTextMovie" name="actor" onkeypress="if (event.keyCode==13){movie_textarea_write();}">
					<button type="button" class="btn btn-default" onclick="reset_movie_area()">드라마 배우 리셋</button>
				</div>
				<div style="margin-top: 5%;">
					<textarea rows="8" cols="80" id="movie_textarea" name="movie_textarea" class="form-control" readonly></textarea>
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
				<input type="hidden" name="media" value="movie">
			</form>
		</div>
	</div>
</body>
</html>