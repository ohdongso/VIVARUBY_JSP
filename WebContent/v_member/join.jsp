<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section>
		<div style="margin:auto;text-align:center;">
		<form action="${path}/front?key=member&methodName=memberJoin" method=post>
			아이디 : <input type="text" name="id"> <p>
		    비밀번호 : <input type="text" name="pw"> <p>
		    비밀번호확인 : <input type="text" name="pwc"> <p> 
		    이름 : <input type="text" name="name"> <p>
		    집주소 : <input type="text" name="addr1"> <p>
		    싱세주소 : <input type="text" name="addr2"> <p>
		    휴대폰 : <input type="text" name="phone"> <p>
		    이메일 : <input type="text" name="email"> <p>
		    <input type="submit" value="확인">
		    <input type="reset" value="취소"> 
		</form>
		</div>
	</section>

</body>
</html>