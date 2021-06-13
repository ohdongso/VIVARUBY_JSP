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
  	<jsp:include page="../header.jsp" />
  	<!--================ Header 끝. =================-->
  	
  	<div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>장바구니</strong>
      </h1>
   	</div>
  	
  	
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
                  <th scope="col">가격</th>
                  <th scope="col">수량</th>
                  <th scope="col">장바구니</th>
                </tr>
              </thead>
              <tbody>
                <tr>
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
                      
                       <td>
                      <div class="media">
                      <div class="media-body">
                        <p>${productDTO.productName}</p>
                      </div>
                    </div>
                  </td>
                  
                  <!-- 상품가격 -->
                  <td>
                    <h5><fmt:formatNumber value="${productDTO.productPrice}"/>원</h5>
                  </td>
                  
                  <!-- 수량 -->
                  <td>

                   <div class="product_count">
                   
                   		<input
                        type="text"
                        name="qty"
                        id="sst"
                        maxlength="12"
                        value="1"
                        title="Quantity:"
                        class="input-text qty"
                      />
                      
                      <!-- up -->
                      <button
                        onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                        class="increase items-count"
                        type="button"
                      >
                        <i class="lnr lnr-chevron-up"></i>
                      </button>
                      
                      
                      <!-- down -->
                      <button
                        onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                        class="reduced items-count"
                        type="button"
                      >
                        <i class="lnr lnr-chevron-down"></i>
                      </button>
                   
                   </div>

                   
                  </td>
                  
                  <!-- 장바구니 담기 -->
                  <td>
                  	<a class="main_btn" href="#" onclick="insertCart()" id="${productDTO.productCode}">장바구니</a><br>
                  	<a class="main_btn" href="${path}/front?key=wish&methodName=deleteWish&productCode=${productDTO.productCode}">삭제</a>	    
                  </td>
                  
                </tr>
                    
              </tbody>
              </c:forEach>
              
              <!-- 장바구니 2번째 시작부분. -->
              <tr class="bottom_button">
                  <td>
                    <a class="gray_btn" href="#">Update Cart</a>
                  </td>
                  <td></td>
                  <td></td>
                  <td>
                    <div class="cupon_text">
                      <input type="text" placeholder="Coupon Code" />
                      <a class="main_btn" href="#">Apply</a>
                      <a class="gray_btn" href="#">Close Coupon</a>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td>
                    <h5>Subtotal</h5>
                  </td>
                  <td>
                    <h5>$2160.00</h5>
                  </td>
                </tr>
                <tr class="shipping_area">
                  <td></td>
                  <td></td>
                  <td>
                    <h5>Shipping</h5>
                  </td>
                  <td>
                    <div class="shipping_box">
                      <ul class="list">
                        <li>
                          <a href="#">Flat Rate: $5.00</a>
                        </li>
                        <li>
                          <a href="#">Free Shipping</a>
                        </li>
                        <li>
                          <a href="#">Flat Rate: $10.00</a>
                        </li>
                        <li class="active">
                          <a href="#">Local Delivery: $2.00</a>
                        </li>
                      </ul>
                      <h6>
                        Calculate Shipping
                        <i class="fa fa-caret-down" aria-hidden="true"></i>
                      </h6>
                      <select class="shipping_select">
                        <option value="1">Bangladesh</option>
                        <option value="2">India</option>
                        <option value="4">Pakistan</option>
                      </select>
                      <select class="shipping_select">
                        <option value="1">Select a State</option>
                        <option value="2">Select a State</option>
                        <option value="4">Select a State</option>
                      </select>
                      <input type="text" placeholder="Postcode/Zipcode" />
                      <a class="gray_btn" href="#">Update Details</a>
                    </div>
                  </td>
                </tr>
                <tr class="out_button_area">
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>
                    <div class="checkout_btn_inner">
                      <a class="gray_btn" href="#">Continue Shopping</a>
                      <a class="main_btn" href="#">Proceed to checkout</a>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
    <!--================End Cart Area =================-->
              
              
              
            </table>  
          </div>
        </div>
      </div>
    </section>
    <!--================End Cart Area =================-->
  	
  	
  	<!--================ start footer Area  =================-->
  	<jsp:include page="../footer.jsp"/>
  	<!--================ End footer Area  =================-->
</body>
</html>