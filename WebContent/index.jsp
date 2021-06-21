<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <link rel="icon" href="img/favicon.png" type="image/png" />
  <title>VIVARUBY! NO.1 향수★스킨케어쇼핑몰</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.css" />
  <link rel="stylesheet" href="vendors/linericon/style.css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" />
  <link rel="stylesheet" href="css/themify-icons.css" />
  <link rel="stylesheet" href="css/flaticon.css" />
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
  <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css" />
  <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
  <link rel="stylesheet" href="vendors/animate-css/animate.css" />
  <link rel="stylesheet" href="vendors/jquery-ui/jquery-ui.css" />
  <!-- main css -->
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/responsive.css" />
<style type="text/css">
 
    #slide{
      position:relative;
      width: 100%;
	  height: 100%;
    }

    #slide li{
      position:relative;
      top:0;
      left:0;
      display:none;
      -webkit-display:block;
    }
	
	#slide img{ 
     width:100%; 
     height: 100%; 
    }  
	
	.jb-wrap {
	width: 100%;
	position: relative;
	}
			
	.jb-wrap img {
	width: 100%;
	}
			
	.jb-text {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 60%;
	left: 75%;
	}

</style>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	 function aa(idV){
		
			// 찜하기.
			var session = "${sessionScope.loginUser}";
			if(session == "") {
				alert("로그인하고 서비스를 이용해 주세요.");
				return;
			}
			
			var urlAddr = "${path}/insertWish";

			$.ajax({
				url : urlAddr, 
				type : "post", 
				dataType : "text", 
				data: {id:"${sessionScope.loginUser}", productCode:idV},
				success : function(result) {
					
					if(result == 0) {
						alert("이미 관심 상품에 등록 되었습니다.");
					} else {
						alert("관심 상품에 등록 되었습니다.");
					}
					
				},
				error: function(err) {
					alert(err + "발생했습니다.");
				}
			});
			
	   } // aa() 메소드 끝.

// 팝업
</script>
</head>

<body>
  	
  <!--================ Header 시작. =================-->
  <jsp:include page="header.jsp"/>
  <!--================ 헤더 끝. =================-->
  
  <!--================Home Banner Area =================-->
	<img src="${path}/img/banner/banner1.PNG">
  <!--================End Home Banner Area =================-->
  
  <!--================ new상품 =================-->
  <section class="new_product_area section_gap_top section_gap_bottom_custom">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h1><span>♥NEW 상품♥</span></h1>
            <p>이제 막 갓 나온 따끈 따끈한 신제품입니다.</p>
            <a href="#">#완전 핫 신상</a> <a href="#">#지금금방</a> <a href="#">#뽑았어요</a>
          </div>
        </div>
      </div>
      
      <!-- 새상품, top1 -->
      <div class="row">
         <div class="col-lg-6">
          <div class="new_product">
            <h1 style="color: gray ;"><strong>New Top.1</strong></h1>
            <h5 class="text-uppercase">${newDTO.productName}</h5>
            <h3 class="text-uppercase">${newDTO.productContent}</h3>
            <div class="product-img">
              <img class="img-fluid" src="${path}/v_img/womanPerfume/${newDTO.productImg}" alt="" />
            </div>
            <h4><fmt:formatNumber value="${newDTO.productPrice}"/>원</h4>
            <a href="${path}/front?key=product&methodName=productDetail&productCode=${newDTO.productCode}" class="main_btn">바로가기</a>
          </div>
         </div>
	
	    	<div class="col-lg-6 mt-5 mt-lg-0">
          	<div class="row">
          	
          	<c:forEach items="${productNew}" var="newDTO">
            <div class="col-lg-6 col-md-6">
              <div class="single-product">
                <div class="product-img">
                  <img class="img-fluid w-100" src="${path}/v_img/womanPerfume/${newDTO.productImg}" alt="" />
                  <div class="p_icon">
                    <a href="${path}/front?key=product&methodName=productDetail&productCode=${newDTO.productCode}">
                      <i class="ti-eye"></i>
                    </a>
                    <a href="javascript:aa(${newDTO.productCode})">
                      <i class="ti-heart"></i>
                    </a>
                    <a href="${path}/front?key=product&methodName=productDetail&productCode=${newDTO.productCode}">
                      <i class="ti-shopping-cart"></i>
                    </a>
                  </div>
                </div>
                <div class="product-btm">
                  <a href="#" class="d-block">
                  <h4><strong>${newDTO.productName}</strong></h4><p>
                  <h4>용량 : ${newDTO.productCapacity}ml</h4>
                  <h4 style="color: red">구매횟수 : ♥${newDTO.productSell}번♥</h4>
                  </a>
                  <div class="mt-3">
                   	<del><fmt:formatNumber value="${newDTO.productPrice * 1.2}"/>원</del> → 
                    <span class="mr-4"><fmt:formatNumber value="${newDTO.productPrice}"/>원</span>               
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>                   
          </div>
        </div>     
      </div>
      
      
    </div>
  </section>
  <!--================ new제품 끝. =================-->
  
  
  
  
  
  		<!-- 중간배너 시작. -->
		<div class="jb-wrap">
			<div class="jb-image"><img src="${path}/img/banner/man.jpg" alt=""></div>
			<div class="jb-text">
				<h1 class="text-uppercase mb-40">all product's collection</h1>
            	<h2 class="text-uppercase">20% off</h2>
            	<a href="${path}/front?key=product&methodName=selectProCategory&category=1" class="main_btn mb-20 mt-5">바로가기</a>
            	<p>Limited Time Offer</p>
			</div>
		</div>
		<br><br><br><br>
        <!-- 중간배너 끝. -->   


  <!-- 베스트 상품 시작. -->
  <section class="feature_product_area section_gap_bottom_custom">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h1><span>♥BEST 상품♥</span></h1>
            <p>시선집중! 베스트상품!</p>
            <a href="#">#베스트상품</a> <a href="#">#완전 핫 상품</a> <a href="#">#이 가격에?</a> 
          </div>
        </div>
      </div>
	  
	  
	  <!--================ 베스트 상품 시작. =================-->
      <div class="row">
      <c:forEach items="${productBest}" var="productDTO" varStatus="state">      
       <!-- 베스트 상품1 -->
        <div class="col-lg-4 col-md-6">
          <div class="single-product">
            <div class="product-img">
              <img class="img-fluid w-100" src="${path}/v_img/womanPerfume/${productDTO.productImg}" alt="" />
              <div class="p_icon">
               
                <!-- 상세보기 -->
                <a href="${path}/front?key=product&methodName=productDetail&productCode=${productDTO.productCode}">
                  <i class="ti-eye"></i>
                </a>
                
                 <!-- 찜하기 -->
                <a href="javascript:aa(${newDTO.productCode})">
                	<i class="ti-heart"></i>
                </a>
                    
                <!-- 장바구니 담기 -->
                <a href="${path}/front?key=product&methodName=productDetail&productCode=${productDTO.productCode}">
                  <i class="ti-shopping-cart"></i>
                </a>     
              </div>
            </div>
            
            
                <div class="product-btm">
                  <a href="#" class="d-block">
                  <h4><strong>${productDTO.productName}</strong></h4><p>
                  <h4>용량 : ${productDTO.productCapacity}ml</h4>
                  <h4 style="color: red">구매횟수 : ♥${productDTO.productSell}번♥</h4>
                  </a>
                  <div class="mt-3">
                   	<del><fmt:formatNumber value="${productDTO.productPrice * 1.2}"/>원</del> → 
                    <span class="mr-4"><fmt:formatNumber value="${productDTO.productPrice}"/>원</span>               
                  </div>
                </div>
            
            
          </div>
        </div>
		</c:forEach> 
      </div>
      
      
    </div>
  </section>
  <!--================ 베스트 상품 끝. =================-->

	

  <!--================ 추천상품 =================-->
  <section class="inspired_product_area section_gap_bottom_custom">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h1><span>♥MD'S 추천상품♥</span></h1>
            <p>MD가 자신있게 추천드리는 상품입니다.</p>
            <a href="#">#추천상품</a> <a href="#">#완전 핫 상품</a> <a href="#">#이 가격에?</a> 
          </div>
        </div>
      </div>

      <div class="row">
        <c:forEach items="${productLike}" var="productDTO" varStatus="state">      
        <div class="col-lg-3 col-md-6">
          <div class="single-product">
            <div class="product-img">
              <img class="img-fluid w-100" src="${path}/v_img/womanPerfume/${productDTO.productImg}" alt="" />
              <div class="p_icon">
              
                <!-- 제품상세보기 -->
                <a href="${path}/front?key=product&methodName=productDetail&productCode=${productDTO.productCode}">
                  <i class="ti-eye"></i>
                </a>
                
                  <!-- 찜하기 -->
                <a href="javascript:aa(${newDTO.productCode})">
                	<i class="ti-heart"></i>
                </a>
                    
                <!-- 장바구니 담기 -->
                <a href="${path}/front?key=product&methodName=productDetail&productCode=${productDTO.productCode}">
                  <i class="ti-shopping-cart"></i>
                </a>             
              </div>
            </div>
            
            <div class="product-btm">
                  <a href="#" class="d-block">
                  <h4><strong>${productDTO.productName}</strong></h4><p>
                  <h4>용량 : ${productDTO.productCapacity}ml</h4>
                  <h4 style="color: red">구매횟수 : ♥${productDTO.productSell}번♥</h4>
                  </a>
                  <div class="mt-3">
                   	<del><fmt:formatNumber value="${productDTO.productPrice * 1.2}"/>원</del> → 
                    <span class="mr-4"><fmt:formatNumber value="${productDTO.productPrice}"/>원</span>               
                  </div>
           </div>
                 
          </div>
        </div>
		</c:forEach>
      </div>
    </div>
  </section>
  <!--================ 추천상품 끝. =================-->

  <!--================ Start Blog Area =================-->
  <section class="blog-area section-gap">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h1><span>상품 Review</span></h1>
            <p>매달 추첨을 통해 베스트 후기 1분에게 적립금을 드려요!</p>
            <a href="#">#소중한 고객님 후기</a>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="single-blog">
            <div class="thumb">
              <img class="img-fluid" src="${path}/v_img/womanPerfume/w1.jpg" alt="">
            </div>
            <div class="short_details">
              <div class="meta-top d-flex">
                <a href="#">By Admin</a>
                <a href="#"><i class="ti-comments-smiley"></i>2 Comments</a>
              </div>
              <a class="d-block" href="single-blog.html">
                <h4>[딥티크] 딥티크 필로시코스 EDT</h4>
              </a>
              <div class="text-wrap">
                <p>
                 	 냄새가 너무 좋은거 같습니다. 다시한번 구매 하고 싶네요 ^^
                </p>
              </div>
              <a href="#" class="blog_btn">Learn More <span class="ml-2 ti-arrow-right"></span></a>
            </div>
          </div>
        </div>
        
        <div class="col-lg-4 col-md-6">
          <div class="single-blog">
            <div class="thumb">
              <img class="img-fluid" src="${path}/v_img/womanPerfume/w10.jpg" alt="">
            </div>
            <div class="short_details">
              <div class="meta-top d-flex">
                <a href="#">By Admin</a>
                <a href="#"><i class="ti-comments-smiley"></i>2 Comments</a>
              </div>
              <a class="d-block" href="single-blog.html">
                <h4>[에르메스] 에르메스 운 자르뎅 수르 라 라군 EDT</h4>
              </a>
              <div class="text-wrap">
                <p>             		
              		기사분이 너무 친절하시네요. 많이 파세요~♥
                </p>
              </div>
              <a href="#" class="blog_btn">Learn More <span class="ml-2 ti-arrow-right"></span></a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6">
          <div class="single-blog">
            <div class="thumb">
              <img class="img-fluid" src="${path}/v_img/womanPerfume/w3.jpg" alt="">
            </div>
            <div class="short_details">
              <div class="meta-top d-flex">
                <a href="#">By Admin</a>
                <a href="#"><i class="ti-comments-smiley"></i>2 Comments</a>
              </div>
              <a class="d-block" href="single-blog.html">
                <h4>[로샤스] 로샤스 걸 EDT</h4>
              </a>
              <div class="text-wrap">
                <p>        
                  배송이 너무 빠르네요. 감사합니다.!!               
                </p>
              </div>
              <a href="#" class="blog_btn">Learn More <span class="ml-2 ti-arrow-right"></span></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================ End Blog Area =================-->

  <!--================ start footer Area  =================-->
  <jsp:include page="footer.jsp"/>
  <!--================ End footer Area  =================-->
  
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/stellar.js"></script>
  <script src="vendors/lightbox/simpleLightbox.min.js"></script>
  <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
  <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
  <script src="vendors/isotope/isotope-min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
  <script src="vendors/counter-up/jquery.counterup.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/theme.js"></script>
</body>

</html>