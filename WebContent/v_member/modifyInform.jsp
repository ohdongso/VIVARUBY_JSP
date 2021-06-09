<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>modifyInform.jsp</h1>
																   
	<form method="post" action="${path}/front?key=member&methodName=updateMemberInfo">
	<table>
		<tr>
			<td>
				<p>아이디</p>
			</td>
			<td>
				<input type="text" value="${param.id}" name="id" readonly="readonly">
			</td>
		</tr>

		<tr>
            <td>
    			<p>비밀번호 : </p>
            </td>
            <td>
                 <input type="password" value="${param.pw}" name="pw">
             </td>
        </tr>
		
		<tr>
            <td>
    			<p>이름 : </p>
            </td>
            <td>
                <input type="text" value="${param.name}" name="name" readonly="readonly">
             </td>
        </tr>
		
		<tr>
            <td>
    			<p>주소 : </p>
            </td>
            <td>
                <input type="text" value="${param.addr}" name="addr">
             </td>
        </tr>
		
		<tr>
            <td>
    			<p>연락처 : </p>
            </td>
            <td>
                <input type="text" value="${param.phone}" name="phone">
             </td>
        </tr>
		
		<tr>
            <td>
    			<p>이메일 : </p>
            </td>
            <td>
                <input type="text" value="${param.email}" name="email">
             </td>
        </tr>
	</table>
	
		<input type="submit" value="등록">
		<button type="button" onclick="history.back(-1);">뒤로가기</button>
	</form>



</body>
</html>