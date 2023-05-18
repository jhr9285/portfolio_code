<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>Home</title>
<style>
	body{
		background-image:url('/resources/img/img.jpg');
		background-repeat: no-repeat;
		background-size: 853px 480px;
		color: white;
	}
	h1{
		color: black;
	}
</style>
</head>
<body>
<h1>
	이지스프링 프로젝트: Easyfit
</h1>

<P>  The time on the server is ${serverTime}. </P>
※
미리 만들어 놓으신 View페이지들은 src/test/resources에 있습니다.

<h2><a href="/easyfit/login">로그인</a></h2>
<h2><a href="/easyfit/clientList">회원 리스트</a></h2>
<h2><a href="/easyfit/lessonList">pt레슨 리스트</a></h2>
<h2><a href="/easyfit/noticeList">공지사항 리스트</a></h2>





</body>
</html>
