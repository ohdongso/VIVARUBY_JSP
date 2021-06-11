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
  <jsp:include page="../header.jsp" />
  <!--================ Header 끝. =================-->
	
	<form action="${path}/front?key=member&methodName=loginCheck" method="post">
		아이디 : <input type="text" name="id"> <p>
		비밀번호 : <input type="password" name="pw"> <p>
		<input type="submit" value="로그인">
		<button>로그아웃</button>
	</form>
	
  <!--================ start footer Area  =================-->
  <jsp:include page="../footer.jsp"/>
  <!--================ End footer Area  =================-->
	
</body>
</html>