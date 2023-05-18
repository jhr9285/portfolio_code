<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>To Do List - Write</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
			input {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="container" style="margin-top: 50px;">
			<h2 align="center">To Do List</h2>
			<form method="post" style="margin-top: 20px; margin-bottom: 5px;" > 
				<input type="text" name="content" placeholder="To Do" class="form-control form-group">
				<input type="text" name="state" placeholder="State" class="form-control form-group">
				<div align="center">
					<input type="submit" value="등록" class="btn btn-primary">
				</div>
			</form>
		</div>
	</body>
</html>