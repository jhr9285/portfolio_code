<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout Page</title>
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
  background:url("/resources/img/20230217_1652732.jpg") no-repeat center;
  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.container {
  width:100%;
  height:100%;
  position:absolute;
  padding:90px 70px 50px 70px;
  background:rgba(40,60,89,.8);
}
button {
  width: 100%;
  height: auto;
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:crimson;
  margin-top: 20px;
  margin-bottom: 15px;
  color: white;
  cursor: pointer;
  opacity: 0.8;
  font-size: 17px;
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
			<h1>Logout Page</h1>
			<!-- POST 방식에는 csrf 코드 입력 필수!! -->
			<form action="/customLogout" method="post">
			
				<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}">
				<button>Logout</button>
			</form>
		</div>
	</div>		
</body>
</html>