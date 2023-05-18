<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<!-- CSS 링크 연결 -->
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-8 col-md-8">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
					
						<!-- 로그인 폼 -->
						<div class="col-lg-12" id="loginCard">
							<div class="p-5 text-center">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Easyfit+ 로그인</h1> 
                                    <h2 class="h5 msgColor mb-4"><c:out value="${logout}"/></h2>
								</div>
                                <div class="loginBox text-center">
	                                
	                                <!-- 아이디, 비밀번호 입력 -->
	                                <form class="user text-center" method="post" action="/login">
	                                
	                                    <div class="form-group form-inline col-lg-12">
	                                    	<label><i class="fas fa-fw fa-user fa-lg"></i></label>
	                                    	<span>&nbsp;</span>
	                                        <input type="text" class="form-control form-control-user" id="tid" name="username" aria-describedby="idHelp" placeholder="Id...">
	                                    </div>
	                                    
	                                    <div class="form-group form-inline col-lg-12"> 
	                                    	<label><i class="fas fa-fw fa-key fa-lg"></i></label>
	                                    	<span>&nbsp;</span>
	                                        <input type="password" class="form-control form-control-user" id="tpw" name="password" placeholder="Password">
	                                    </div>
	                                    
	                                    <!-- 자동 로그인 -->
	                                	<div class="my-2">
	                                    	<input type="checkbox" id="checkbox" name="remember-me">
	                                    	<label for="checkbox" class="h8">자동 로그인</label>
	                                    </div>
	                                    
	                                    <!-- 에러 메시지 -->
	                                    <div class="mb-3">
		                                    <span class="h8 msgColor"><c:out value="${error}"/></span>
	                                    </div>
	                                    
	                                    <!-- 로그인 버튼 -->
	                                    <div class="col-lg-12 ml-2">
	                                    	<input type="submit" class="btn btn-success btn-user btn-block h7 p-2" value="Login">
	                                    </div>
	                                    
	                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                               
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