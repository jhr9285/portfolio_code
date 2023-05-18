<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>
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

function addRecord(){
	var schedule = {edate:$("#edate").val()}
	$.ajax({
		type : 'post',
		url : '/easyfit/calendarRegister?mname='+$("#clientNameList option:selected").val(),
		data : JSON.stringify(schedule),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr) {
			location.reload();
		},
		error : function(xhr, status, er) {
		}
	})
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
			initialView: 'dayGridMonth',
			selectable: true,
			eventClick: function(info) {
				var mname = info.event.title;
				var edate = info.event.start;
				var tno = <sec:authentication property="principal.trainerVO.tno"/>;
				var prno = info.event.extendedProps.prno;

			
				// url 구성
				//var url = "/easyfit/lessonGet?prno=" + data[0].prno + "&edate=" + dateFormat(edate) + "&tno=" + tno;
				var url = "/easyfit/lessonGet?prno=" + prno + "&edate=" + dateFormat(edate) + "&tno=" + tno;
				console.log(prno);
				// 페이지 이동
				window.location.href = url;			
				 
				var eventObj = info.event;
	
   	      		if (eventObj.url) {
   	        		alert('Clicked ' + eventObj.title + '.\n' + 'Will open ' + eventObj.url + ' in a new tab');
   	     	 	}   	      
			},
			dateClick: function(info) {
				$.ajax({
					type : 'get',
					url : '/easyfit/calendarClientName',
					success : function(result, status, xhr) {
						$("#clientNameList").empty();
						$.each(result, function(i,v){
							$("#clientNameList").append("<option value="+v+">" + v + "</option>");					
						});
					},
					error : function(xhr, status, er) {
					}
				})			
				$('#modal-add-event #edate').val(info.dateStr); // 모달 창에서 날짜 설정
		        $('#modal-add-event').modal('show'); // 모달 창 열기
			},
			events: data,
			Boolean, defalut: true,
			locale: 'ko'
		});
		calendar.render();
	});
	request.fail(function( jqXHR, textStatus ){
		alert("Request failed: " + textStatus);
	});	 
});
</script>

<div id='calendar'></div>

<div class="modal fade" id="modal-add-event" tabindex="-1" role="dialog" aria-labelledby="modal-add-event" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal-add-event-title">일정 추가</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<form>
				<div class="form-group">
					<label for="title" class="col-form-label">이 름:</label>					  
					<select class="form-control" name="mname" id="clientNameList"></select>  
				</div>
				<div class="form-group">
					<label for="description" class="col-form-label">PT 예약 날짜:</label>
					<input type="date" class="form-control" id="edate" name="edate"></input>
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="save-event" onclick="addRecord()">저장</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>