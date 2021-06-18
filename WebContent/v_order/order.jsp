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
    <title>장바구니</title>
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
	
</script>

</head>
<body>
	<!--================ Header 시작. =================-->
  	<jsp:include page="../header.jsp"/>
    <!--================ 헤더 끝. =================-->
    
    <div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>주문결제</strong>
      </h1>
   	</div>
   	
   	<!-- 주문 리스트, 1개 들어올 때, 다수 들어올 때 -->
	<!--================Cart Area =================-->
    <section class="cart_area">
      <div class="container">
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
            	
              <c:forEach items="${productList}" var="productDTO" varStatus="state">
              <thead>
                <tr>
                  <th scope="col">${state.count}.상품</th>
                  <th scope="col">상품명</th>
                  <th scope="col">수량</th>
                  <th scope="col">Total Price</th>
                </tr>
              </thead>
              
              <tbody>
                <tr>
                  <!-- 상품이미지 -->
                  <td>
                    <div class="media">
                      <div class="d-flex">
                        <img id="wish"
                          src="${path}/v_img/womanPerfume/${productDTO.productImg}";
                          alt=""
                        />
                      </div>
                       </div>
                       </td>
                      
                      
                       <!-- 상품이름 -->
                       <td>
                      <div class="media">
                      <div class="media-body">
                        <p>${productDTO.productName}</p>
                      </div>
                    </div>
                  </td>
                  
                  <!-- 총 수량 -->
                  <td>
                  	${productDTO.cartQty}개
                  </td>
                  
                  <!-- 총가격 -->
                  <td>
                  	<h5><fmt:formatNumber value="${productDTO.totalPrice}" />원</h5>
                  </td>
                  
            
                  
            
                  
             
                  
                  <!-- 장바구니 담기 -->
                  <td>
                  	
                  	<!-- 주문하기 -->
                  	<a class="main_btn" href="${path}/front?key=order&methodName=moveOrderPage&productCode=${productDTO.productCode}">주문하기</a><br>
                  	
                  	<!-- 장바구니 상품삭제 -->
                  	<a class="main_btn" id="delete" href="${path}/front?key=cart&methodName=deleteCart&productCode=${productDTO.productCode}">삭제</a>	    
                  </td>
                  
                </tr>
                </tbody>                
              </c:forEach>
              
                      
              </tbody>
            </table>  
          </div>
        </div>
        
  
      </div>
    </section>
    <!--================End Cart Area =================-->
    
    
    
    
    <!-- 주문자 정보 -->
    
    <!-- 배송정보 -->
    
    <!-- 주문상품 할인적용 -->
    
    <!-- 결제정보 -->
    
    <!-- 주문자 동의 -->
    
    <!-- 최종금액 -->
    
    <!-- 장바구니 2번째 시작부분. -->
    
    
    
    
     
    <!--================ start footer Area  =================-->
  	<jsp:include page="../footer.jsp"/>
  	<!--================ End footer Area  =================-->  
</body>
</html>