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
	$(function() {
		
		$("#autocompleteTextDrama").autocomplete({
			source: function(request, response){
				$.ajax({
					url: "/brw/ajaxActorWriteDrama.br",
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
					url: "/brw/ajaxActorWriteMovie.br",
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
		
		if(txt.value != ""){
			txt.value += ", " + $('#autocompleteTextMovie').val();	
		}else{
			txt.value = $('#autocompleteTextMovie').val();
		}
		
		$('#autocompleteTextMovie').val("");
	}
	
	function reset_drama_area() {
		var txt = document.getElementById('drama_textarea');
		
		txt.value = "";
	}
	
	function reset_movie_area() {
		var txt = document.getElementById('movie_textarea');
		
		txt.value = "";
	}
	
	function check_value() {
		var f = document.admin_write_form_actor;
		
		if(f.name.value == ""){
			alert("배우 이름을 다시 입력하세요");
			f.name.focus();
			
			return false;
		}
		
		if(f.image.value == ""){
			alert("사진을 다시 입력하세요");
			f.image.focus();
			
			return false;
		}
		
		f.submit();
	}
	
	function cancel() {
		location.href = "/brw/admin/actor.br"
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<form name="admin_write_form_actor" method="post" enctype="multipart/form-data">
				<h3 class="blog-post-title">
					NAME
				</h3>
				<div>
					<input type="text" class="form-control search-wid" name="name">
				</div>
				<h3 class="blog-post-title">
					IMAGE
				</h3>
				<div>
					<input type="file" class="form-control search-wid" style="background-color: #ebef10;" name="image">
				</div>
				<h3 class="blog-post-title">
					DRAMA
				</h3>
				<div>
					<input type="text" class="form-control search-wid" id="autocompleteTextDrama" name="actor_drama" onkeypress="if (event.keyCode==13){drama_textarea_write();}">
					<button type="button" class="btn btn-default" onclick="reset_drama_area()">드라마 리셋</button>
				</div>
				<div style="margin-top: 5%;">
					<textarea rows="8" cols="80" id="drama_textarea" name="drama_textarea" class="form-control" readonly></textarea>
				</div>
				<h3 class="blog-post-title">
					MOVIE
				</h3>
				<div>
					<input type="text" class="form-control search-wid" id="autocompleteTextMovie" name="actor_movie" onkeypress="if (event.keyCode==13){movie_textarea_write();}">
					<button type="button" class="btn btn-default" onclick="reset_movie_area()">영화 리셋</button>
				</div>
				<div style="margin-top: 5%;">
					<textarea rows="8" cols="80" id="movie_textarea" name="movie_textarea" class="form-control" readonly></textarea>
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