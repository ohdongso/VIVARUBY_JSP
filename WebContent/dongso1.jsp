<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="img/favicon.png" type="${path}/image/png" />
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${path}/v_css/join.css" />
    <link rel="stylesheet" href="${path}/css/bootstrap.css" />
    <link rel="stylesheet" href="${path}/vendors/linericon/style.css" />
    <link rel="stylesheet" href="${path}/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${path}/css/themify-icons.css" />
    <link rel="stylesheet" href="${path}/vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="${path}/vendors/lightbox/simpleLightbox.css" />
    <link rel="stylesheet" href="${path}/vendors/nice-select/css/nice-select.css" />
    <link rel="stylesheet" href="${path}/vendors/animate-css/animate.css" />
    <link rel="stylesheet" href="${path}/vendors/jquery-ui/jquery-ui.css" />
    <!-- main css -->
    <link rel="stylesheet" href="${path}/css/style.css" />
    <link rel="stylesheet" href="${path}/css/responsive.css" />
	
	<style type="text/css">
  		
    </style>
    
    <script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">


	</script>
</head>
<body>
	<!--================ Header 시작. =================-->
  	<jsp:include page="../header.jsp"/>
    <!--================ 헤더 끝. =================-->	
		  
		<!-- 분홍색 배너 -->
		<div id="Tit_NewMembe">
      		<h1 style="color: white;">
     			<strong>여성향수</strong>
      		</h1>
    	</div>
		
	<!-- 시작 -->
	    <!--================Category Product Area =================-->
    <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse">
          <div class="col-lg-9">
            <div class="product_top_bar">
              <div class="left_dorp">
                <select class="sorting">
                  <option value="1">Default sorting</option>
                  <option value="2">Default sorting 01</option>
                  <option value="4">Default sorting 02</option>
                </select>
                <select class="show">
                  <option value="1">Show 12</option>
                  <option value="2">Show 14</option>
                  <option value="4">Show 16</option>
                </select>
              </div>
            </div>
            
            <div class="latest_product_inner">
              <div class="row">
                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i1.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i2.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i3.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i4.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i5.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i6.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i7.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i8.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="img/product/inspired-product/i2.jpg"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>Latest men’s sneaker</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">$25.00</span>
                        <del>$35.00</del>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
    
          <div class="col-lg-3">
            <div class="left_sidebar_area">
              <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>Browse Categories</h3>
                </div>
                <div class="widgets_inner">
                  <ul class="list">
                    <li>
                      <a href="#">Frozen Fish</a>
                    </li>
                    <li>
                      <a href="#">Dried Fish</a>
                    </li>
                    <li>
                      <a href="#">Fresh Fish</a>
                    </li>
                    <li>
                      <a href="#">Meat Alternatives</a>
                    </li>
                    <li>
                      <a href="#">Fresh Fish</a>
                    </li>
                    <li>
                      <a href="#">Meat Alternatives</a>
                    </li>
                    <li>
                      <a href="#">Meat</a>
                    </li>
                  </ul>
                </div>
              </aside>

              <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>Product Brand</h3>
                </div>
                <div class="widgets_inner">
                  <ul class="list">
                    <li>
                      <a href="#">Apple</a>
                    </li>
                    <li>
                      <a href="#">Asus</a>
                    </li>
                    <li class="active">
                      <a href="#">Gionee</a>
                    </li>
                    <li>
                      <a href="#">Micromax</a>
                    </li>
                    <li>
                      <a href="#">Samsung</a>
                    </li>
                  </ul>
                </div>
              </aside>

              <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>Color Filter</h3>
                </div>
                <div class="widgets_inner">
                  <ul class="list">
                    <li>
                      <a href="#">Black</a>
                    </li>
                    <li>
                      <a href="#">Black Leather</a>
                    </li>
                    <li class="active">
                      <a href="#">Black with red</a>
                    </li>
                    <li>
                      <a href="#">Gold</a>
                    </li>
                    <li>
                      <a href="#">Spacegrey</a>
                    </li>
                  </ul>
                </div>
              </aside>

              <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>Price Filter</h3>
                </div>
                <div class="widgets_inner">
                  <div class="range_item">
                    <div id="slider-range"></div>
                    <div class="">
                      <label for="amount">Price : </label>
                      <input type="text" id="amount" readonly />
                    </div>
                  </div>
                </div>
              </aside>
            </div>
          </div>
        </div>
      </div>
    </section>

	<!--================ Header 시작. =================-->
	<jsp:include page="../footer.jsp"/>
    <!--================ 헤더 끝. =================-->
</body>
</html>