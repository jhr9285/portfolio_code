<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>

<div class="card-body shadow bg-light">
<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block ">
		<div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
			<h1 class="h3 mb-0 text-gray-800">회원 등록</h1>
		</div>
			<form method="post" class="table table-bordered">
				<div class="form-group mt-3">
					<label class="width-10">이 름 : </label>
					<input id="mname" class="box" type="text" name="mname" /><br />
				</div>
				<div class="form-group mt-3">	
					<label class="width-10">생 일 : </label>
					<input id="mbirth" class="dateBox" type="date" name="mbirth" />
				</div>
				<div class="form-group mt-3">		
					<label class="width-10 mr-4">성 별 : </label>
					  <div class="custom-control custom-radio custom-control-inline ml-4 mr-5">
					    <input class="custom-control-input" type="radio" name="mgen" id="mgen_m" value="M">
					    <label class="custom-control-label" for="mgen_m">남성</label>
					  </div>
					  <div class="custom-control custom-radio custom-control-inline mr-4">
					    <input class="custom-control-input" type="radio" name="mgen" id="mgen_f" value="F">
					    <label class="custom-control-label" for="mgen_f">여성</label>
					  </div>
				</div>
				<div class="form-group mt-3">
					<label class="width-10">전화번호 : </label>
					<input id="mtel" class="box" type="text" name="mtel" /><br />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">주 소 : </label>
					<input id="maddress" class="box" type="text" name="maddress" placeholder="(선택)"/><br />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">가입일 : </label>
					<input id="mjoindate" class="dateBox" type="date" name="mjoindate" /><br />
				</div>
				<div class="form-group mt-3">		
					<label class="width-10">탈퇴일 : </label>
					<input class="dateBox" type="date" name="mdeldate" placeholder="(선택)"/><br />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">비 고 : </label>
					<input class="box" type="text" name="mmemo" placeholder="(선택)"/><br />	
				</div>
				<div class="form-group mt-3">
					<label class="width-10">이메일</label>
					<input class="box" type="text" name="memail" placeholder="(선택)"/><br />
				</div>	
					
				<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
				<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	
				<div class="text-center">
					<button data-oper="register" class="btn btn-primary custom-select-sm btn-width mb-4" type="submit">등록</button>
				</div>	
			</form>
		</div>
	</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("button[data-oper='register']").on("click", function(){
			if($("#mname").val() == null || $("#mname").val().length == 0){
				alert("이름을 입력해주세요잉~");
				return false;
			}
			if($("#mbirth").val() == null || $("#mbirth").val().length == 0){
				alert("생일을 입력해주세요잉~");
				return false;
			}
		    if (!$("input[name='mgen']:checked").val()) {
		      alert("성별을 선택해주세요.");
		      return false;
		    }
		    if($("#mtel").val() == null || $("#mtel").val().length == 0){
				alert("혹시... 번호 좀 알려주실 수 있을까요?");
				return false;
			}
		    if($("#mjoindate").val() == null || $("#mjoindate").val().length == 0){
				alert("가입일을 입력해주세요잉~");
				return false;
			}
		    var mobileRegex = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; // 휴대전화번호 형식 정규식

		    if (!mobileRegex.test($("#mtel").val())) { // 입력된 값이 형식에 맞지 않으면
		      alert("휴대전화번호를 형식에 맞게 입력해주세요.");
		      return false;
		    }
		})
	});
</script>
<%@ include file="../includes/footer.jsp" %>