<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link rel="stylesheet" href="/brw/resources/css/list.css">
   <script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
	<div class="row a" >
		<c:forEach items="${list}" var="dramaList" >
			 <div class="col-sm-6 col-md-3">
			 	<!-- <a href="#this" class="detail"> -->
			 	<a href="/brw/drama/dramaDetail.br?DRAMA_NO=${dramaList.DRAMA_NO}&DRAMA_NAME=${dramaList.DRAMA_NAME}&DRAMA_GENRE=${dramaList.DRAMA_GENRE}">
			    <div class="thumbnail">
			      <img src="/brw/resources/images/3-girls.jpg">
			      <%-- <input type='hidden' class='IDX' value="${dramaList.DRAMA_NO}"> --%>
			      <div class="caption">
			        <h3>${dramaList.DRAMA_NAME}</h3>
			        <p>${dramaList.DRAMA_DATE}・${dramaList.DRAMA_CHANNEL}・${dramaList.DRAMA_GENRE}</p>
			      </div>
			    </div>
			    </a>
			  </div>
		</c:forEach> 
	</div>
	<nav>
			<div class='pag-center'>
				<ul class='pagination believe-pag'>
					${page}
				</ul>
			</div>
		</nav>
	<%-- <%@ include file="/WEB-INF/views/include/include-body.jspf" %> --%>
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
</body>
</html>