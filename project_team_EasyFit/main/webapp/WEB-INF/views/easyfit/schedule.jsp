<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<form name="calendarFrm" id="calendarFrm" action="" method="GET">
	<input type="hidden" name="year" value="${today_info.search_year}" />
	<input type="hidden" name="month" value="${today_info.search_month-1}" />
	<script>
	 /* 스케줄 등록시 등록완료 팝업창 */
		var message = "${message}";
		console.log(message);
		if (message != "") {
			alert(message);
		}
	</script>
	<div class="calendar">
		<!--날짜 네비게이션  -->
		<div class="navigation">
			<a class="before_after_year" href="./easyfit/calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">&lt;&lt;<!-- 이전해 --></a>
			<a class="before_after_month" href="./easyfit/calendar?year=${today_info.before_year}&month=${today_info.before_month}">&lt;<!-- 이전달 --></a>
			<span class="this_month"> &nbsp;${today_info.search_year}.<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}</span>
			<a class="before_after_month" href="/easyfit/calendar?year=${today_info.after_year}&month=${today_info.after_month}">&gt;<!-- 다음달 --></a>
			<a class="before_after_year" href="/easyfit/calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">&gt;&gt;<!-- 다음해 --></a>
		</div>
		<div class="today_button_div">
			<button type="button" class="buttonstyle" onclick="javascript:location.href='/easyfit/calendar'" style="height: 30px; width: 80px;">Today</button>
			<button type="button" class="buttonstyle board_move openMask_board_move pointer" style="height: 30px; width: 130px;">Add Schedule</button>
		</div>
		<table class="calendar_body">
			<thead>
				<tr bgcolor="#A0D9E2">
					<td class="day sun">Sun</td>
					<td class="day">Mon</td>
					<td class="day">Tue</td>
					<td class="day">Wed</td>
					<td class="day">Thu</td>
					<td class="day">Fri</td>
					<td class="day sat">Sat</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<c:if test="${date_status.index%7==0}">
									<tr>
								</c:if>
								<td class="today">
									<div class="date">
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat">
							</c:when>
							<c:when test="${date_status.index%7==0}">
				</tr>
				<tr>
					<td class="sun_day">
						<div class="sun">
							</c:when>
							<c:otherwise>
								<td class="normal_day">
									<div class="date">
							</c:otherwise>
							</c:choose>
							${dateList.date}
						</div>
						<div>
							<!-- 달력에 일정 띄우고 클릭 시 수정/삭제 창 띄우는 코드 -->
							<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status">
								<%-- <a href="/schedule_show?cshedule_idx=${scheduleList.schedule_idx}" --%>
								<a href="/easyfit/scheduleGet?cshedule_idx=${scheduleList.schedule_idx}"
									onclick="window.open(this.href, '_blank', 'width=550,height=600,left=680%, top=200%, toolbars=no,scrollbars=no'); return false;"
									class="date_subject "
									style="color: ${scheduleList.schedule_mycolor}">${scheduleList.schedule_subject}</a>
								<br>
							</c:forEach>
						</div>
					</td>
					</c:forEach>
			</tbody>
		</table>
</form>
<div id="mask_board_move"></div>
<div class="normal_move_board_modal">
	<script>
		$(function() {
			$("#testDatepicker")
					.datepicker(
							{

								dateFormat : "yy-mm-dd",
								changeMonth : true,
								changeYear : true,
								dayNames : [ '월요일', '화요일', '수요일', '목요일',
										'금요일', '토요일', '일요일' ],
								dayNamesMin : [ '월', '화', '수', '목', '금',
										'토', '일' ],
								monthNamesShort : [ '1', '2', '3', '4',
										'5', '6', '7', '8', '9', '10',
										'11', '12' ]
							});
		});
		function scheduleRegister() {
			var scheduleRegisterForm = document.scheduleRegister;
			if (scheduleRegisterForm.schedule_date.value == "" || scheduleRegisterForm.schedule_date.value == null) {
				alert("날짜를 입력해주세요.");
				scheduleRegisterForm.schedule_date.focus();
				return false;
			} else if (scheduleRegisterForm.schedule_subject.value == "" || scheduleRegisterForm.schedule_subject.value == null) {
				alert("제목을 입력해주세요.");
				scheduleRegisterForm.schedule_date.focus();
				return false;
			}
			scheduleRegisterForm.submit();
		}
	</script>
	<div class="top" style="">
		<div class="close">x</div>
		<div class="subject">Add Schedule</div>
	</div>

	<div class="bottom">
		<div class="info">* 순번은 해당 날짜안에서 순서대로 입력이 됩니다.(하루에 최대 4개의 스케줄만
			등록할 수 있습니다.)</div>
		<form name="scheduleRegister" action="/easyfit/scheduleRegister">
			<input type="hidden" name="year" value="${today_info.search_year}" />
			<input type="hidden" name="month"
				value="${today_info.search_month-1}" />
			<div class="contents">
				<ul>
					<li>
						<div class="text_subject">순번 :</div>
						<div class="text_desc">
							<input type="text" name="schedule_num" class="text_type1" />
						</div>
					</li>
					<li>
						<div class="text_subject">날짜 :</div>
						<div class="text_desc">
							<input type="text" name="schedule_date" class="text_type1"
								id="testDatepicker" readonly="readonly" />
						</div>
					</li>
					<li>
						<div class="text_subject">제목 :</div>
						<div class="text_desc">
							<input type="text" name="schedule_subject" class="text_type1" />
						</div>
					</li>
					<li style="margin-bottom: 70px;">
						<div class="text_subject">내용 :</div>
						<div class="text_area_desc">
							<textarea name="schedule_desc" class="textarea_type1" rows="5"></textarea>
						</div>
					</li>
					<li>
						<div class="text_subject">공유 :</div> <input class="radio"
						type="radio" name="schedule_share" value="1" checked="checked">공개
						<input type="radio" name="schedule_share" value="2">비공개
					</li>
					<li>
						<div class="text_subject">색상 :</div> <input class="colorbox"
						type='color' name='schedule_mycolor' value='' />
					</li>
					<li class="button_li">
						<button type="button" class="buttonstyle board_move_go pointer"
							onclick="scheduleRegister();">Add</button>
					</li>
				</ul>

			</div>
		</form>
	</div>

</div>
<%@ include file="../includes/footer.jsp" %>
</html>