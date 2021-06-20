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
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

	$(function() {
//  		$("#u94").click(function() {
//  			alert($("[name=u]").val());
// 			alert($("#temp"+$("[name=up]").val()).val());
// 		});
 		
//  		$("#u90").click(function() {
// 			alert($("#temp"+$("[name=u]").val()).val());
// 		});
		
		// u${productDTO.productCode}
		// 수량에 따른 동적값 할당.
		$("#u" + $("#temp").val()).click(function() {	
// 			alert($("#temp").val());
			$.ajax({
				url:"${path}/countPrice",
				datatype:"text",
				type:"post",
				data:{qty:Number($("[name=qty]").val())+1,price:$("#price").val()},
				success:function(result) {			
					// 3자리씩 구분하는 정규표현식
					var price = numberWithCommas(result) + "원";
					$("#qtyPrice"+$("#temp").val()).text(price);
				},
				error:function(err) {
					alert(err+"수량추가 에러");
				}
			});
		});
		
		$("#d" + $("#temp").val()).click(function() {
// 			alert($("#temp").val());
			$.ajax({
				url:"${path}/countPrice",
				datatype:"text",
				type:"post",
				data:{qty:$("[name=qty]").val()-1,price:$("#price").val()},
				success:function(result) {
					// 3자리씩 구분하는 정규표현식
					var price = numberWithCommas(result) + "원";
					$("#qtyPrice"+$("#temp").val()).text(price);
				},
				error:function(err) {
					alert(err+"수량추가 에러");
				}
			});
		});
		
		// up
		$("[name=upIn]").click(function(){
			//alert("증가 ")
			var no = Number($(this).prev().val()) + 1;
			
			$(this).prev().val(no);		
		})
		
		// down
		$("[name=downOut]").click(function(){
			//alert("감소 ")
			var no = Number($(this).prev().prev().val()) - 1;
			
			$(this).prev().prev().val(no);	
		})
		
		//장바구니 담기
		$("[name=cartTest]").click(function(){
			productCode = $(this).attr("id");
			qty = $("[name=qty]").val();
			
			location.href="${path}/front?key=cart&methodName=insertCart&qty=" + qty + "&productCode=" + productCode;
		});
		
	});
</script>
	
</head>
<body>
 <!-- wishCode, productCode, id -->
<%-- 	${wishDTOList} / wishDTOList <br> --%>
<%-- 	${productList} / productList --%>
	
	<!--================ Header 시작. =================-->
  	<jsp:include page="../header.jsp" />
  	<!--================ Header 끝. =================-->
	
	<!-- small banner -->
	<div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>관심상품</strong>
      </h1>
   </div>

    <!--================Cart Area =================-->
    <section class="cart_area">
      <div class="container">
      	
      	<!-- 관심상품리스트 -->
        <h2><strong>관심상품 리스트</strong></h2>
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
                  <th scope="col">장바구니</th>
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
                    <h5>
                    <div id="qtyPrice${productDTO.productCode}"></div>
                  	
                    </h5>
                  </td>
                  
                  <!-- 수량 -->
                  <td>

                    <div class="product_count">
                   		<input
                        type="text"
                        name="qty"
                        id="${productDTO.productCode}"
                        maxlength="12"
                        value="0"
                        title="Quantity:"
                        class="input-text qty"
                      />
                      
                      <!-- up -->
                      <%-- <button
                        onclick="var result = document.getElementById('sst${productDTO.productCode}'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                        class="increase items-count"
                        type="button"
                      >
                        <i class="lnr lnr-chevron-up"></i>
                      </button>
                      
                      
                      <!-- down -->
                      <button
                        onclick="var result = document.getElementById('sst + ${productDTO.productCode}'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                        class="reduced items-count"
                        type="button"
                      >
                        <i class="lnr lnr-chevron-down"></i>
                      </button> --%>
                    <!-- ------------------------------------------------ -->
                    
                   <button class="increase items-count" type="button" name="upIn" id="u${productDTO.productCode}">          
                        <i class="lnr lnr-chevron-up"></i>
                   </button>
                            
                   <!-- down -->
                   <button class="reduced items-count" type="button" name="downOut" id="d${productDTO.productCode}">
                        <i class="lnr lnr-chevron-down"></i>
                   </button>
                    
                   <input type="hidden" name="u" id="price" value="${productDTO.productPrice}">
               	   <input type="hidden" name="d" id="temp" value="${productDTO.productCode}">  
                   
                   </div>
                   
                  </td>
                  
                  <!-- 장바구니 담기 -->
                  <td>
                  	<a class="main_btn" href="#" id="${productDTO.productCode}" name="cartTest">장바구니</a><br>
                  	<a class="main_btn" href="${path}/front?key=wish&methodName=deleteWish&productCode=${productDTO.productCode}">삭제</a>	    
                  </td>
                                   
                </tr>  
              </tbody>
              
              </c:forEach>
                 
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