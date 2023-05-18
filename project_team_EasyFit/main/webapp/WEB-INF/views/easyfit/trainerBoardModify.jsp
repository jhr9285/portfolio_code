<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<div class="card-body shadow bg-light container mb-3">
	<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block">
		<div class="panel-heading col-lg-9 align-items-center justify-content-start mb-1 d-inline-block"> 
			<h1 class="h3 mb-0 text-gray-800 font-weight-bold">게시글 수정</h1>
			<hr>
		</div>
	
		<form role="form" action="/easyfit/trainerBoardModify" method="post" class="px-3 mt-0">
			<div class="form-group mt-1 ml-3 mb-1" style="display:flex; align-items: baseline;">
				<label class="form-label mr-1 h7">#</label>
				<input class="box5 bg-light width-10" type="number" name="tbno" value='<c:out value="${trainerboard.tbno}"/>' readonly />
			</div>
			<div class="form-group my-1 ml-3">
				<input class="box6 h4 mb-0 font-weight-bold" type="text" name="tbtitle" value='<c:out value="${trainerboard.tbtitle}"/>' />
			</div>
			<div class="row my-0 py-0 my-0">
				<div class="col-lg-1 form-group mt-1 ml-4 mr-1 px-0">	
					<img class="img-profile rounded-circle writerImg ml-2" src="/resources/img/undraw_profile.svg" width="23px">
					<input class="box5 bg-light h8 width-60 mb-0" type="text"  name="tname" value='<c:out value="${trainerboard.tname}"/>' readonly />
					<input type="hidden" name="tid" type="text" value='<sec:authentication property="principal.trainerVO.tid"/>' />	
				</div>
				<div class="col-lg-2 form-group mt-1 px-0">
					<input class="box5 bg-light h8 width-60 mb-0" type="text" name="tbdate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainerboard.tbdate}"/>' readonly/><br />
				</div>
				<div class="col-lg-3 form-group mt-1 px-0 position-right-15">
					<span class="position-bottom-0-5">( 업데이트 : </span>
					<input class="box5 bg-light h8 width-38 mb-0 mr-0" type="text" name="tbupdatedate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${trainerboard.tbupdatedate}"/>' readonly/>
					<span class="position-bottom-0-5">)</span>
				</div>
			</div> 
			<div class="col-lg-12 form-group my-0 mx-1">
				<textarea class="form-control z-depth-1 h7 text-black-600" name="tbcontent" rows="8"><c:out value="${trainerboard.tbcontent}"/></textarea>
			</div>
			
			<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
			<input type="hidden" name="tno" value="<sec:authentication property='principal.trainerVO.tno'/>" /><br />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->	
			
			<!-- 수정, 삭제 버튼 -->
			<div class="float-right">
				<button type="submit" data-oper="modify"  class="btn btn-info mb-4 h7-5">수정 완료</button>
				<button type="submit" data-oper="remove" class="btn btn-danger mb-4 h7-5">삭제</button>
				<button type="button" data-oper="list" class="btn btn-success mb-4 h7-5" onclick="location.href = '/easyfit/trainerBoardList?tbno=${trainerboard.tbno}'">목록</button>
			</div>
		</form>	
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('button').on('click', function(e) {
		e.preventDefault();
		
		var oper = $(this).data('oper');
		
		console.log(oper);
		
		if(oper == 'remove') {
			$('form').attr('action', '/easyfit/trainerBoardRemove');
		} else if(oper == 'list') {
			$('form').attr('action', '/easyfit/trainerBoardList').attr('method', 'get');
		} 
			
		$('form').submit();
	});
});
</script>

<%@ include file="../includes/footer.jsp" %>