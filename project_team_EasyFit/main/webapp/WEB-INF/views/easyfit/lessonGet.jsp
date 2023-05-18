<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>
    
<%@ include file="../includes/header.jsp" %>

    
    				<!-- 운동일자, 작성일자, 회원이름 시작  -------------------------------------------------->
					<div class="d-sm-flex align-items-center justify-content-between mb-3 h7 ml-2">
						<div>
							<label class="text-gray-800">운동일자 : </label>
							<input type="date" id="edate" class="box2 width-60 h7 pl-4" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />' readonly>
						</div>
 						<div>
							<label class="text-gray-800">작성일자 : </label>
							<input type="date" id="erdate" class="box2 width-60 h7 pl-4" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].erdate}" />' readonly>
						</div>
					</div>
					
					<div>
						<div class="mb-3">
							<input type="text" id="mname" value="${vo[0].mname}" class="text-center box2 width-10" readonly>
							<label class="text-gray-800 h6 ml-1">
								   회원님 운동일지
							</label>
						</div>
					</div>
					<!-- 운동일자, 작성일자, 회원이름 끝 -->
				
				
					<!-- 운동내역 조회 시작 --------------------------------------->
					<div class="card shadow mb-4">
						<div class="card-body px-5 py-4">
							
							<c:forEach items="${vo}" var="voVar" varStatus="status">
								<c:if test="${vo[status.index-1].ergroup ne vo[status.index].ergroup}">
									<div class="row m-0">
										<div class="align-items-center col-lg-12 p-0 m-0">
											<div class="h7 mb-0 text-gray-800 font-weight-bold my-2">
												${vo[status.index].ergroup}번 운동 : ${vo[status.index].ename}
											</div>
											<div class="row p-0 m-0">	
												<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">세트</div>
												<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">무게(kg)</div>
												<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">횟수</div>
												<div class="box text-center col-lg-5 p-0 m-0 h8 text-gray-800 bg-light">코멘트</div>
											</div> 
										</div>
									</div>
								</c:if>										
									<div class="row m-0">
										<input type="hidden" name="prno" value="${voVar.prno}">
										<input type="hidden" name="edate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${voVar.edate}" />'>
										<input type="hidden" name="erno" value="${voVar.erno}">
										<input type="hidden" name="eno" value="${voVar.eno}">
										<input type="text" name="erset" class="box text-center col-lg-2 m-0 h8 erset" value="${voVar.erset}" readonly>
										<input type="text" name="erweight" class="box text-center col-lg-2 m-0 h8 erweight" value="${voVar.erweight}" readonly>
										<input type="text" name="ernumber" class="box text-center col-lg-2 m-0 h8 ernumber" value="${voVar.ernumber}" readonly>
										<textarea name="ermemo" class="box lh-150 text-left col-lg-5 m-0 h8 ermemo" readonly>${voVar.ermemo}</textarea> 
																			
										<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
										<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
									</div>
							</c:forEach>
	
							<div class="mt-4 float-right">
								<button type="button" class="d-sm-inline-block btn btn-success shadow-sm btn-width pt-1" data-oper="list">
									<span class="fas fa-sm text-white h8">목록</span>
								</button>
								<span>&nbsp;</span>
								<button type="button" class="d-sm-inline-block btn btn-primary shadow-sm btn-width pt-1" data-oper="modify"
										onclick="location.href='/easyfit/lessonModify?prno=<c:out value="${vo[0].prno}"/>&edate=<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />&tno=<sec:authentication property="principal.trainerVO.tno"/>'">
									<span class="fas fa-sm text-white h8">수정</span>
								</button>
								<span>&nbsp;</span>
								<button type="button" class="d-sm-inline-block btn btn-danger shadow-sm btn-width pt-1" data-oper="remove">
									<span class="fas fa-sm text-white h8">삭제</span>
								</button>
							</div>
							
							<form id='operForm' action="/easyfit/lessonRemove" method="post">
								<input type='hidden' id='prno' name='prno' value='<c:out value="${vo[0].prno}"/>'>
								<input type='hidden' id='edate' name='edate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />'>
								
								<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
								<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
							</form>
								
						</div>			
					</div>
					<!-- 운동내역 조회 끝 -->
					
				
				
<script type="text/javascript">
	$(document).ready(function() {	
		
		/* 목록, 수정, 삭제 버튼 클릭 이벤트 **********************************/
		var url = location.search;
		var url2 = url.substring(1);
		var url3 = url2.split("&");
		var url4 = url3[0].split("=");
		var prnoValue = url4[1];
		
		
		$("button[data-oper='list']").on("click", function(){
			
			$("#operForm input:last").remove();
			$("#operForm > input[name='edate']").remove();
			$("#operForm > input[name='prno']").val(prnoValue);
			$("#operForm").attr("method", "get");
			$("#operForm").attr("action", "/easyfit/lessonDetailList");
			$("#operForm").submit();
		});
		
		$("button[data-oper='remove']").on("click", function(e){
			
			alert("삭제가 완료되었습니다.");
			$("#operForm").submit();											
		});
	
		
	});
</script>		


<%@ include file="../includes/footer.jsp" %>				