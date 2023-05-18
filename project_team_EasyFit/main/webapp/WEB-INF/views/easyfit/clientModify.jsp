<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>


<div class="card-body shadow bg-light">
<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
			<h1 class="h3 mb-0 text-gray-800">회원 정보 수정</h1>
		</div>
		<form method="post" class="table table-bordered">
			<div class="form-group mt-3">
				<label class="width-10">회원번호 : </label>
				<input class="box" type="number" name="mno" value="${client.mno}" disabled/><br />	
			</div>
			<div class="form-group mt-3">
				<label class="width-10">Email : </label>
				<input class="box"  type="text" name="memail" value="${client.memail}" /><br />	
			</div>
			<div class="form-group mt-3">
				<label class="width-10">이름 : </label>
				<input id="mname" class="box" type="text" name="mname" value="${client.mname}" /><br />	
			</div>
			<div class="form-group mt-3">
				<label class="width-10">가입일 : </label>
				<input class="dateBox" type="date" name="mjoindate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mjoindate}"/>' disabled/><br />
			</div>
			<div class="form-group mt-3">
				<label class="width-10">생년월일 : </label>
				<input id="mbirth" class="dateBox" type="date" name="mbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mbirth}"/>'/><br />
			</div>
			<div class="form-group mt-3">
				<label class="width-10">주소 : </label>
				<input class="box" type="text" name="maddress" value="${client.maddress}" /><br />
			</div>
			<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
			<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	
			<div class="text-center">		
				<button data-oper="modify" type="submit" class="btn btn-info custom-select-sm btn-width mb-4">수정완료</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("button[data-oper='modify']").on("click", function(){
		if($("#mname").val() == null || $("#mname").val().length == 0){
			alert("이름을 입력해주세요잉~");
			return false;
		}
		if($("#mbirth").val() == null || $("#mbirth").val().length == 0){
			alert("생일을 입력해주세요잉~");
			return false;
		}
	})
});
</script>

<%@ include file="../includes/footer.jsp" %>