<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	 <div id="header"> <!-- header -->
              <div class="top"> <!-- top -->
                  <div class="container">
                      <div class="top-control">
                          <a href="">로그인</a><span>•</span><a href="">회원가입</a>
                      </div>
                  </div>
              </div> <!-- top end -->
              
              <div id="believe-nav"> <!-- Nav -->
                  <div class="container">
                      <div class="min-marg">
                          <nav class="navbar navbar-default">
                              <!-- <div class="container-fluid"> -->
                                  <!-- Brand and toggle get grouped for better mobile display -->
                                  <div class="navbar-header">
                                     <!--  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                          <span class="sr-only">Toggle navigation</span>
                                          <span class="icon-bar"></span>
                                          <span class="icon-bar"></span>
                                          <span class="icon-bar"></span>
                                      </button> -->
                                      <a class="navbar-brand" href=""><img src="/brw/resources/images/logos.jpg" width="150px" alt=""></a>
                                  </div>

                                  <!-- Collect the nav links, forms, and other content for toggling -->
                                  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                      <ul class="nav navbar-nav">
                                          <li class="active"><a href="">Home <span class="sr-only">(current)</span></a></li>
                                          <li><a href="">Drama</a></li>
                                          <li><a href="">Movie</a></li>
                                          <li><a href="">Advertisement</a></li>
                                          <li><a href="">Admin</a></li>
                                      </ul>
                                     
                                      <ul class="nav navbar-nav navbar-right">
                                          <li class="menu-search-form">
                                              <a href="#" id="open-srch-form"><img src="/brw/resources/images/srch.png" alt="srch"></a>
                                          </li>
                                          <li><a href="#"><img src="/brw/resources/images/sample.JPG" alt="bag" width="60" height="45" style="border-radius:150px; margin-top:-10px; "></a></li>
                                          <li id="open-srch-form-mod">
                                              <div>
                                                  <form class="side-search">
                                                      <div class="input-group">
                                                          <input type="text" class="form-control search-wid" placeholder="Search Here" aria-describedby="basic-addon1">
                                                          <a href="" class="input-group-addon btn-side-serach" id="basic-addon1"><i class="fa fa-search"></i></a>
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
                          <form class="side-search">
                              <div class="input-group">
                                  <input type="text" class="form-control search-wid" placeholder="Search Here" aria-describedby="basic-addon2">
                                  <a href="" class="input-group-addon btn-side-serach" id="basic-addon2"><i class="fa fa-search"></i></a>
                              </div>
                          </form>
                      </div>
                  </div>
              </div> <!-- Nav -->
              
              
              <div id="cat-nav">
              <div class="container">
                  <nav class="navbar navbar-default">
                      <!-- <div class="container-fluid"> -->
                      <!-- Brand and toggle get grouped for better mobile display -->
                      <div class="navbar-header">
                          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#cat-nav-mega">
                              <span class="sr-only">Toggle navigation</span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                          </button>
                      </div>

                      <!-- Collect the nav links, forms, and other content for toggling -->
                      <div class="collapse navbar-collapse" id="cat-nav-mega">
                          <ul class="nav navbar-nav">
                              <li class="active"><a href="#">장르</a></li>
                              
                              <li><a href="">로맨스</a></li>
                              <li><a href="">공포•호러</a></li>
                              <li><a href="">판타지</a></li>
                              <li><a href="">메디컬</a></li>
                              <li><a href="">애니메이션</a></li>
                              <li><a href="">예능</a></li>
                              <li><a href="">코미디</a></li>
                              <li><a href="">종교</a></li>
                              <li><a href="">SF</a></li>
                              <li><a href="">재난</a></li>
                          </ul>
                           
                      </div><!-- /.navbar-collapse -->
                      <!--</div> -->
                  </nav>
              </div>
              </div>      
          </div> <!-- header -->
          </body>
</html>