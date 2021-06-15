<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="${path}/img/favicon.png" type="image/png" />
    <title>관심상품</title>
    <link rel="stylesheet" href="${path}/v_css/join.css" />
    <!-- Bootstrap CSS -->
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
    
    #wish{
    	width: 100px; 
    	height: 100px;
    }
        
    tr, td{
    	height: 10px;
    }
    
    .main_btn {
     	margin-top: 3px;
    }
    
    </style>
    
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#delete").click(function() {
		if(confirm("쿠폰을 정말 삭제하시겠습니까??")) {}
		else{
			return false;
		}
	});
	
});
</script>
    
</head>
<body>
	
	<!--================ Header 시작. =================-->
  	<jsp:include page="../header.jsp"/>
    <!--================ 헤더 끝. =================-->
	
	<!-- small banner -->
	<div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>쿠폰함</strong>
      </h1>
    </div>
	
	
	
	
	<section class="cart_area">
    <div class="container">
    <div class="cart_inner">
    <div class="table-responsive">
    <table class="table">
	
	
	<c:forEach items="${couponList}" var="couponDTO" varStatus="state">
		<thead>
			<tr>
				<th scope="col">${state.count}.쿠폰</th>
				<th scope="col">쿠폰이름</th>
				<th scope="col">쿠폰기간</th>
				<th scope="col">쿠폰남은기간</th>
				<th scope="col">쿠폰삭제</th>
			</tr>	
		</thead>
		<tbody>
			  <tr>
			  	  
			  	  <!-- 쿠폰 이미지 -->
                  <td>
                    <div class="media">
                      <div class="d-flex">           
                      	<c:if test="${couponDTO.couponDrate == 0}">
                      		       <img id="wish"
                          src="${path}/v_img/coupon/coupon_dprice.png";
                          alt=""
                        />
                      	</c:if>
                 		<c:if test="${couponDTO.couponDrate != 0}">
                      		       <img id="wish"
                          src="${path}/v_img/coupon/coupon_drate.png";
                          alt=""
                        />
                      	</c:if>
                      </div>
                     </div>
                  </td>
                  
                  <!-- 쿠폰이름 -->
                  <td>
                      <div class="media">
                      <div class="media-body">
                        <p>${couponDTO.couponName}</p>
                      </div>
                    </div>
                  </td>
                  
                  <!-- 쿠폰기간 -->
                  <td>
                   	 <div class="media">
                      <div class="media-body">
                        <p>${couponDTO.couponSdate}</p>
                      </div>
                    </div>
                    ~
                    <div class="media">
                      <div class="media-body">
                        <p>${couponDTO.couponFdate}</p>
                      </div>
                    </div>
                    
                  </td>
                  
                  <!-- 쿠폰남은기간 -->
                  <td>
        			  <div class="media">
                      <div class="media-body">
                        <h5>20일</h5>
                      </div>
                    </div>
                  </td>
                  
                  <!-- 쿠폰삭제 -->
                  <td>
                  	<a class="main_btn" id="delete" href="${path}/front?key=coupon&methodName=deleteCoupon&couponCode=${couponDTO.couponCode}">쿠폰삭제</a>	    
                  </td>  
                  
             </tr>
		</tbody>
	</c:forEach>
	
	
	
	
	</table>  
    </div>
    </div>
    </div>
    </section>
	
	<!--================ Header 시작. =================-->
  	<jsp:include page="../footer.jsp"/>
    <!--================ 헤더 끝. =================-->
</body>
</html>