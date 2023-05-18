<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="includes/adminHeader.jsp" %>


					<!-- 메인 페이지 시작 ------------------------------------------------------------------------>
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자</h1>             
                    </div>

				
                    <!-- 그래프 및 미니 공지사항 영역 시작 ----------------------------------------------------------->
                    <div class="row mt-3">

                        <!-- 그래프 시작 ----------------------------------------------------------------------------->
                        <div class="col-xl-6 col-lg-6 mt-3">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 PT 현황 요약</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="totalPT"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 그래프 끝 -->

 						<!-- 공지사항 시작 -------------------------------------------------------------------------->
	                    <div class="col-lg-5 mb-5 mt-3">
	                        <div class="card shadow mb-4">
	                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                <h6 class="m-0 font-weight-bold text-primary">EASYFIT+ 접속로그</h6>
	                            </div>
	                            <div class="card-body">
	                            	<table class="table2">
	                            		<thead class="theadcolor">
	                            			<tr>
	                            				<td>이름</td>
	                            				<td>마지막 접속시간</td>
	                            			</tr>
	                            		</thead>
	                            		<tbody id="logList">

	                            		</tbody>
	                            	</table>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 공지사항 끝 -->
	                    
                    </div>
            		<!-- 그래프 및 미니 공지사항 영역 끝 -->
            
<script>
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
	var logRequest = $.ajax({
		url: "/easyfit/logDisplay",
		type: "get",
		dataType: "json"
	});
	logRequest.done(function(data){ 	
		$.each(data, function(i,v){
			$("#logList").append("<tr data-tno='"+v.tno+"'><td>"+v.tname+"</td><td>"+v.log+"</td></tr>");
		$("#logList").on('click', 'tr', function(){
			location.href="/easyfit/trainerGet?tno=" + $(this).data("tno");
		});
		});
	});
	
	
	var chartrequest = $.ajax({
		url: "/easyfit/totalPTDisplay",
		method: "get",
		dataType: "json"
	});
	chartrequest.done(function(data){
		var ctx = document.getElementById("totalPT").getContext("2d");
		var chart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: data.map((item) => item.month +"월"),
				datasets: [{
					label: '월별 PT 수업 진행 횟수',
					backgroundColor: 'rgba(78, 115, 223, 0.8)',
					hoverBackgroundColor: "rgba(28, 200, 138, 0.8)",
					borderColor: 'rgb(255, 99, 132)',
					data: data.map((item) => item.count)
				}]		
			},
			options: {
			    scales: {
			      xAxes: [{
			        gridLines: {
			          display: false,
			          drawBorder: false
			        },
			      }],
			      yAxes: [{
			        ticks: {
			          min: 0,
			          max: 50,
			          maxTicksLimit: 10,
			          padding: 10
			        },
			        gridLines: {
			          color: "rgb(234, 236, 244)",
			          zeroLineColor: "rgb(234, 236, 244)",
			          drawBorder: false,
			          borderDash: [2],
			          zeroLineBorderDash: [2]
			        }
			      }],
			    },
			    legend: {
			      display: false
			    }
			 }
		});
	});

</script>

            
<%@ include file="includes/footer.jsp" %>