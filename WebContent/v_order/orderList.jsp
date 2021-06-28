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
  		#wish{
  			width: 100px;
  			height: 100px;
  		}
  		
  		#delete{
  			margin-top: 5px;
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
	
	<!-- small banner -->
	<div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>주문목록/배송조회</strong>
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
			  		<strong>주문목록/배송조회</strong>
			   </h1>
			   </div>
			   
			   
			  
        <hr style="border: solid 1px black;">
        
        <div class="cart_inner">
          <div class="table-responsive">   
			   
			   
			<table class="table">
              <c:forEach items="${productList}" var="productDTO" varStatus="state">
              <thead>
                <tr>
                  <th scope="col">${state.count}.상품</th>
                  <th scope="col">상품명</th>
                  <th scope="col">가격</th>
                  <th scope="col">수량</th>
                  <th scope="col">Total Price</th>
                  <th scope="col">상세보기</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <div class="media">
                      <div class="d-flex">
                      
           				<c:if test="${productDTO.productCategory==1}" >
                      		<img id="wish" src="${path}/v_img/womanPerfume/${productDTO.productImg}" />
                      	</c:if>
                      	
                		<c:if test="${productDTO.productCategory==2}" >
                			<img id="wish" src="${path}/v_img/manPerfume/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==3}" >
                			<img id="wish" src="${path}/v_img/mvPerfume/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==4}" >
                			<img id="wish" src="${path}/v_img/perfumeBottle/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==5}" >
                			<img id="wish" src="${path}/v_img/giftSet/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==6}" >
                			<img id="wish" src="${path}/v_img/bodyCare/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==7}" >
                			<img id="wish" src="${path}/v_img/cosmetics/${productDTO.productImg}" />
                		</c:if>
                                  
                      </div>
                       </div>
                       </td>
                      
                       <td>
                      <div class="media">
                      <div class="media-body">
                        <p>${productDTO.productName}</p>
                      </div>
                    </div>
                  </td>
                  
                  <!-- 상품가격 -->
                  <td>
                   <fmt:formatNumber value="${productDTO.productPrice}"/>원
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
                  	<a class="main_btn" href="${path}/front?key=order&methodName=oneOrder&qty=${productDTO.cartQty}&productCode=${productDTO.productCode}">상세보기</a><br>
                  	
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
            </div>  
          </div>
		

		
		
	   <div class="col-lg-3">
            <div class="left_sidebar_area">       
               <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>주문목록/배송조회</h3>
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
                      <a href="">주문목록/배송조회</a>
                    </li>               
                  </ul>
                </div>
              </aside> 
            </div>
          </div>
          
          
          
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