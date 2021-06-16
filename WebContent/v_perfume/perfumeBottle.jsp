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
    <title>향수공병</title>
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
     			<strong>향수공병</strong>
      		</h1>
    	</div>
		
	<!-- 시작 -->
	<!--================Category Product Area =================-->
    <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse">
          <div class="col-lg-9">
          
            <!-- 정렬방식 -->
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
            
            
            
            
            <!-- 이미지 반복문 감싸고 있는 태그. -->
            <div class="latest_product_inner">
              <div class="row">
               
               
                <!-- 이미지 반복문 시작 -->
                <c:forEach items="${productList}" var="productDTO">
                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="${path}/v_img/womanPerfume/${productDTO.productImg}"
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
                        <span class="mr-4"><fmt:formatNumber value="${productDTO.productPrice}"/>원</span>
                        <del><fmt:formatNumber value="${productDTO.productPrice}"/>원</del>
                      </div>
                    </div>
                  </div>
                </div>
				</c:forEach>
						
					
              </div>
            </div>
          </div>
    	  <!-- 이미지 반복시켜 주는 구문 끝. -->
    	  
          <div class="col-lg-3">
            <div class="left_sidebar_area">
              <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>향수</h3>
                </div>
                <div class="widgets_inner">
                  <ul class="list">
                    <li>
                      <a href="${path}/front?key=product&methodName=selectProCategory&category=1">여성향수</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=product&methodName=selectProCategory&category=2">남성향수</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=product&methodName=selectProCategory&category=3">남녀공용</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=product&methodName=selectProCategory&category=4">향수공병</a>
                    </li>
                  </ul>
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