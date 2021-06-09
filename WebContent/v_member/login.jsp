<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>login.jsp</h1>
	
	<form action="${path}/front?key=member&methodName=loginCheck" method="post">
		아이디 : <input type="text" name="id"> <p>
		비밀번호 : <input type="password" name="pw"> <p>
		<input type="submit" value="로그인">
		<button>로그아웃</button>
	</form>
	
	
</body>
</html>