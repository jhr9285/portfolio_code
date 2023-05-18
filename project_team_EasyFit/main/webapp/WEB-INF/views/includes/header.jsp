<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- 공통모듈 header 시작 ------------------------------------------------------------------------------->

<!DOCTYPE html>
<html lang="en">

<head>  

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EasyFit</title>

    <!-- 폰트 연결 링크 -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- CSS 연결 링크 -->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">
    
        <!-- JavaScript 연결 링크 -->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.js"></script>

    <!-- Page level custom scripts -->
    <!-- <script src="/resources/js/demo/chart-bar-demo.js"></script> -->

</head>

<body id="page-top">

    <!-- 페이지 전체 영역 시작 ---------------------------------------------------------------------------------->
    <div id="wrapper">


        <!-- 사이드바 시작 -------------------------------------------------------------------------------------->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">


            <!-- 사이드바 - 사이트 로고 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/trainerPage">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-clipboard"></i>
                </div>
                <div class="sidebar-brand-text mx-3">EasyFit <sup>+</sup></div>
            </a>


            <!-- 구분선 -->
            <hr class="sidebar-divider">

            <!-- 사이드바 - 공지사항 -->
            <li class="nav-item">
                <a class="nav-link" href="/easyfit/noticeList">
                	<i class="fas fa-fw fa-exclamation-circle"></i>
                    <span>공지사항</span></a>
            </li>
            
            
            <!-- 사이드바 - 회원관리 -->
            <li class="nav-item">
            <%-- <a class="nav-link" href="/easyfit/allClientList?tno=<sec:authentication property="principal.trainerVO.tno"/>"> --%>
            <a class="nav-link" href="/easyfit/allClientList">
           		
           		
                    <i class="fas fa-fw fa-user-edit"></i>
                    <span>회원관리</span>
                </a>
            </li>


            <!-- 사이드바 - 운동일지 -->
            <li class="nav-item">
                <a class="nav-link" href="/easyfit/lessonList?tno=<sec:authentication property="principal.trainerVO.tno"/>">
                    <i class="fas fa-fw fa-book"></i>
                    <span>운동일지</span>
                </a>
            </li>
            
            <!-- 사이드바 - 스케줄 -->
            <li class="nav-item">
                <a class="nav-link" href="/easyfit/calendar">
                    <i class="far fa-fw fa-calendar-alt"></i>
                    <span>스케줄</span></a>
            </li>
            
            <!-- 사이드바 - 트레이너게시판 -->
            <li class="nav-item">
                <a class="nav-link" href="/easyfit/trainerBoardList">
                	<i class="fas fa-fw fa-exclamation-circle"></i>
                    <span>트레이너 게시판</span></a>
            </li>
            
            
            <!-- 사이드바 -
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>통계</span></a>
                    </li>
                    통계 -->
            
            <!-- 사이드바 토글 버튼 -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- 사이드바 끝 -->


        <!-- 사이드바 제외한 페이지 영역 시작 ------------------------------------------------------------------>
        <div id="content-wrapper" class="d-flex flex-column">


            <!-- 페이지 영역 시작 ----------------------------------------------------------------------------------->
            <div id="content">


                <!-- 상단바 -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


                    <!-- 상단 메뉴바 시작 -->
                    <ul class="navbar-nav ml-auto">


                        <!-- 로그인 계정 정보 시작 ----------------------------------------------------------------->
                        <li class="nav-item dropdown no-arrow form-inline mr-2">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="img-profile rounded-circle" src="/resources/img/undraw_profile.svg">
                                <span class="d-none d-lg-inline text-black-600">
                                	&nbsp;<b><sec:authentication property="principal.trainerVO.tname"/></b> 트레이너 
                                </span>
                            </a>
                            <a  href="#" onclick="logout()">
                            	<div class="d-inline-block mt-1-5 mr-2 ml-0">
		                            <i class="fas fa-lg fa-sign-out-alt"></i>
                            	</div>
                            </a>
                        </li>
                        <!-- 로그인 계정 정보 끝 -->

                    </ul>

                </nav>
                <!-- 상단 메뉴바 끝 -->


                <!-- 페이지 내용 시작 ------------------------------------------------------------------------------->
                <div class="container-fluid">


<!-- 공통모듈 header 끝 -->
<script type="text/javascript" src="/resources/js/sb-admin-2.js"></script>
<script>
    function logout() {
        // 로그아웃 처리
        // ...

        // alert 창 띄우기
        alert("로그아웃 되었습니다.");

        // 원하는 페이지로 이동시키기
        window.location.href = "/customLogin?logout";
    }
</script>