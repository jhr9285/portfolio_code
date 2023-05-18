<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EasyFit Login Page</title>

    <!-- 폰트 링크 연결 -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- CSS 링크 연결 -->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">

</head>


<body class="bg-gradient-primary">

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-xl-6 col-lg-8 col-md-8">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="col-lg-12">
                            <div class="p-5 text-center">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">트레이너 로그인</h1>
                                </div>
                                <div class="loginbox text-center">
	                                <form class="user text-center">
	                                    <div class="form-group form-inline col-lg-12">
	                                    	<label><i class="fas fa-fw fa-user fa-lg"></i></label>
	                                    	<span>&nbsp;</span>
	                                        <input type="text" class="form-control form-control-user"
	                                            id="tid" aria-describedby="idHelp" placeholder="Id...">
	                                    </div>
	                                    <div class="form-group form-inline col-lg-12">
	                                    	<label><i class="fas fa-fw fa-key fa-lg"></i></label>
	                                    	<span>&nbsp;</span>
	                                        <input type="password" class="form-control form-control-user"
	                                            id="tpw" placeholder="Password">
	                                    </div>
	                                    
	                                    <div class="col-lg-6 col-xs-4">
		                                    <a href="index.html" class="btn btn-primary btn-user btn-block">
		                                         Login
		                                    </a>
	                                    </div>
	                                    <div class="col-lg-6 col-xs-4">
		                                    <a href="join.html" class="btn btn-success btn-user btn-block">
		                                         Join
		                                    </a>
	                                    </div>
	                                    
	                                    
	                                    <!-- 소셜로그인 - Plan B   -->
						        <!-- 
						        <hr>
						        <a href="index.html" class="btn btn-google btn-user btn-block">
	                                        <i class="fab fa-google fa-fw"></i> Login with Google
	                                    </a>
	                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
	                                        <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
	                                    </a> 
	                                    -->
	                                    
	                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
    
    
    <!-- JavaScript 연결 링크 -->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html>