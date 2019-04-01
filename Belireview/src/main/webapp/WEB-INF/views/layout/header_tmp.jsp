<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<link href="/brw/resources/Jcss/rank.css" rel="stylesheet">
<script>
  $(function(){
		$("a[name='search']").click(function(e){ 
            e.preventDefault();
            openSearch(); 
		});
  });
		  function enter(){
			  $("a[name='search']").trigger('click');
		  }	

  function openSearch(){
		var comSubmit = new ComSubmit();
       comSubmit.setUrl("<c:url value='/mainSearch.br?${_csrf.parameterName}=${_csrf.token}' />");
       comSubmit.addParam("searchText",$("input[name='searchText']").val());
       comSubmit.submit();
	}		
  /* 추가2-2 */
  function genre(value,type,url){
		$.ajax({
			url: url,
			type:"post",
			dataType:'json',
			data:{
				GENRE: value
			},       
			success: function(result){
				$('.contentList').html(result);
			}
		})
	}
   /* 추가2-2 */
	
   
	$(function(){
		  /* 추가1 */
		  var currentUrl = document.URL;
		  		
		  if(currentUrl.indexOf('movie')>-1){
			  $('.movie').addClass('active');
		  }else if(currentUrl.indexOf('ad')>-1){
			  $('.ad').addClass('active');
		  }else if(currentUrl.indexOf('drama')>-1){
			  $('.drama').addClass('active');
		  }else if(currentUrl.indexOf('admin')>-1){
			  $('.admin').addClass('active');
		  }else if(currentUrl.indexOf('main')>-1){
			  $('.home').addClass('active');
		  }
		  
		  /* 추가1 */
		  
		  
		  $("#cat-nav").hide();		
		  
		  
		  /* 추가2-1 */
		  $(".genre").click(function(e){ 
	            e.preventDefault();
	            
	            var url = "";
	            var value = $(this).html();
	            var type = $(this).attr("value");
	            
	            if(type == 'd'){
	            	if(currentUrl.indexOf('dramaList') > -1){
	            		url = "/brw/drama/dramaList.br?${_csrf.parameterName}=${_csrf.token}";
	            	}else{
	            		location.href="/brw/drama/dramaList.br?${_csrf.parameterName}=${_csrf.token}&GENRE="+value;
	            	}
	            }else{
					if(currentUrl.indexOf('movieList') > -1){
						url = "/brw/movie/movieList.br?${_csrf.parameterName}=${_csrf.token}";
	            	}else{
	            		location.href="/brw/movie/movieList.br?${_csrf.parameterName}=${_csrf.token}&GENRE="+value;
	            	}
	            }
	            genre(value,type,url);
			});
		  /* 추가2-1 */
	})
	
	$(function() {
		$("#autocompleteText").autocomplete({
			source: function(request, response){
				$.ajax({
					url: "/brw/auto.br?${_csrf.parameterName}=${_csrf.token}",
					dataType: "json",
					data:{
						searchValue: request.term
					},
					success: function(args){
						response(
							$.map(args, function(item) {
								return{
									label:item.data,
									value:item.data
								}
							})
						);
					}
				});
			},
			minLength:1,
		});
	});

	$(function() {
		var count = $('#rank-list li').length;
		var height = $('#rank-list li').height();

		function step(index) {
			$('#rank-list ol').delay(2000).animate({
				top : -height * index,
			}, 500, function() {
				step((index + 1) % count);
			});
		}

		step(1);
	});
</script>
<body>
	 <div id="header"> <!-- header -->
              <div class="top"> <!-- top -->
                  <div class="container">
				<div class="top-control">
                      	  <c:if test="${sessionScope.ID == null }">
                          <a href="/brw/member/loginForm.br">로그인</a><span>•</span><a href="/brw/member/joinTerms.br">회원가입</a>
                  		  </c:if>
                  		   <c:if test="${sessionScope.ID != null }">
                          <a href="/brw/member/logout.br">로그아웃</a><span>•</span><a href="/brw/user/user.br">마이페이지</a>
                  		  </c:if>
                      </div>
                  </div>
              </div> <!-- top end -->
              
              <!-- 메뉴 카테고리 시작 -->
              <div id="believe-nav"> <!-- Nav -->
                  <div class="container">
                      <div class="min-marg">
                          <nav class="navbar navbar-default">
                              <!-- <div class="container-fluid"> -->
                                  <!-- Brand and toggle get grouped for better mobile display -->
                                  <div class="navbar-header">
                                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                          <span class="sr-only">Toggle navigation</span>
                                          <span class="icon-bar"></span>
                                          <span class="icon-bar"></span>
                                          <span class="icon-bar"></span>
                                      </button>
                                      <a class="navbar-brand" href="/brw/main.br">
                                      <img src="/brw/resources/images/logo3.png" style="margin-top: -8px;" width="150px" alt=""></a>
                                  </div>

                                  <!-- Collect the nav links, forms, and other content for toggling -->
                                  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                      <ul class="nav navbar-nav">
                                       <!-- 클래스추가 --><li class="home"><a href="/brw/main.br">Home <span class="sr-only">(current)</span></a></li>
                                       <!-- 클래스추가 --><li class="drama"><a href="/brw/drama/dramaList.br" class="mmenu" id="menu1" onmouseover="mopen(1);" onmouseout="mclosetime();">Drama</a>
                                          </li>
                                       <!-- 클래스추가 --><li class="movie"><a class="movie_tab" href="/brw/movie/movieList.br" class="mmenu" id="menu2" onmouseover="mopen(2);" onmouseout="mclosetime();">Movie</a></li>
                                       <!-- 클래스추가 --><li class="ad"><a class="" href="/brw/ad/adList.br">Advertisement</a></li>
                                          <c:if test="${sessionScope.ADMIN == 1 }">
                                          	<!-- 클래스추가 --><li class="admin"><a href="" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-expanded="false">Admin <i class="fa fa-angle-down"></i></a>
				                                <ul class="dropdown-menu megamenu" role="menu">
		                                		    <li>
			                                            <div class="mega-sub">
				                   	                        <ul style="list-style: none;  line-height:30px; font-weight: bold;">
					                                            <li><a href="/brw/admin/users.br">Users</a></li>
							    								<li><a href="/brw/admin/drama.br">Drama</a></li>
					                                            <li><a href="/brw/admin/movie.br">Movie</a></li>
							                 					<li><a href="/brw/admin/ad.br">Advertisement</a></li>
							                 					<li><a href="/brw/admin/actor.br">Actor</a></li>
						                                    </ul>
					                                    </div>
		                                         	</li>
	                                         	</ul>
                                     	  	</li>
                                          </c:if>
                                      </ul>
							<ul class="nav navbar-nav navbar-right">
								<div id="content1">
									<dl id="rank-list">
										<dt>실시간 급상승 검색어</dt>
										<dd>
											<ol>
												<c:forEach items="${realtime }" var="list" varStatus="stat">
													<li><font id="index">${stat.index + 1}</font>
														${list.SEARCH_TEXT }</li>
												</c:forEach>
											</ol>
										</dd>
									</dl>
								</div>
								<li class="menu-search-form"><a href="#"
									id="open-srch-form"><img
										src="/brw/resources/images/srch.png" alt="srch"></a></li>
								<li><c:if test="${sessionScope.ID != null }">
										<a href="#"> <c:if
												test="${sessionScope.PROFILE_IMAGE == null }">
												<img src="/brw/resources/images/ican/no_pro.png" alt="bag"
													width="60" height="45"
													style="border-radius: 150px; margin-top: -10px;">
											</c:if> <c:if test="${sessionScope.PROFILE_IMAGE != null }">
												<img
													src="/brw/resources/images/user_profile/${sessionScope.PROFILE_IMAGE}"
													alt="bag" width="60" height="45"
													style="border-radius: 150px; margin-top: -10px;">
											</c:if>
										</a>
									</c:if></li>
								<li id="open-srch-form-mod">
									<div>
										<form class="side-search">
											<div class="input-group">
												<input type="text" class="form-control search-wid"
													placeholder="Search Here" aria-describedby="basic-addon1">
												<a href="" class="input-group-addon btn-side-serach"
													id="basic-addon1"><i class="fa fa-search"></i></a>
											</div>
										</form>
									</div>
								</li>
							</ul>

						</div><!-- /.navbar-collapse -->
                              <!--</div> -->
                          </nav>
                      </div>
	                   <div class="srch-form">
                             <div class="input-group">
                                 <input type="text" id="autocompleteText" name="searchText"  onkeypress="if(event.keyCode==13){enter();}"  class="form-control search-wid" placeholder="Search Here" aria-describedby="basic-addon2">
                                 <a href="" name="search" class="input-group-addon btn-side-serach" id="basic-addon2">
                                 <i class="fa fa-search"></i></a>
                             </div>
                      </div>
                      </div>
                  </div>
              </div> <!-- Nav -->
              
              
              <!-- 검은색줄 시작 -->
              
              <div id="cat-nav">
              <div class="container">
                  <nav class="navbar navbar-default">
                      <div class="container-fluid">
                      <div class="collapse navbar-collapse" id="cat-nav-mega">
                           <div class ="submenu" id="submenu1" onmouseover="mcancelclosetime()" onmouseout="mclosetime();" style="display :none;">
                      	   	 <ul class="nav navbar-nav abcd efg">
                           		  <li class="active"><a href="#">장르</a></li>
                        	      <li><a href="#" class="genre" value="d">공포</a></li>
	                              <li><a href="#" class="genre" value="d">드라마</a></li>
    	                          <li><a href="#" class="genre" value="d">로맨스</a></li>
        	                      <li><a href="#" class="genre" value="d">메디컬</a></li>
            	                  <li><a href="#" class="genre" value="d">범죄</a></li>
                	              <li><a href="#" class="genre" value="d">코미디</a></li>
                    	          <li><a href="#" class="genre" value="d">판타지</a></li>
                       		 </ul>
                           </div>
                           
                            <div class ="submenu" id="submenu2" onmouseover="mcancelclosetime()" onmouseout="mclosetime();" style="display :none;">
                      	   	 <ul class="nav navbar-nav abcd efg">
                           		  <li class="active"><a href="#">장르</a></li>
                        	      <li><a href="#" class="genre" value="m">SF</a></li>
                        	      <li><a href="#" class="genre" value="m">공포</a></li>
                        	      <li><a href="#" class="genre" value="m">로맨스</a></li>
	                              <li><a href="#" class="genre" value="m">범죄</a></li>
	                              <li><a href="#" class="genre" value="m">애니메이션</a></li>
	                              <li><a href="#" class="genre" value="m">액션</a></li>
    	                          <li><a href="#" class="genre" value="m">드라마</a></li>
        	                      <li><a href="#" class="genre" value="m">코미디</a></li>
        	                      <li><a href="#" class="genre" value="m">판타지</a></li>
                       		 </ul>
                           </div>
                      </div><!-- /.navbar-collapse -->
                      </div>
                  </nav>
              </div>
              </div>      
          </div> <!-- header -->
          <%@ include file="/WEB-INF/views/include/include-body.jspf" %>
          </body>
</html>