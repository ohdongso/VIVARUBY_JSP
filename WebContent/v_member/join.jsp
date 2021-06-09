<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		// 아이디 중복체크
		$("#id").keyup(function() {

			if($(this).val()=="") {
				$("#idCheck").html("");
				return;	
			}
			
			$.ajax({
				url:"${path}/idCheck",
				datatype:"text",
				type:"post",
				data:{id:$(this).val()},
				success:function(result) {
					$("#idCheck").text(result);
				},
				error:function(err) {
					alert(err+"아이디 조회 에러.");
				}
			});
		});
		
		// 비밀번호 일치체크
		$("#pwc").keyup(function() {
			if($(this).val()==""){
				$("#pwCheck").html("");
				return;
			}
			
			$.ajax({
				url:"${path}/pwCheck",
				datatype:"text",
				type:"post",
				data:{pwc:$(this).val(),pw:$("#pw").val()},
				success:function(result) {
					$("#pwCheck").text(result);
				},
				error:function(err) {
					alert(err+"비밀번호 조회 에러.");
				}
			});		
		});
		
		
		
	}); // jQuery 끝.
	
</script>
</head>
<body>
	
	<h1>join.jsp</h1>
	
	<section>
		<div style="margin:auto;text-align:center;">
		<form action="${path}/front?key=member&methodName=memberJoin" method=post>
			아이디 : <input type="text" name="id" id="id"> <span id="idCheck"></span> <p>
		    비밀번호 : <input type="password" name="pw" id="pw"> <p>
		    비밀번호확인 : <input type="password" name="pwc" id="pwc"> <span id="pwCheck"></span> <p> 
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