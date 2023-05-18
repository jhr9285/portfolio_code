<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>

			    
			    <!-- 페이지 이름 -->
		        <div class="col-lg-8 align-items-center justify-content-start mb-4 mr-5 d-inline-block">
                	<h1 class="h3 mb-0 text-gray-800">운동일지 (운동내역 기준)</h1>
                </div>
                					
				<!-- 신규 운동일지 작성 버튼-------------------------------------------------------------->
        		<div class="col-lg-3 d-inline-block mt-3 pt-2 pr-4 float-right">
              		<button type="button" class="h8 btn btn-primary float-right" id="regBtn">신규 운동일지 작성</button>
           		</div>
			    
				<!-- 운동일지 (운동내역 기준) 목록 시작 (1행 단위 : 1 운동기록 (특정 PT 계약회차 1건에 한정됨))-------------------------------------------------------------------------->
				<div class="card-body">	
					<table class="table table-bordered">
	                    <thead>
	                        <tr>
		                        <th class="width-10 bg-light">No</th>
		                        <th class="width-30 bg-light">운동일자</th>
		                        <th class="width-40 bg-light">작성일시</th>
		                        <th class="width-20 bg-light">PT 수업회차</th>
	                        </tr>
	                    </thead>
	               
		                    <c:forEach items="${exerciseRecordList}" var="list">
			                    <tr>
		                            <td><c:out value="${list.rn}"/></td>
		                            <td>
		                            	<a href='/easyfit/lessonGet?prno=<c:out value="${list.prno}"/>&edate=<fmt:formatDate pattern="yyyy-MM-dd" value="${list.edate}" />&tno=<sec:authentication property="principal.trainerVO.tno"/>'>
		                            		<fmt:formatDate pattern="yyyy-MM-dd" value="${list.edate}" />
		                            	</a>
		                            </td>
		                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${list.erdate}" /></td>
		                            <td><c:out value="${list.rn}"/>회차</td>
		                        </tr>
		                    </c:forEach>
	                </table>
				</div>
				<!-- 운동일지 (운동내역 기준) 목록 끝 -->
				
				
				
				
				<!-- hidden 태그 전송용 폼 시작 -->
				<form id="hiddenForm" action="/easyfit/lessonDetailList" method="get">
					<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
					<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
					<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
				</form>				            
				<!-- hidden 태그 전송용 폼 끝 -->
				
				
<script type="text/javascript">
	$(document).ready(function() {
		
		/* 신규 운동일지 작성 버튼 클릭 이벤트 ******************************************************************/

		var prnoValue = '<c:out value="${prnoTransfer}"/>';
		var mnoValue = '<c:out value="${mnoTransfer}"/>';
		
		$('#regBtn').on("click", function() {
			
			$("#hiddenForm").append('<input type="hidden" name="prno" value=' + prnoValue + '>');
			//$("#hiddenForm").append('<input type="hidden" name="prno" value="'+ ${prnoTransfer} +'">');
			$("#hiddenForm").append('<input type="hidden" name="edate" value="">');
			$("#hiddenForm").append('<input type="hidden" name="mno" value=' + mnoValue + '>');
			$("#hiddenForm").attr("action", "/easyfit/lessonRegister");
			$("#hiddenForm").submit();
		});


		
	});
</script>

           
<%@ include file="../includes/footer.jsp" %> 