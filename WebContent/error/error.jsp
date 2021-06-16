<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!--================ Header 시작. =================-->
  	<jsp:include page="../header.jsp"/>
    <!--================ 헤더 끝. =================-->	
	
	${errorMsg}
	
	<!--================ Header 시작. =================-->
	<jsp:include page="../footer.jsp"/>
    <!--================ 헤더 끝. =================-->
    
</body>
</html>