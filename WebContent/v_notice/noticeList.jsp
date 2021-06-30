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
    
    #head {
   		color: white;
	}
	
	#write {
		margin-left: 90%;
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
     	<strong>공지사항</strong>
      </h1>
   	</div>
	
	    <section class="cart_area">
      <div class="container">
	      	<!-- 장바구니 리스트 -->
        <h2><strong>공지사항</strong></h2>
        <hr style="border: solid 1px black;">
		
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	<colgroup>
		<col width="16%"/>
		<col width="30%"/>
		<col width="16%"/>
		<col width="16%"/>
		<col width="10%"/>
		<col width="10%"/>
	</colgroup>
	
	<tr>
        <td bgcolor="pink">
            <p align="center">
            <font color="white" ><b><span style="font-size:9pt;" id="head">글번호</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center" ><font color="white"><b><span style="font-size:9pt;" id="head">글제목</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;" id="head">첨부파일</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;" id="head">작성자</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;"" id="head">조회수</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;" id="head">등록날짜</span></b></font></p>
        </td>
    </tr>
    
    <c:choose>
    <c:when test="${empty requestScope.noticeList}">
	   <tr>
       		<td colspan="5">
            	<p align="center"><b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b></p>
        	</td>
    	</tr>
    </c:when>
    <c:otherwise>

	<c:forEach items="${requestScope.noticeList}" var="noticeDTO">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${noticeDTO.noticeCode}</span></p>
		        </td>
		        
		        <td bgcolor="">
					<p align="center"><span style="font-size:9pt;">
					<a href="${path}/front?key=elec&methodName=selectByModelNum&modelNum=${noticeDTO.noticeCode}">
					  ${noticeDTO.noticeTitle}
					</a>
					</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		    		<a href="${path}/front?key=elec&methodName=selectByModelNum&modelNum=${noticeDTO.noticeCode}">
					  ${noticeDTO.file}
					</a>
					</span></p>
		        </td>
		         
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${noticeDTO.id}</span></p>
		        </td>
		        
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <fmt:formatNumber value="${noticeDTO.views}"/></span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${noticeDTO.noticeRdate}</span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
	
    </c:choose>
</table>
		
		<!-- 페이징 처리부분 -->
		<form action="" method="post">
			<input type="submit" class="main_btn" id="write" value="공지작성">
		</form>
		
					<div class="col-lg-12">
						<div class="pageination">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									
									<!-- 페이징처리 객체를 .jsp에서 생성했다. -->
									<jsp:useBean class="kosta.mvc.paging.PageCnt" id="p" />
									
									<!-- 
									<c:set>은 setter메소드를 호출하는게 아니고, .jsp에서 변수를 선언하고 값을 대입하는것이다.
									<c:set var="num" value="1"/>
									${num} ==> 이렇게 사용가능.
									-->
									<c:set var="doneLoop" value="false" />
									
									<!-- 
									현재 pageNo이 1로 설정 돼 있다.
									1-1은 0, 0 % 2 == 0
									 -->
									<c:set var="temp" value="${(pageNo-1) % p.blockcount}"/>
									

									
									<!-- (1-1)%2, (2-1)%2, (3-1)%2 
									
									-->
									<c:set var="startPage" value="${pageNo - temp}" />
									<!--   1- 1 -->
								
									<c:if test="${(startPage-p.blockcount) > 0}">
										<!-- (-2) > 0  -->
										<li class="page-item"><a class="page-link"
											href="${path}/front?key=board&methodName=selectAll&pageNo=${startPage-1}"
											aria-label="Previous"> <i class="ti-angle-double-left"></i>
										</a></li>
									</c:if>

									<c:forEach var='i' begin='${startPage}'
										end='${(startPage-1)+p.blockcount}'>
										<c:if test="${(i-1)>=p.pageCnt}">
											<c:set var="doneLoop" value="true" />
										</c:if>
										<c:if test="${not doneLoop}">
											<li class="page-item"><a class="page-link"
												href="${path}/front?key=board&methodName=selectAll&pageNo=${i}">${i}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${(startPage+p.blockcount)<=p.pageCnt}">
										<li class="page-item"><a class="page-link"
											href="${path}/front?key=board&methodName=selectAll&pageNo=${startPage+p.blockcount}"
											aria-label="Next"> <i class="ti-angle-double-right"></i>
										</a></li>
									</c:if>

								</ul>
							</nav>
						</div>
					</div>
		
		
		
	   </div>
    </section>
	
	
	
	
	<!--================ start footer Area  =================-->
  	<jsp:include page="../footer.jsp"/>
  	<!--================ End footer Area  =================-->
  	
</body>
</html>