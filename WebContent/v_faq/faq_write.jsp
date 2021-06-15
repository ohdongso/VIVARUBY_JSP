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
    <title>FAQ_작성</title>
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
    
    table, input, textarea{
    	width: 100%; 	
    }
    
    </style>
    
</head>
<body>

	<!--================ Header 시작. =================-->
  	<jsp:include page="../header.jsp"/>
    <!--================ 헤더 끝. =================-->	
	
	<!-- small banner -->
	<div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>FAQ 등록</strong>
      </h1>
    </div>
	
    <!--================Category Product Area =================-->
    <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse"> 
          <div class="col-lg-9">     
            <div class="latest_product_inner">
              <div class="row">
               <div>
			   <h1>
			  		<strong>FAQ 작성</strong>
			   </h1>
			   </div>
			   <!--  들어가는 위치 -->
<%-- 			   ${faqList} --%>
			   
				<form action="${path}/front?key=faq&methodName=insertFaq" method="post" style="width: 100%;">
			   	<table border="1">
					<tr style="height: 30px;">
						<td>
							<input type="text" name="title" placeholder="제목" style="height: 30px;">
						</td>
					</tr>
				
					<tr style="height: 30px;">			
					<td>							
						<select name="category" id="select" style="width: 100%;">
							<option value="1">1. 회원</option>
							<option value="2">2. 상품</option>
							<option value="3">3. 주문</option>
							<option value="4">4. 결제</option>
							<option value="5">5. 교환, 환불</option>
						</select>	
					</td>			
					</tr>
			
					<tr style="height: 200px;">
						<td>
							<textarea name="content" placeholder="내용"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '내용'" required=""
							style="height: 250px;"></textarea>
						</td>
					</tr>
					
					<tr style="height: 30px;">
						<td>
								<input type="submit" value="등록">
						</td>
					</tr>
				</table>		
				</form>
			   
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