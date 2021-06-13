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
	$(function() {
		// 찜하기.
		$("[name=wish]").click(function() {
			var session = "${sessionScope.loginUser}";
			if(session == "") {
				alert("로그인하고 서비스를 이용해 주세요.");
				return;
			}
			
			var urlAddr = "${path}/insertWish";

			$.ajax({
				url : urlAddr, // 서버요청주소
				type : "post", // method방식 = 전송방식(get, post, put, delete)
				dataType : "text", // 서버가 응답해주는 데이터의 타입(html, text, json 중의 한개), 기본 text
				data: {id:"${sessionScope.loginUser}", productCode:$(this).attr("id")}, // 폼전송 : 서버에게 보낼 parameter 정보, 전체를 전달
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
			}); // ajax끝.
		}); // 찜하기 끝.
	}); // jQuery끝.
// 팝업
/* function openPopup() {
 	alert(1);
    var _width = '650';
    var _height = '380';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
    window.open('/url', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 
}
openPopup(); */

imgslide(); //페이지가 로딩될때 함수를 실행합니다

function imgslide(){
    $val = $("#slide").attr("val"); //현재 이미지 번호를 가져옵니다
    $mx = $("#slide").attr("mx"); //총 이미지 개수를 가져옵니다
    
    $("#img" + $val).hide(); //현재 이미지를 사라지게 합니다.
	
	if( $val == $mx ){ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.
	else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다
	$("#img"+$val).fadeIn(1000); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	
	$("#slide").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.
	setTimeout('imgslide()',3500); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
}

</script>
</head>

<body>

  <!--================ Header 시작. =================-->
  <jsp:include page="header.jsp"/>
  <!--================ 헤더 끝. =================-->
  
  <!--================Home Banner Area =================-->
  <div id="slide"  val="1" mx="3">
	<li id="img1"><img src="${path}/img/banner/banner1.PNG"></li>
  	<li id="img2"><img src="${path}/img/banner/banner2.PNG"></li>
  	<li id="img3"><img src="${path}/img/banner/banner3.PNG"></li>
  </div>
  <!--================End Home Banner Area =================-->
  
  <!--================ new상품 =================-->
  <section class="new_product_area section_gap_top section_gap_bottom_custom">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
             <h1><span>NEW 상품</span></h1>
            <p>이제 막 갓 나온 따끈 따끈한 신제품입니다.</p>
            <a href="#">#완전 핫 신상</a> <a href="#">#지금금방</a> <a href="#">#뽑았어요</a>
          </div>
        </div>
      </div>
      
      <div class="row">
         <div class="col-lg-6">
          <div class="new_product">
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
                    <a href="#">
                      <i class="ti-heart" name="wish" id="${newDTO.productCode}"></i>
                    </a>
                    <a href="#">
                      <i class="ti-shopping-cart"></i>
                    </a>
                  </div>
                </div>
                <div class="product-btm">
                  <a href="#" class="d-block">
                    <h4>Nike latest sneaker</h4>
                  </a>
                  <div class="mt-3">
                    <span class="mr-4"><fmt:formatNumber value="${newDTO.productPrice}"/>원</span>
                    <del><fmt:formatNumber value="${newDTO.productPrice}"/>원</del>
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
  
    <!--================ Offer Area =================-->

<%--     <img alt="" src="${path}/img/banner/man.jpg" style="width: 100%; height: 50%; align-items: center;"> --%>
  
		<div class="jb-wrap">
			<div class="jb-image"><img src="${path}/img/banner/man.jpg" alt=""></div>
			<div class="jb-text">
				<h1 class="text-uppercase mb-40">all man's collection</h1>
            	<h2 class="text-uppercase">20% off</h2>
            	<a href="${path}" class="main_btn mb-20 mt-5">바로가기</a>
            	<p>Limited Time Offer</p>
			</div>
		</div>
           



  <!--================ End Offer Area =================-->
  
  <br><br><br><br>
  <!-- 베스트 상품 -->
  <section class="feature_product_area section_gap_bottom_custom">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h1><span>BEST 상품</span> </h1>
            <p>시선집중! 베스트상품!</p>
            <a href="#">#베스트상품</a> <a href="#">#완전 핫 상품</a> <a href="#">#이 가격에?</a> 
          </div>
        </div>
      </div>
	  
	  <!-- 베스트 상품 시작. -->
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
                <a href="#">
                  <i class="ti-heart" name="wish" id="${productDTO.productCode}" ></i>
                </a>
                
                <!-- 장바구니 담기 -->
                <a href="#">
                  <i class="ti-shopping-cart"></i>
                </a>
                
              </div>
            </div>
            <div class="product-btm">
              <a href="#" class="d-block">
                <h4>${productDTO.productName}</h4>
              </a>
              <div class="mt-3">
                <span class="mr-4"><fmt:formatNumber value="${productDTO.productPrice}" />원</span>
                <del><fmt:formatNumber value="${productDTO.productPrice}" /></del>
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
            <h1><span></span>MD'S 추천상품</h1>
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
                <a href="${path}/front?key=product&methodName=productDetail&productCode=${productDTO.productCode}">
                  <i class="ti-eye"></i>
                </a>
                <a href="#">
                  <i class="ti-heart" name="wish" id="${productDTO.productCode}"></i>
                </a>
                <a href="#">
                  <i class="ti-shopping-cart"></i>
                </a>
              </div>
            </div>
            <div class="product-btm">
              <a href="#" class="d-block">
                <h4>${productDTO.productName}</h4>
              </a>
              <div class="mt-3">
                <span class="mr-4"><fmt:formatNumber value="${productDTO.productPrice}" />원</span>
                <del><fmt:formatNumber value="${productDTO.productPrice}" />원</del>
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
            <h1><span>Premium Review</span></h1>
            <p>매달 추첨을 통해 베스트 후기 1분에게 적립금을 드려요!</p>
            <a href="#">#소중한 고객님 후기</a>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="single-blog">
            <div class="thumb">
              <img class="img-fluid" src="img/b1.jpg" alt="">
            </div>
            <div class="short_details">
              <div class="meta-top d-flex">
                <a href="#">By Admin</a>
                <a href="#"><i class="ti-comments-smiley"></i>2 Comments</a>
              </div>
              <a class="d-block" href="single-blog.html">
                <h4>Ford clever bed stops your sleeping
                  partner hogging the whole</h4>
              </a>
              <div class="text-wrap">
                <p>
                  Let one fifth i bring fly to divided face for bearing the divide unto seed winged divided light
                  Forth.
                </p>
              </div>
              <a href="#" class="blog_btn">Learn More <span class="ml-2 ti-arrow-right"></span></a>
            </div>
          </div>
        </div>
        
        <div class="col-lg-4 col-md-6">
          <div class="single-blog">
            <div class="thumb">
              <img class="img-fluid" src="img/b2.jpg" alt="">
            </div>
            <div class="short_details">
              <div class="meta-top d-flex">
                <a href="#">By Admin</a>
                <a href="#"><i class="ti-comments-smiley"></i>2 Comments</a>
              </div>
              <a class="d-block" href="single-blog.html">
                <h4>Ford clever bed stops your sleeping
                  partner hogging the whole</h4>
              </a>
              <div class="text-wrap">
                <p>
                  Let one fifth i bring fly to divided face for bearing the divide unto seed winged divided light
                  Forth.
                </p>
              </div>
              <a href="#" class="blog_btn">Learn More <span class="ml-2 ti-arrow-right"></span></a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6">
          <div class="single-blog">
            <div class="thumb">
              <img class="img-fluid" src="img/b3.jpg" alt="">
            </div>
            <div class="short_details">
              <div class="meta-top d-flex">
                <a href="#">By Admin</a>
                <a href="#"><i class="ti-comments-smiley"></i>2 Comments</a>
              </div>
              <a class="d-block" href="single-blog.html">
                <h4>Ford clever bed stops your sleeping
                  partner hogging the whole</h4>
              </a>
              <div class="text-wrap">
                <p>
                  Let one fifth i bring fly to divided face for bearing the divide unto seed winged divided light
                  Forth.
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