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
  <link rel="icon" href="img/favicon.png" type="${path}/image/png" />
  <title>VIVARUBY! NO.1 향수★스킨케어쇼핑몰</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${path}/css/bootstrap.css" />
  <link rel="stylesheet" href="${path}/vendors/linericon/style.css" />
  <link rel="stylesheet" href="${path}/css/font-awesome.min.css" />
  <link rel="stylesheet" href="${path}/css/themify-icons.css" />
  <link rel="stylesheet" href="${path}/css/flaticon.css" />
  <link rel="stylesheet" href="${path}/vendors/owl-carousel/owl.carousel.min.css" />
  <link rel="stylesheet" href="${path}/vendors/lightbox/simpleLightbox.css" />
  <link rel="stylesheet" href="${path}/vendors/nice-select/css/nice-select.css" />
  <link rel="stylesheet" href="${path}/vendors/animate-css/animate.css" />
  <link rel="stylesheet" href="${path}/vendors/jquery-ui/jquery-ui.css" />
  <!-- main css -->
  <link rel="stylesheet" href="${path}/css/style.css" />
  <link rel="stylesheet" href="${path}/css/responsive.css" />
</head>
<body>
  
  <!--================ Header 시작. =================-->
  <header class="header_area">
    <div class="top_menu">
      <div class="container">
        <div class="row">
          <div class="col-lg-7">
            <div class="float-left">
              <p>Tel : 031-716-2113</p>
              <p>매장위치찾기</p>
            </div>
          </div>

          <!-- 우측 최상단, 로그인, 회원가입 -->
          <div class="col-lg-5">
            <div class="float-right">
              <ul class="right_side">
                          
                <li>          
                  <c:if test="${sessionScope.loginUser==null}">
                  <a href="${path}/v_member/login.jsp">
                    로그인
                  </a>
                  </c:if>
                  <c:if test="${sessionScope.loginUser!=null}">
                  <a href="#">
                  ${loginName}님 환영합니다.
                  </a>
                  </c:if>
                </li>
                <li>
                  <c:if test="${sessionScope.loginUser==null}">
                  <a href="${path}/v_member/join.jsp">
                    회원가입
                  </a>
                  </c:if>
                  <c:if test="${sessionScope.loginUser!=null}">
                  <a href="${path}/front?key=member&methodName=logout">
                    로그아웃
                  </a>
                  </c:if>                   
                </li>
                  <c:if test="${sessionScope.loginUser!=null}">
					<li>
						<a href="${path}/front?key=coupon&methodName=selectAllCoupon">
					 	쿠폰함
						</a>
					</li>
				 </c:if>     
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    <div class="main_menu">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light w-100">
          <!-- Brand and toggle get grouped for better mobile display -->
          <a class="navbar-brand logo_h" href="${path}/Main.jsp">
            <img src="${path}/img/logo.png" alt="" />
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
          
   		  <!-- 메인메뉴 시작부분 -->
          <div class="collapse navbar-collapse offset w-100" id="navbarSupportedContent">
            <div class="row w-100 mr-0">
              <div class="col-lg-7 pr-0">
                <ul class="nav navbar-nav center_nav pull-right">
                  
                  <li class="nav-item submenu dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                      aria-expanded="false" >향수</a>
                      <ul class="dropdown-menu">
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=product&methodName=selectProCategory&category=1">여성향수</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=product&methodName=selectProCategory&category=2">남성향수</a>
                      </li>     
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=product&methodName=selectProCategory&category=3">남녀공용</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=product&methodName=selectProCategory&category=4">향수공병</a>
                      </li>
                      <c:if test="${sessionScope.loginState == 0}">
                      <li class="nav-item">
                      	<a class="nav-link" href="v_product/insertProduct.jsp">상품등록</a>
                      </li>
                      </c:if>
                    </ul>
                  </li>
                                          
       			  <li class="nav-item">
                    <a class="nav-link" href="${path}/front?key=product&methodName=selectProCategory&category=5">선물세트</a>
                  </li>
                                          
                  <li class="nav-item submenu dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                      aria-expanded="false">스킨케어</a>
                    <ul class="dropdown-menu">
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=product&methodName=selectProCategory&category=6">바디케어</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=product&methodName=selectProCategory&category=7">화장품</a>
                      </li>
                    </ul>
                  </li>
                  
                  
                 <li class="nav-item submenu dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                      aria-expanded="false">문의사항</a>
                    <ul class="dropdown-menu">
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/v_board/board.jsp">자유게시판</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/v_review/review.jsp">리뷰게시판</a>
                      </li>     <li class="nav-item">
                        <a class="nav-link" href="${path}/v_refund/refund.jsp">교환,환불 게시판</a>
                      </li>
                    </ul>
                  </li>
                  
                   <li class="nav-item submenu dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                      aria-expanded="false">기타</a>
                    <ul class="dropdown-menu">
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=faq&methodName=selectAll">FAQ</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="${path}/front?key=notice&methodName=selectAll">공지사항</a>
                      </li>     <li class="nav-item">
                        <a class="nav-link" href="">1:1문의</a>
                      </li>
                    </ul>
                  </li>                
                </ul>
              </div>

              <div class="col-lg-5 pr-0">
                <ul class="nav navbar-nav navbar-right right_nav pull-right">
                  <li class="nav-item">
                    <a href="#" class="icons">
                      <i class="ti-search" aria-hidden="true"></i>
                    </a>
                  </li>
			      
			      <!-- 장바구니 -->
                  <li class="nav-item">
                    <a href="${path}/front?key=cart&methodName=selectAllCart" class="icons">
                      <i class="ti-shopping-cart"></i>
                    </a>
                  </li>
				  
				  <!-- 마이페이지 이동, 마이페이지에서 이동 할수 있도록 해야한다. -->
                  <li class="nav-item">
                    <a href="${path}/front?key=member&methodName=myInform" class="icons">
                      <i class="ti-user" aria-hidden="true"></i>
                    </a>
                  </li>
				  
				  <!-- 찜하기로 이동 -->
                  <li class="nav-item">
                    <a href="${path}/front?key=wish&methodName=selectAllWish" class="icons">
                      <i class="ti-heart" aria-hidden="true"></i>
                    </a>
                  </li>
                       
                </ul>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </header>
  <!--================ 헤더 끝. =================-->
	
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="${path}/js/jquery-3.2.1.min.js"></script>
  <script src="${path}/js/popper.js"></script>
  <script src="${path}/js/bootstrap.min.js"></script>
  <script src="${path}/js/stellar.js"></script>
  <script src="${path}/vendors/lightbox/simpleLightbox.min.js"></script>
  <script src="${path}/vendors/nice-select/js/jquery.nice-select.min.js"></script>
  <script src="${path}/vendors/isotope/imagesloaded.pkgd.min.js"></script>
  <script src="${path}/vendors/isotope/isotope-min.js"></script>
  <script src="${path}/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="${path}/js/jquery.ajaxchimp.min.js"></script>
  <script src="${path}/vendors/counter-up/jquery.waypoints.min.js"></script>
  <script src="${path}/vendors/counter-up/jquery.counterup.js"></script>
  <script src="${path}/js/mail-script.js"></script>
  <script src="${path}/js/theme.js"></script>
	
</body>
</html>