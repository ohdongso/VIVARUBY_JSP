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
    <title>FAQ</title>
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
    
    table, input{
    	width: 100%; 	
    }
   
    </style>
    
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("[name=updateFaq]").click(function() {
			location.href="${path}/front?key=faq&methodName=updateFaq&fCode=" + $("[name=updateFaq]").attr("id");
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
     	<strong>FAQ</strong>
      </h1>
    </div>
	
    <!--================Category Product Area =================-->
    <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse"> 
          <div class="col-lg-9">     
            <div class="latest_product_inner">
              <div class="row">

			   <!--  들어가는 위치 -->
			   <table>
				<c:choose>	   		
					<c:when test="${empty requestScope.faqList}">
					<tr>
					<td>
						<p align="center">
							<b><span>등록된 게시물이 없습니다.</span></b>
						</p>
					</td>
					</tr>
					</c:when>
					<c:otherwise>
					
						<c:forEach items="${requestScope.faqList}" var="faq">
						<tr>			
						<c:if test="${faq.fCategory==1}">
							<td><h4>[회원] : ${faq.fTitle}</h4></td>	
						</c:if>
						<c:if test="${faq.fCategory==2}">
							<td><h4>[상품] : ${faq.fTitle}</h4></td>
						</c:if>
						<c:if test="${faq.fCategory==3}">
							<td><h4>[주문] : ${faq.fTitle}</h4></td>
						</c:if>
						<c:if test="${faq.fCategory==4}">
							<td><h4>[결제] : ${faq.fTitle}</h4></td>
						</c:if>
						<c:if test="${faq.fCategory==5}">
							<td><h4>[교환, 환불] : ${faq.fTitle}</h4></td>
						</c:if>
						</tr>
						
						<tr>
						<td>${faq.fContent}</td>
						</tr>
			
						<c:if test="${sessionScope.loginState==0}">
							<tr>
							<td>
							<div style="margin-bottom: 10px" align="right">										
								<form action="${path}/front?key=faq&methodName=deleteFaq"
									method="post">
									<input type="hidden" name="fCode" value="${faq.fCode}">
									<button class="main_btn" type="button" name="updateFaq" id="${faq.fCode}">수정</button>
									<button class="main_btn" type="submit">삭제</button>
								</form>									
							</div>
							</td>				
							</tr>
						</c:if>
						
						<c:if test="${sessionScope.loginState != 1}">
							<tr>
								<td>
								<div style="margin-bottom: 50px" align="right">
								</div>
								</td>
							</tr>
						</c:if>
						
						</c:forEach>
						
					</c:otherwise>
				</c:choose>
			   </table>

			   
              </div>
            </div>  
          </div>
		  
          <div class="col-lg-3">
            <div class="left_sidebar_area">
              <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3>FAQ</h3>
                </div>
                <div class="widgets_inner">
                  <ul class="list">
                  	<c:if test="${sessionScope.loginState==0}">
                  	<li>
                  	  <a href="${path}/v_faq/faq_write.jsp">FAQ 등록하기</a>
                  	</li>
                  	</c:if>
                  	<li>
                      <a href="${path}/front?key=faq&methodName=selectAll">전체보기</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=faq&methodName=selectCategory&category=1">회원</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=faq&methodName=selectCategory&category=2">상품</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=faq&methodName=selectCategory&category=3">주문</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=faq&methodName=selectCategory&category=4">결제</a>
                    </li>
                    <li>
                      <a href="${path}/front?key=faq&methodName=selectCategory&category=5">교환, 환불</a>
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
    
    
    <!--================End Category Product Area =================-->
	
	
	<!--================ Header 시작. =================-->
	  	<jsp:include page="../footer.jsp"/>
    <!--================ 헤더 끝. =================-->

</body>
</html>