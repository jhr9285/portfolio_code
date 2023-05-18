<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="includes/header.jsp" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
<script>
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";

$(document).ajaxSend(function(e, xhr, options) { 
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
}); 

function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();
    
    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day; 

    return date.getFullYear() + '-' + month + '-' + day;
}

document.addEventListener('DOMContentLoaded', function() {
	var request = $.ajax({
		url: "/easyfit/calendarDisplay",
		method: "get",
		dataType: "json"
	});
	request.done(function(data){
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridWeek',
			height: 200,
			Boolean, defalut: true,
			locale: 'ko',
			events: data,
			eventClick: function(info) {
				var mname = info.event.title;
				var edate = info.event.start;
				var tno = <sec:authentication property="principal.trainerVO.tno"/>;
			
				// url 구성
				var url = "/easyfit/lessonGet?prno=" + data[0].prno + "&edate=" + dateFormat(edate) + "&tno=" + tno;
				// 페이지 이동
				window.location.href = url;			
				 
				var eventObj = info.event;
	
   	      		if (eventObj.url) {
   	        		alert('Clicked ' + eventObj.title + '.\n' + 'Will open ' + eventObj.url + ' in a new tab');
   	     	 	}   	      
			}
		});
		calendar.render();		
	});
	request.fail(function( jqXHR, textStatus ){
		alert("Request failed: " + textStatus);
	});
});
</script>
 <div id='calendar'></div>
 
 <!-- 그래프 및 미니 공지사항 영역 시작 ----------------------------------------------------------->
	<div class="row">

<!-- 그래프 시작 ----------------------------------------------------------------------------->
                        <div class="col-xl-6 col-lg-6">
                            <div class="card shadow mb-4">
<!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 PT 현황 요약</h6>
                                </div>
<!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="ptBarChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
<!-- 그래프 끝 -->

				<!-- hidden 태그 전송용 폼 시작 -->
					<c:forEach items="${monthlyPT}" var="mpt">
	                    <input type="hidden" class="prcountSum" value="<c:out value='${mpt.prcountSum}' />">
						<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
						<input type="hidden" name="tid" value="<sec:authentication property="principal.trainerVO.tid"/>" /><br />
						<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
                	</c:forEach>
				<!-- hidden 태그 전송용 폼 끝 -->

<!-- 공지사항 시작 -------------------------------------------------------------------------->
	                    <div class="col-lg-5 mb-5">
	                        <div class="card shadow mb-4">
	                            <div class="card-header py-3">
	                                <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
	                            </div>
	                            <div class="card-body">
	                            	<table class="table2">
	                            		<thead class="theadcolor">
	                            			<tr>
	                            				<td>No.</td>
	                            				<td>제목</td>
	                            			</tr>
	                            		</thead>
	                            		<tbody>
	                            			<tr>
	                            				<td>1</td>
	                            				<td>3월 휴무 안내</td>
	                            			</tr>
	                            			<tr>
	                            				<td>2</td>
	                            				<td>코로나 방역 대책 변경 안내</td>
	                            			</tr>
	                            		</tbody>
	                            	</table>
	                            </div>
	                        </div>
	                    </div>
<!-- 공지사항 끝 -->
	                    
                    </div>
<!-- 그래프 및 미니 공지사항 영역 끝 -->


<script>

	// 월별 PT 현황 막대 그래프 출력 (JHR)
	
	// csrf
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";

	var request = $.ajax({
		url: "/easyfit/chartDataDisplay",
		method: "get",
		dataType: "json"
	});
	request.done(function(data){
		var ctx = document.getElementById("ptBarChart").getContext("2d");
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