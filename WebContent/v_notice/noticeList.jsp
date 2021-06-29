<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="${path}/img/favicon.png" type="image/png" />
    <title>공지사항</title>
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
     	<strong>공지사항</strong>
      </h1>
   	</div>
	
	    <section class="cart_area">
      <div class="container">
	      	<!-- 장바구니 리스트 -->
        <h2><strong>공지사항</strong></h2>
        <hr style="border: solid 1px black;">
	
		<table border="1">
							<tr>
								<th>글번호</th>
								<th>글제목</th>
								<th>첨부파일</th>
								<th>작성자</th>						
								<th>조회수</th>		
								<th>등록날짜</th>
								<c:if test="${sessionScope.loginState==0}">
									<th>삭제</th>
								</c:if>
							</tr>
							<c:forEach items="${requestScope.noticeList}" var="noticeDTO">
								<tr>
											<td>${noticeDTO.noticeCode}</td>
											<td>${noticeDTO.id}</td>
											<td>${noticeDTO.file}</td>
											<td><a
												href="${path}/front?key=notice&methodName=selectByNoticeCode&noticeCode=${noticeDTO.noticeCode}">${noticeDTO.noticeTitle}</a>
											</td>
											<td>${noticeDTO.views}</td>
											<td><a href="${path}/downLoad?fileName=${noticeDTO.file}">${noticeDTO.file}</a></td>
											<td>${noticeDTO.rdate}</td>
											<c:if test="${sessionScope.loginState==0}">
												<td><a
													href="${path}/front?key=notice&methodName=deleteAdmin&noticeDTOCode=${noticeDTO.noticeCode}">삭제</a></td>
											</c:if>
								</tr>
							</c:forEach>

							<c:choose>

								<c:when test="${empty requestScope.noticeList}">
									<tr>
										<td colspan="7">
											<p align="center">
												등록된 게시물이 없습니다.
											</p>
										</td>
									</tr>
								</c:when>

							</c:choose>
						</table>
						
						<div style="text-align: right">
							<a href="${path}/v_notice/noticeWrite.jsp">공지사항작성</a>
						</div>
						
						
						
						
							
	   </div>
    </section>
	
	
	
	
	<!--================ start footer Area  =================-->
  	<jsp:include page="../footer.jsp"/>
  	<!--================ End footer Area  =================-->
  	
</body>
</html>