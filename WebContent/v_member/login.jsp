<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${path}/v_css/join.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!-- This is a very simple parallax effect achieved by simple CSS 3 multiple backgrounds, made by http://twitter.com/msurguy -->
<style type="text/css">
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}
</style>
</head>
<body>
	
  <!--================ Header 시작. =================-->
  <jsp:include page="../header.jsp" />
  <!--================ Header 끝. =================-->
  
     <div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>로그인</strong>
      </h1>
   </div>
  
<br><br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="">
                <form action="${path}/front?key=member&methodName=loginCheck" method="post" class="form-signin">
                <input type="text" name="id" class="form-control" placeholder="아아디" required autofocus>
                <input type="password" name="pw" class="form-control" placeholder="비밀번호" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    로그인</button>
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">
                    비밀번호 기억하기
                </label>
                
                </form>
            </div>
            <a href="${path}/v_member/join.jsp" class="text-center new-account">회원가입</a>
        </div>
    </div>
</div>
<br><br><br><br><br><br><br>
	

	
<%--  	<form action="${path}/front?key=member&methodName=loginCheck" method="post"> --%>
<!-- 		아이디 : <input type="text" name="id"> <p> -->
<!-- 		비밀번호 : <input type="password" name="pw"> <p> -->
<!-- 		<input type="submit" value="로그인"> -->
<!-- 		<button>로그아웃</button> -->
<!-- 	</form> -->
	
  <!--================ start footer Area  =================-->
  <jsp:include page="../footer.jsp"/>
  <!--================ End footer Area  =================-->
	
</body>
</html>