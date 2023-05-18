<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300&display=swap" rel="stylesheet">
<style>
body{
  font-family: 'Source Sans Pro', sans-serif;
  font-size: 16px;
  margin:0;
  color: white;
 } 
 
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.wrapper {
  width:100%;
  margin:auto;
  max-width:525px;
  min-height:670px;
  position:relative;
  background:url("/resources/img/20230217_16920633.jpg") no-repeat center;
  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.container {
  width:100%;
  height:100%;
  position:absolute;
  padding:90px 70px 50px 70px;
  background:rgba(40,60,89,.8);
}
label, input[type='text'], input[type='password'], button {
  width: 100%;
}
input[type='text'], input[type='password'], button {
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);	
  margin-top: 15px;
  margin-bottom: 15px;
  color: white;
}
input[type='password'] {
  text-security:circle;
  -webkit-text-security:circle;
}
input[type='checkbox'] {
	display: inline!important;
	position: relative;
	top: 2px;
}
label {
  color: lightgray;
  font-size: 16px;
}
label[value='Remember Me'] {
	position: relative;
	top: 10px;
}
button {
  background:#1161ee;	
  cursor: pointer;
  opacity: 0.8;
}
button:hover {
  opacity: 1;
}
h1 {
	position: relative;
	left: 115px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<h1>Login Page</h1>
			<h2><c:out value="${error}"/></h2>
			<h2><c:out value="${logout}"/></h2>
			
			<form method="post" action="/login">
				<div> <!-- ★★★ name='username' ==> name 속성이 실제 ID 속성임!! ID값은 username!! (in Spring Security) -->
					<label>USERNAME</label>
					<input type="text" name="username">		
				</div>
				<div> 
					<label>PASSWORD</label>
					<input type="password" name="password">		
				</div>
				<div> 
					<label>자동 로그인</label>
					<input type="checkbox" name="remember-me"> <!-- 자동 로그인 설정 -->
				</div>
				<div>
					<button type="submit">SIGN IN</button>
				</div>
				
				<!-- ★★★ _csrf 토큰 : POST, PUT, DELETE 방식에 반드시 입력되어야 됨!! 세트임!! -->
				<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			</form>
		</div>
	</div>
</body>
</html>