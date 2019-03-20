<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link rel="stylesheet" href="/brw/resources/css/list2.css">
   <script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
   <script>
  		$(function(){
  			$('.list').css('display','none');
  			$('.list').slice(0,8).show();
  			$("#loadMore").on('click', function (e) {
  	        	e.preventDefault();
  		        $(".list:hidden").slice(0, 8).slideDown();
  		        if ($(".list:hidden").length == 0) {
  		           return;
  		        }
  		        $('html,body').animate({
  		            scrollTop: $(this).offset().top
  		        }, 1000);
  		    });

  			$('.btt').click(function () {
  			    $('body,html').animate({
  			        scrollTop: 0
  			    }, 300);
  			    return false;
  			});
  			$('.reload').click(function(){
  				$('body,html').animate({
  			        scrollTop: 0
  			    }, 1);
  				location.reload();
  			})
  		})
   </script>
</head>
<body>
	<div class="row a" >
		<c:forEach items="${list}" var="movieList" >
			 <div class="col-sm-6 col-md-3 list">
			 	<!-- <a href="#this" class="detail"> -->
			 	<a href="/brw/movie/movieDetail.br?MOVIE_NO=${movieList.MOVIE_NO}">
			    <div class="thumbnail">
			      <img src="/brw/resources/images/movie/poster/${movieList.MOVIE_POSTER_IMAGE}">
			      <%-- <input type='hidden' class='IDX' value="${dramaList.DRAMA_NO}"> --%>
			      <div class="caption">
			        <h3>${movieList.MOVIE_NAME}</h3>
			        <p>${movieList.MOVIE_DATE}・${movieList.MOVIE_COUNTRY}・${movieList.MOVIE_GENRE}</p>
			      </div>
			    </div>
			    </a>
			  </div>
		</c:forEach> 
	</div>
	<%-- <nav>
		<div class='pag-center'>
			<ul class='pagination believe-pag'>
				${page}
			</ul>
		</div>
	</nav> --%>
	<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
	<!-- <script>
	 $(document).ready(function(){
         $(".detail").on("click", function(e){ //글쓰기 버튼
             e.preventDefault();
             detail();
         });
     });
	 function detail(){
		 var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/drama/dramaDetail.br' />");
         comSubmit.addParam("DRAMA_NO",$(".IDX").val())
         comSubmit.submit();
	 }
	</script> -->
	<a href="#" id="loadMore">Load More</a>
	
	<p class="totop"> 
		<button type="button" class="btn btn-primary btn-lg btn-block reload">Reload</button>
		<button type="button" class="btn btn-default btn-lg btn-block btt">Back to top</button>
	</p>
</body>
</html>