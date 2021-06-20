<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		alert(1);
	});

</script>
</head>
<body>
	<h1>memberInfo.jsp</h1>

	<table>
		<tr>
			<td>
				<p>아이디</p>
			</td>
			<td>
				<P>${memberDTO.id}</P>
			</td>
		</tr>

		<tr>
			<td>
				<p>이름</p>
			</td>
			<td>
				<p>${memberDTO.name}</p>
			</td>
		</tr>

		<tr>
			<td>
				<p>주소</p>
			</td>
			<td>
				<P>${memberDTO.addr}</P>
			</td>
		</tr>

		<tr>
			<td>
				<p>연락처</p>
			</td>
			<td>
				<P>${memberDTO.phone}</P>
			</td>
		</tr>

		<tr>
			<td>
				<p>E-Mail</p>
			</td>
			<td>
				<p>${memberDTO.email}</p>
			</td>
		</tr>
	</table>
	
	 <form action="${path}/v_member/modifyInform.jsp" method="post">
	 	<input type="hidden" name="id" value="${memberDTO.id}">
	 	<input type="hidden" name="pw" value="${memberDTO.pw}">
	 	<input type="hidden" name="name" value="${memberDTO.name}">
	 	<input type="hidden" name="addr" value="${memberDTO.addr}">
	 	<input type="hidden" name="phone" value="${memberDTO.phone}">
	 	<input type="hidden" name="email" value="${memberDTO.email}">
		<input type="submit" value="회원정보수정">
		<button id="delete">회원탈퇴</button>
	 </form>
			
</body>
</html>