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
			location.href="/brw/admin/ad.br";
		}
        
        function check_value() {
    		var f = document.admin_write_form_ad;
    		
    		if(f.name.value == ""){
    			alert("제목을 다시 입력하세요");
    			f.name.focus();
    			
    			return false;
    		}
    		
    		if(f.link.value == ""){
    			alert("나라를 다시 입력하세요");
    			f.link.focus();
    			
    			return false;
    		}
    		
	   		if(f.content.value == ""){
    			alert("영화 내용을 확인해 주세요.");
    			f.content.focus();
    			
    			return false;
    		}
    		
    		if(f.company.value == ""){
    			alert("회사를 확인해 주세요.");
    			f.company.focus();
    			
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
    </script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_write_form_ad" method="post" enctype="multipart/form-data">
				<h3 class="blog-post-title">
					NAME
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="name">
				</div>
				<h3 class="blog-post-title">
					LINK
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="link">
				</div>
				<h3 class="blog-post-title">
					CONTENT
				</h3>
				<div>
					<textarea rows="8" cols="80" id="content" name="content" class="form-control"></textarea>
				</div>
				<h3 class="blog-post-title">
					COMPANY
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="company">
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
				<input type="hidden" name="media" value="ad">
			</form>
		</div>
	</div>
</body>
</html>