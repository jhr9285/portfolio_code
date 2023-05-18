<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/adminHeader.jsp" %>

<div class="card-body shadow bg-light">
<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
			<h1 class="h3 mb-0 text-gray-800">트레이너 정보 수정</h1>
		</div>
			<form method="post" class="table table-bordered">
				<div class="form-group mt-3">
					<label class="width-10">번 호 :</label>
					<input class="box" type="number" name="tno" value="${trainer.tno}" readonly/>	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">I D :</label>
					<input class="box" type="text" name="tid" value="${trainer.tid}" /><br />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">이 름 :</label>
					<input class="box" type="text" name="tname" value="${trainer.tname}" />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">전화번호 :</label>
					<input class="box" type="text" name="ttel" value="${trainer.ttel}" /><br />
				</div>
				<div class="form-group mt-3">
					<label class="width-10">생년월일 :</label>
					<input class="dateBox" type="date" name="tbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainer.tbirth}"/>' /><br />
				</div>
				<div class="form-group mt-3">
					<label class="width-10">주 소 :</label>
					<input class="box" type="text" name="taddress" value="${trainer.taddress}" /><br />
				</div>
				<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
				<%-- <input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br /> --%>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	
				<div class="text-center">	
					<button type="submit" class="btn btn-info custom-select-sm mb-4">수정 완료</button>
				</div>
			</form>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>