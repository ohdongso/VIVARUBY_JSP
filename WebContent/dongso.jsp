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
     			<strong>마이페이지</strong>
      		</h1>
    	</div>
		
	<!-- 시작 -->
	 <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse"> 
          <div class="col-lg-9">     
            <div class="latest_product_inner">
              <div class="row">
               <div>
			   <h1>
			        <!-- 작은제목 -->
			  		<strong>회원정보확인</strong>
			   </h1>
			   </div>
			   
		  <!-- S:입력폼 -->	
			
		  
		  <!-- E:입력폼 -->		
		  
		  </div>
          </div>  
          </div>
		  
		   	
		   <!-- 좌측태그양식 시작 -->
	       <div class="col-lg-3">
            <div class="left_sidebar_area">       
               <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>마이페이지</h3>
                </div>
                <div class="widgets_inner">
                  <ul class="list">
                  	<li>
                      <a href="${path}/front?key=member&methodName=myInform">회원정보확인</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=member&methodName=myInformUpdate">회원정보수정</a>
                    </li>
                    <li>
                      <a href="${path}/v_mypage/mypage_memberDelete.jsp">회원탈퇴</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=wish&methodName=selectAllWish">관심상품목록</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=cart&methodName=selectAllCart">장바구니목록</a>
                    </li>
                    <li>
                      <a href="#">주문목록/배송조회</a>
                    </li>               
                  </ul>
                </div>
              </aside> 
            </div>
          </div>
          <!-- 좌측태그양식 끝. -->
          
          
        </div>
      </div>
	</section>
    
  	<br><br><br><br><br><br>
    <!--================ 끝. =================-->	

	<!--================ Header 시작. =================-->
	<jsp:include page="../footer.jsp"/>
    <!--================ 헤더 끝. =================-->
</body>
</html>