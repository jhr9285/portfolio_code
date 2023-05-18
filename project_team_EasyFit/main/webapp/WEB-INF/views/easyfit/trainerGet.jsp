<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/adminHeader.jsp" %>


<div class="card-body shadow bg-light">
<!-- 페이지 이름 -->
	<div class="col-lg-4 py-4 d-inline-block ">
		<div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
			<h1 class="h3 mb-0 text-gray-800">트레이너 정보</h1>
		</div>
			<form method="post" class="table table-bordered">
				<div class="form-group">
					<label class="width-10">번 호 : </label>
					<input class="box" type="number" name="tno" value="${trainer.tno}" disabled/>	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">I D : </label>
					<input class="box" type="text" name="tid" value="${trainer.tid}" disabled/><br />	
				</div>
				<div class="form-group">
					<label class="width-10">이 름 : </label>
					<input class="box" type="text" name="tname" value="${trainer.tname}" disabled/>	
				</div>
				<div class="form-group">
					<label class="width-10">전화번호 : </label>
					<input class="box" type="text" name="ttel" value="${trainer.ttel}" disabled/><br />
				</div>
				<div class="form-group">
					<label class="width-10">생년월일 : </label>
					<input class="dateBox" type="date" name="tbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainer.tbirth}"/>' disabled/><br />
				</div>
				<div class="form-group">
					<label class="width-10">주 소 : </label>
					<input class="box" type="text" name="taddress" value="${trainer.taddress}" disabled/><br />
				</div>
						
				<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
				<%-- <input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br /> --%>
				<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
					
				<!-- 
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ptModal">PT 등록</button>
				-->
				<div class="text-center">
					<button class="btn btn-info custom-select-sm btn-width mb-4" type="button" onclick="location.href = '/easyfit/trainerModify?tno=${trainer.tno}'">수정</button>
					<button class="btn btn-danger custom-select-sm btn-width mb-4" type="button" onclick="location.href = '/easyfit/trainerRemove?tno=${trainer.tno}'">삭제</button>
				</div>
			</form>
	</div>
<!-- 등록 회원 목록 -------------------------------------------------------------->
	<div class="col-lg-7 d-inline-block float-right mt-5">	
		<div class="align-items-center justify-content-start mb-3 d-inline-block">
			<h4 class="h3 mb-0 text-gray-800">담당 회원 이력</h4>
		</div>
			
		<table id="ptTable" class="table table-bordered">
				<thead>
					<tr>
						<!-- <th>PT 번호</th> -->
						<th class="bg-light">회원 이름</th>
						<th class="bg-light">전화번호</th>
						<th class="bg-light">가입일</th>
						<th class="bg-light">PT 회차</th>
					</tr>
				</thead>
		
		<tbody>
			<c:forEach  items="${trList}" var="trList">
				<tr>
					<td>${trList.mname}</td>
					<td>${trList.mtel}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${trList.mjoindate}" /></td>					
					<td>${trList.max}</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<div id="page-navigation"></div>	
	</div>
</div>

<script>
$(document).ready(function() {
    var show_per_page = 5;
    var $pt_rows = $("#ptTable tbody tr");
    var number_of_items = $pt_rows.length;
    var number_of_pages = Math.ceil(number_of_items / show_per_page);
    var $navigation = $('<ul class="pagination justify-content-center"></ul>');
    for (var page = 1; page <= number_of_pages; page++) {
        $navigation.append('<li class="page-item"><a href="javascript:void(0);" class="page-link" data-page="' + page + '">' + page + '</a></li>');
    }
    $("#page-navigation").html($navigation);
	
    // 첫 번째 페이지에 대한 행들만 보여주기
    var start_index = 0;
    var end_index = start_index + show_per_page;
    $pt_rows.hide().slice(start_index, end_index).show();

    // 페이지 버튼 클릭 시 해당 페이지에 대한 행들 보여주기
    $navigation.on("click", "a", function() {
        var page_number = $(this).data("page");
        var start_index = (page_number - 1) * show_per_page;
        var end_index = start_index + show_per_page;
        $pt_rows.hide().slice(start_index, end_index).show();
    });
});
</script>
<%@ include file="../includes/footer.jsp" %>