<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#autocompleteTextDrama").autocomplete({
			source: function(request, response){
				$.ajax({
					url: "/brw/ajaxActorWriteDrama.br?${_csrf.parameterName}=${_csrf.token}",
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
		
		$("#autocompleteTextMovie").autocomplete({
			source: function(request, response){
				$.ajax({
					url: "/brw/ajaxActorWriteMovie.br?${_csrf.parameterName}=${_csrf.token}",
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
		
		$('#autocompleteTextMovie').val("");
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
	
	function deleteOne_movie() {
		var txt = document.getElementById('movie_textarea').value;
		var no_arr = txt.split(", ");
		var return_txt = "";
		
		for(var i = 0 ; i < no_arr.length - 1 ; i++){
			if(return_txt == ""){
				return_txt = no_arr[i];
			}else{
				return_txt += ", " + no_arr[i];
			}
		}
		
		$('#movie_textarea').val(return_txt);
	}
	
	function reset_drama_area() {
		var txt = document.getElementById('drama_textarea');
		
		txt.value = "";
	}
	
	function reset_movie_area() {
		var txt = document.getElementById('movie_textarea');
		
		txt.value = "";
	}
	
	
	$(document).ready(function(){
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
	
	function check_value() {
		var f = document.admin_update_form_actor;
		
		if(f.name.value == ""){
			alert("이름을 다시 입력하세요");
			f.name.focus();
			
			return false;
		}
		
		if(f.show_file.checked == true){
			if(f.image.value == ""){
				alert("이미지를 업로드하세요");
				f.image.focus();
				
				return false;				
			}
		}
		
		f.submit();
	}
	
	function cancel(){
		location.href="/brw/admin/actor.br?${_csrf.parameterName}=${_csrf.token}";
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_update_form_actor" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<h3 class="blog-post-title">
					NAME
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="name" value="${admin.ACTOR_NAME }">
				</div>
				<h3 class="blog-post-title">
					IMAGE
				</h3>
				<div>
					<br><br><strong>새로운 이미지 사용시 check</strong>
				</div>
				<div id="show_file_menu">
					<br><input type="checkbox" name="show_file" id="show_file"><span id="text">새로운 이미지 사용</span>
				</div>
				<div class="subb">
					<input type="file" class="form-control search-wid" style="background-color: #ebef10;" name="image">
				</div>
				<h3 class="blog-post-title">
					DRAMA
				</h3>
				<div>
					<input type="text" class="form-control search-wid" id="autocompleteTextDrama" name="actor_drama" onkeypress="if (event.keyCode==13){drama_textarea_write();}">
					<button type="button" class="btn btn-default" onclick="reset_drama_area()">드라마 리셋</button>
					<button type="button" class="btn btn-default" onclick="deleteOne_drama()">드라마 지우기</button>
				</div>
				<div style="margin-top: 5%;">
					<textarea rows="8" cols="80" id="drama_textarea" name="drama_textarea" class="form-control" readonly>${admin.ACTOR_DRAMA }</textarea>
				</div>
				<h3 class="blog-post-title">
					MOVIE
				</h3>
				<div>
					<input type="text" class="form-control search-wid" id="autocompleteTextMovie" name="actor_movie" onkeypress="if (event.keyCode==13){movie_textarea_write();}">
					<button type="button" class="btn btn-default" onclick="reset_movie_area()">영화 리셋</button>
					<button type="button" class="btn btn-default" onclick="deleteOne_movie()">영화 지우기</button>
				</div>
				<div style="margin-top: 5%;">
					<textarea rows="8" cols="80" id="movie_textarea" name="movie_textarea" class="form-control" readonly>${admin.ACTOR_MOVIE }</textarea>
				</div>
				<div style="padding-top: 20pt; padding-bottom: 20pt">
					<button type="button" class="btn btn-primary" onclick="check_value()">생성</button>
					<button type="reset" class="btn btn-default">리셋</button>
					<button type="button" class="btn btn-default" onclick="cancel()">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>