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
		
		if(f.show_file.checked == true){
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
		}
		
		f.submit();
	}

	function cancel(){
		location.href = "/brw/admin/drama.br?${_csrf.parameterName}=${_csrf.token}";
	}
	
	$(document).ready(function() {
		var drama_genre = '<c:out value="${admin.DRAMA_GENRE}"/>';
		
		$("#genre").val(drama_genre);
		
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
    
    
    $(function() {
		
		$("#autocompleteTextDrama").autocomplete({
			source: function(request, response){
				$.ajax({
					url: "/brw/ajaxActorWrite.br?${_csrf.parameterName}=${_csrf.token}",
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
    
    function drama_textarea_write() {
		var txt = document.getElementById('drama_textarea');
		var area_split = txt.value.split(", ");
		var tmp = 0;
	
		for(var i in area_split){
			if(area_split[i] == $('#autocompleteTextDrama').val()){
				tmp = 1;
			}
		}
		
		if(tmp != 1){
			if(txt.value != ""){
				txt.value += ", " + $('#autocompleteTextDrama').val();	
			}else{
				txt.value = $('#autocompleteTextDrama').val();
			}
		}
		
		$("#autocompleteTextDrama").val("");
	}
    
    function deleteOne_drama() {
		var txt = document.getElementById('drama_textarea').value;
		var no_arr = txt.split(", ");
		var return_txt = "";
		
		for(var i = 0 ; i < no_arr.length - 1 ; i++){
			if(return_txt == ""){
				return_txt = no_arr[i];
			}else{
				return_txt += ", " + no_arr[i];
			}
		}
		
		$('#drama_textarea').val(return_txt);
	}
    
    function reset_drama_area() {
		var txt = document.getElementById('drama_textarea');
		
		txt.value = "";
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_update_form_drama" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
					<textarea rows="8" cols="80" id="content" name="content" class="form-control">${admin.DRAMA_CONTENT }</textarea>
				</div>
				<h3 class="blog-post-title">
					EPISODE
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="episode" value="${admin.DRAMA_EPISODE }">
				</div>
				<h3 class="blog-post-title">
					ACTOR
				</h3>
				<div>
					<input type="text" class="form-control search-wid" id="autocompleteTextDrama" name="actor" onkeypress="if (event.keyCode==13){drama_textarea_write();}">
					<button type="button" class="btn btn-default" onclick="reset_drama_area()">드라마 배우 리셋</button>
					<button type="button" class="btn btn-default" onclick="deleteOne_drama()">드라마 배우 지우기</button>
				</div>
				<div style="margin-top: 5%;">
					<textarea rows="8" cols="80" id="drama_textarea" name="drama_textarea" class="form-control" readonly>${str }</textarea>
				</div>
				<h3 class="blog-post-title">
					GRADE
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="grade" value="${admin.DRAMA_GRADE }" readonly>
				</div>
				<div>
					<br><br><strong>새로운 이미지 사용시 check</strong>
				</div>
				<div id="show_file_menu">
					<br><input type="checkbox" name="show_file" id="show_file"><span id="text">새로운 이미지 사용</span>
				</div>
				<div class="subb">
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
				</div>
				
				<div style="padding-top: 20pt; padding-bottom: 20pt">
					<button type="button" class="btn btn-primary" onclick="check_value()">수 정</button>
					<button type="reset" class="btn btn-default">리셋</button>
					<button type="button" class="btn btn-default" onclick="cancel()">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>