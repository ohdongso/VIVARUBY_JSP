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
    <title>여성향수</title>
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
  	#dongso1 {
	height: 20px;
	width: 200px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	}

	#dongso2 {
	font-size: 16px;
	width: 200px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

	#dongso3 {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff;
}
    </style>
    
    <script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
$(function() {
		$("#delete").click(function() {
			if(confirm("상품을 삭제 하시겠습니까??")){} 
			else {
				return false;	
			}
		});
});


	
	
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
            
            <!-- 정렬방식 -->
            <div class="product_top_bar" align="center">   
            
              <div class="left_dorp">
              	
              	<div align="center">     	
   				
   				<a href="${path}/front?key=product&methodName=selectProductCapacity&category=1&min=30&max=49">30ml~49ml</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
              	<a href="${path}/front?key=product&methodName=selectProductCapacity&category=1&min=50&max=79">50ml~79ml</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a href="${path}/front?key=product&methodName=selectProductCapacity&category=1&min=80&max=100">80ml~100ml</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
              	<a href="${path}/front?key=product&methodName=selectNewProduct&category=1">신상품</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	
           	    <a href="${path}/front?key=product&methodName=selectProductName&category=1">상품명</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	             	    
           	    <a href="${path}/front?key=product&methodName=selectQtySell&category=1">인기순</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	    
           	    <a href="${path}/front?key=product&methodName=selectMinPrice&category=1">낮은가격</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
           	    
           	    <a href="${path}/front?key=product&methodName=selectMaxPrice&category=1">높은가격</a>
              	</div>             	
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
                        <a href="${path}/front?key=product&methodName=productDetail&productCode=${productDTO.productCode}">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="javascript:aa(${productDTO.productCode})">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="${path}/front?key=product&methodName=productDetail&productCode=${productDTO.productCode}">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                      
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4><strong>${productDTO.productName}</strong></h4><p>
                         <h4>용량 : ${productDTO.productCapacity}ml</h4>
                         <h4 style="color: red" >구매횟수 : ♥${productDTO.productSell}번♥</h4>
                      </a>
                      <div class="mt-3">
                        <del><fmt:formatNumber value="${productDTO.productPrice * 1.2}"/>원</del> →
                        <span class="mr-4"><fmt:formatNumber value="${productDTO.productPrice}"/>원</span>
						
						<c:if test="${sessionScope.loginState == 0}">
						<div align="right">						          
						<form action="${path}/front?key=product&methodName=productDelete" method="post">
							<input type="hidden" name="productCode" value="${productDTO.productCode}">
							<input type="submit" id="delete" value="삭제" class="main_btn">
                      	</form>
                      	</div>
                      	</c:if>
                      	
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
            
            
            <!-- 검색 -->
 			<div style="float: right;" >
 			<form action="${path}/front?key=product&methodName=selectProName" method="post">
				<input type="text" placeholder="상품명 검색" name="productName" style="width: 218px;" >
				<input type="submit" value="검색">
				<input type="hidden" name="category" value="1">
			</form>
			</div>
			
			
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