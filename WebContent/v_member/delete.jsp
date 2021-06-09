<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>delete.jsp</h1>
	
	<form action="${path}/front?key=member&methodName=deleteMember" method="post">
		아이디 : <input type="text" placeholder="아이디" name="id"> <p>
		비밀번호 : <input type="password" placeholder="비밀번호" name="pw"> <p>
		<input type="submit" value="회원탈퇴">
		<button type="button" onclick="history.back(-1);">뒤로가기</button>
	</form>

</body>
</html>