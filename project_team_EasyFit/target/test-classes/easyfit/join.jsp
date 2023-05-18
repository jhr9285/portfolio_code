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

    <title>EasyFit Join Page</title>

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
		    <div class="col-lg-9">
		
		        <div class="card o-hidden border-0 shadow-lg my-5">
		            <div class="card-body p-0">
		            
		                <!-- Nested Row within Card Body -->
		                <div class="row">
		                    <div class="col-lg-12">
		                        <div class="p-5 text-center">
		                            <div class="text-center">
		                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
		                            </div>
		                            <div class="loginbox text-center card-body">
			                            <form class="user text-left">
			                                <div class="form-group form-inline col-lg-12 mt-0">
			                                    <div class="col-lg-3">
				                                   	<label class="label-down justify-content-end">아 이 디 </label>
			                                	</div>
			                                	<div class="col-lg-9">
				                                    <input type="text" class="form-control form-control-user" 
				                                           id="tid" value="0001" disabled>
			                                	</div>
			                                </div>
			                                <div class="form-group form-inline col-lg-12 mt-0">
			                                    <div class="col-lg-3">
			                                    	<label class="label-down justify-content-end">비밀번호 </label>
			                                    </div>
			                                    <div class="col-lg-9">
				                                    <input type="password" class="form-control form-control-user" 
				                                       	   id="tpw" placeholder="">
			                                    </div>
			                                </div>
			                                <div class="form-group form-inline col-lg-12 mt-0">
			                                    <div class="col-lg-3">
				                                	<label class="label-down justify-content-end">이 름 </label>
				                                </div>
			                                    <div class="col-lg-9">
				                                    <input type="text" class="form-control form-control-user" 
				                                           id="tname" placeholder="">
			                                    </div>
			                                </div>
			                                <div class="form-group form-inline col-lg-12 mt-0">
			                                    <div class="col-lg-3">
			                          	     	    <label class="label-down justify-content-end">전화번호 </label>
			                          	     	</div>
			                                    <div class="col-lg-9">
				                                    <input type="text" class="form-control form-control-user"
				                                           id="ttel" placeholder="">
							                    </div>                        
			                                </div>
			                                <div class="form-group form-inline col-lg-12 mt-0">
			                                    <div class="col-lg-3">
			                                   		<label class="label-down justify-content-end">주 소 </label>
			                                   	</div>
			                                    <div class="col-lg-9">
			                                        <input type="text" class="form-control form-control-user"
			                                              id="taddress" placeholder="">
			                                    </div> 
			                                </div>
			                                <div class="col-lg-6 col-xs-4">
				                                <a href="login.html" class="btn btn-dark btn-user btn-block">
				                                    Back
				                                </a>
				                            </div>
				                            <div class="col-lg-6 col-xs-4">
				                                <a href="login.html" class="btn btn-primary btn-user btn-block">
				                                    가입완료
				                                </a>
			                                </div>
			                                
			                                
			                                <!-- 소셜로그인 - Plan B   -->
			                                <!-- 
			                                <hr>
			                                <a href="index.html" class="btn btn-google btn-user btn-block">
			                                    <i class="fab fa-google fa-fw"></i> Register with Google
			                                </a>
			                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
			                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
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