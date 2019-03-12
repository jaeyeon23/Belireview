<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
		<!-- Slider start -->
          <div id="main-slider"> 
              <div id="home-slider" class="owl-carousel owl-theme">
                  <div class="item">
                      <img src="/brw/resources/images/slider-1.jpg" alt="slide-1" class="img-responsive">
                      <div class="slider-desc">
                          <div class="container">
                              <div class="row">
                                  <div class="col-md-6">
                                      <div class="slide-offers-left">
                                          <div class="slide-offers-title"><span>드라마</span><br/>FASHION</div>
                                          <p>New & Fvhresh collection<br/>arraival in believe store</p>
                                          <a href="/brw/drama/dramaList.br" class="btn btn-blue">드라마</a>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                       <div class="slide-offers-right">
                                          <div class="slide-offers-title"><span>영화</span><br/>FASHION</div>
                                          <p>New & Fvhresh collection<br/>arraival in believe store</p>
                                          <a href="/brw/movie/movieList.br" class="btn btn-magenta">영화</a>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="item">
                      <img src="/brw/resources/images/slider-2.jpg" alt="slide-2" class="img-responsive">
                      <div class="slider-desc">
                          <div class="container">
                              <div class="row">
                                  <div class="col-md-6">
                                      <div class="slide-offers-left">
                                          <div class="slide-offers-title"><span>광고</span><br/>for online order</div>
                                          <p>New & Fvhresh collection<br/>arraival in believe store</p>
                                          <a href="/brw/ad/adList.br" class="btn btn-blue">AD</a>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                       
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="item">
                  	  <!-- <meta data-react-helmet="true" property="og:image" content="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_1080,q_80,w_1920/v1548745097/seseepcbkomwhicbhsn1.jpg"/> -->
                      <img src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_1080,q_80,w_1920/v1548745097/seseepcbkomwhicbhsn1.jpg" alt="slide-3" class="img-responsive">
                      <div class="slider-desc">
                          <div class="container">
                              <div class="row">
                                  <div class="col-md-6">
                                      <div class="slide-offers-left">
                                          <div class="slide-offers-title"><span>광고</span><br/>for online order</div>
                                          <p>New & Fvhresh collection<br/>arraival in believe store</p>
                                          <a href="/brw/ad/adList.br" class="btn btn-blue">AD</a>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                       
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div> 
          <!-- Slider end -->
          
          <div id="content"> <!-- Content -->
              <div class="container">
                  <div class="home-content">
                      <div class="cat-offers">
                          <div class="row">
                              <div class="col-md-4">
                                  <div class="cat-sec-1">
                                      <img src="/brw/resources/images/cat-1.jpg" class="img-responsive" alt="">
                                      <div class="cat-desc">
                                          <div class="cat-inner">
                                              <div class="cat-title">man<span>Clothing</span></div>
                                              <a href="" class="btn btn-border">Buy Now</a>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-md-4">
                                  <div class="cat-sec-2">
                                      <img src="/brw/resources/images/cat-2.jpg" class="img-responsive" alt="">
                                       <div class="cat-desc">
                                           <div class="cat-inner">
                                              <div class="cat-title">woman<span>Clothing</span></div>
                                              <a href="" class="btn btn-border">Buy Now</a>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-md-4">
                                  <div class="cat-sec-3">
                                      <img src="/brw/resources/images/cat-3.jpg" class="img-responsive" alt="">
                                       <div class="cat-desc">
                                           <div class="cat-inner">
                                              <div class="cat-title">accessories<span>collections - 2014</span></div>
                                              <a href="" class="btn btn-border">shop Now</a>
                                           </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              
              <div class="newest">
                  <div class="container">
                      <div class="newest-content">
                          <div class="newest-tab">
                              <ul id="myTab" class="nav nav-tabs newest" role="tablist">
                                  <li role="presentation" class="active">
                                      <a href="#1" id="cat-1" role="tab" data-toggle="tab" aria-controls="1" aria-expanded="true">Drama</a>
                                  </li>
                                  <li role="presentation">
                                      <a href="#2" role="tab" id="cat-2" data-toggle="tab" aria-controls="2">Movie</a>
                                  </li>
                                  <li role="presentation">
                                      <a href="#3" role="tab" id="cat-3" data-toggle="tab" aria-controls="3">Advertisement</a>
                                  </li>
                              </ul>
                              
                              
                              <div id="myTabContent" class="tab-content">
                              		<!-- drama start -->
                                  <div role="tabpanel" class="tab-pane fade in active" id="1" aria-labelledby="cat-1">
                                      <div class="row clearfix">
                                      	<c:forEach items="${drama_list }" var="list">
                                          <div class="col-md-3 prdct-grid">
                                              <div class="product-fade">
													<div class="product-fade-wrap">
                                                        <div id="product-image" class="owl-carousel owl-theme">
                                                        	<c:set var="image" value="${fn:split(${list.DRAMA_CONTENT_IMAGE}, ','}"/>
                                                        	<c:forEach items="${image }" var="image">
          	                                                  <div class="item"><img src="/brw/resources/images/drama/content/${image }" alt="" class="img-responsive"></div>
                                                            </c:forEach>
                                                        </div>
														<div class="product-fade-ct">
                                                            <div class="product-fade-control">
                                                                <div class="to-left">
                                                                    <a href=""><i class="fa fa-heart"></i></a>
                                                                    <a href=""><i class="fa fa-retweet"></i></a>
                                                                    <a href=""><i class="fa fa-search"></i></a>
                                                                </div>
                                                                <div class="to-right">
                                                                    <div id="product-control" class="owl-carousel owl-theme clearfix">
                                                                        <div class="item"><div class="bullets"></div></div>
                                                                        <div class="item"><div class="bullets"></div></div>
                                                                        <div class="item"><div class="bullets"></div></div>
                                                                        <div class="item"><div class="bullets"></div></div>
                                                                    </div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                                <a href="" class="btn btn-to-cart"><span>자세히 보기</span><div class="clearfix"></div></a>
                                                            </div>
                                                            
														</div>
													</div>
                                              </div>
                                              
                                              <div class="product-name">
                                                  <a href="">${list.DRAMA_NAME }</a>
                                              </div>
                                              <div class="star-1"></div>
                                              <div class="product-price">
                                                  <span>$19.00</span> $15.00
                                              </div>
                                          </div>
                                          </c:forEach>
                                      </div>
                                  </div>
                                  <!-- drama end -->
                                  
                                  <div role="tabpanel" class="tab-pane fade" id="2" aria-labelledby="cat-2">
                                      <div class="row">
                                          <div class="col-md-12">
                                              <p>....</p>
                                          </div>
                                      </div>
                                  </div>
                                  
                                  <div role="tabpanel" class="tab-pane fade" id="3" aria-labelledby="cat-3">
                                      <div class="row">
                                          <div class="col-md-12">
                                              <p>....</p>
                                          </div>
                                      </div>
                                  </div>
                                  
                              </div>
                              
                          </div>
                      </div>
                  </div>
              </div>
              
              <div class="content-offers">
                  <div class="container">
                      <div class="ct-offers">
                          <div class="ct-offers-title">Tommy Hilfiger<br/>Women’s</div>
                          <p>The generated Lorem Ipsum is therefore always free from repetition, injected humour</p>
                          <a href="" class="btn btn-blue">Discover more Product</a>
                      </div>
                  </div>
              </div>
              
              <div class="brands">
                  <div class="container">
                      <div class="brands-inner">
                          <div class="brand-title">
                              <span>Brands</span>
                          </div>
                          
                          <div id="slider-home"> <!-- Slider -->
                              <div id="brand-carousel" class="owl-carousel owl-theme">
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-2.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-3.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-4.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-1.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-5.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-2.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-3.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-4.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-1.png" alt="slide-1" class="img-responsive">
                                  </div>
                                  <div class="item">
                                      <img src="/brw/resources/images/brand-5.png" alt="slide-1" class="img-responsive">
                                  </div>
                              </div>
                          </div> <!-- Slider -->
                          
                      </div>
                  </div>
              </div>
              
              
              <div class="rec-blog">
                  <div class="container">
                      <div class="rec-blog-inner">
                          <div class="blog-title">
                              <span>The Blog</span>
                          </div>
                          <div class="row">
                              <div class="col-md-4 blog-ct">
                                  <a href=""><img src="/brw/resources/images/rec-1.jpg" alt="" class="img-responsive"></a>
                                  <div class="blog-ct-title">
                                      <a href="">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque !</a>
                                      <span>May 11,2014</span>
                                  </div>
                              </div>
                              <div class="col-md-4 blog-ct">
                                  <a href=""><img src="/brw/resources/images/rec-2.jpg" alt="" class="img-responsive"></a>
                                  <div class="blog-ct-title">
                                      <a href="">Voluptatem accusantium doloremque</a>
                                      <span>May 11,2014</span>
                                  </div>
                              </div>
                              <div class="col-md-4 blog-ct">
                                  <a href=""><img src="/brw/resources/images/rec-3.jpg" alt="" class="img-responsive"></a>
                                  <div class="blog-ct-title">
                                      <a href="">Voluptatem accusantium doloremque</a>
                                      <span>May 11,2014</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              
          </div> <!-- Content -->
          </body>
</html>
