<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>

			
			    <!-- 페이지 이름 -->
		        <div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
                	<h1 class="h3 mb-0 text-gray-800">운동일지 (PT 계약회차 기준)</h1>
                </div>
               
			    
				<!-- 운동일지 (PT 계약회차 기준) 목록 시작 (1행 단위 : 1 PT기록) -------------------------------------------------------------------------->
				<div class="card-body">	
					<table class="table table-bordered">
	                    <thead>
	                        <tr>
		                        <th class="width-8 bg-light">No</th>
 		                        <th class="width-12 bg-light">회원 번호</th>
		                        <th class="width-10 bg-light">이름</th>
		                        <th class="width-20 bg-light">연락처</th>
		                        <th class="width-25 bg-light">최근 작성일시</th>
		                        <th class="width-13 bg-light">PT 계약회차</th>
		                        <th class="width-12 bg-light">PT 진행도</th>
	                        </tr>
	                    </thead>
	               
		                    <c:forEach items="${ptRecordList}" var="list">
			                    <tr>
		                            <td><c:out value="${list.rn}"/></td>
 		                            <td><c:out value="${list.mno}"/></td>
		                            <td><c:out value="${list.mname}"/></td>
		                            <td><c:out value="${list.mtel}"/></td> 
		                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${list.maxerdate}" /></td>
		                            <td><c:out value="${list.prturn}"/>번째</td>
		                            <td>
		                            	<a href="/easyfit/lessonDetailList?tno=<sec:authentication property="principal.trainerVO.tno"/>&mno=${list.mno}&prno=${list.prno}">
		                            		<b><c:out value="${list.prcount}"/> / <c:out value="${list.prcountall}"/></b>
		                            	</a>
		                            </td>
		                        </tr>
		                    </c:forEach>
	                </table>
				</div>
				<!-- 운동일지 (PT 계약회차 기준)  목록 끝 -->
				
				
				<!-- 검색폼 시작 --------------------------------------------------------------------------------------------->
				<div class="row">
					<div class="col-lg-12" align="center">
						<form id='searchForm' action="/easyfit/lessonList" method='get' class='form-inline justify-content-center'>
							
							<div class="card-body py3">
								<div class="d-sm-flex justify-content-center align-items-center mb-4">
								
									<select class='custom-select custom-select-sm form-control form-control-sm' name='type'> 
										<option value=""
											<c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>----</option>
										<option value="A"
											<c:out value="${pageMaker.cri.type eq 'A' ? 'selected' : ''}" />>회원이름</option>
										<option value="B"
											<c:out value="${pageMaker.cri.type eq 'B' ? 'selected' : ''}" />>회원번호</option>
										<option value="C"
											<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>연락처</option>
										<option value="AB"
											<c:out value="${pageMaker.cri.type eq 'AB' ? 'selected' : ''}" />>회원이름+회원번호</option>
									</select>
									
									<input type='text' name='keyword' class='custom-select-sm form-control form-control-sm ml-2' value='<c:out value="${pageMaker.cri.keyword}"/>'>

									
									<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>">
									
									<div class="ml-2">
				                		<button type="submit" class="btn btn-secondary custom-select-sm btn-width">검색</button>
					                </div>
		              		
								</div>
							</div>					
						</form>
					</div>
				</div>					
				<!-- 검색폼 끝 -->
				
				
				<!-- 페이징 처리 시작 ----------------------------------------------------------------->
				<div align="center" class="d-sm-flex col-lg-12">
					<div class="col-lg-12">
						<ul class="pagination d-sm-flex justify-content-center">
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button privious px-2">
								<a href="${pageMaker.startPage - 1}">이전</a> 
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class='paginate_button px-2  ${pageMaker.cri.pageNum == num ? "active" : ""}'>
								<a href="${num}" class="page-link">${num}</a>

							</li>
						</c:forEach>  
									  
						<c:if test="${pageMaker.next}">
							<li class="paginage_button next px-2">
								<a href="${pageMaker.endPage + 1}">다음</a> 
							</li>
						</c:if>
						
						</ul>			  	
					</div>
				</div>
				<!-- 페이징 처리 끝 -->
				
				
				<!-- hidden 태그 전송용 폼 시작 -->
				<form id="hiddenForm" action="/easyfit/lessonList" method="get">

					<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
					<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
					<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
				</form>				            
				<!-- hidden 태그 전송용 폼 끝 -->
				
				
				<!-- 모달 시작 ----------------------------------------------------------------->
				<div class="modal fade" id="lessonListModal" tabindex="-1" role="dialog"
					 aria-labelledby="lessonListModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="lessonListModalLabel">알림</h4>
							</div>
							<div class="modal-body">${result} : 처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default close" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝-->
				

<script type="text/javascript">
	$(document).ready(function() {
		
		/* 모달 알림 (등록) ******************************************************************/
		var result = '<c:out value="${result}" />';
		checkModal(result);
		
		function checkModal(result) {

			if(result === '' || history.state) { 
				return;
			}
			if(parseInt(result) > 0) { 
				$(".modal-body").html( 
					parseInt(result) + " 번 PT내역이 등록되었습니다."
				);
			}
			$('#lessonListModal').modal("show");
		}
		
		
		/* 페이징 이벤트 ******************************************************************/
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault(); 
			console.log('click');
			$("#hiddenForm").find("input[name='pageNum']").val($(this).attr("href"));
			$("#hiddenForm").submit();
		});
				
		
		/* 검색 이벤트 ******************************************************************/
		$("#searchForm button").on("click", function(e) {
			
			e.preventDefault();
			if(!$("#searchForm").find("option:selected").val()) { 
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if(!$("#searchForm").find("input[name='keyword']").val()) { 
				alert("검색어를 입력하세요.");
				return false; 
			}
			$("#searchForm").find("input[name='pageNum']").val("1"); 
			$("#searchForm").submit();
			
		});
		
	});
</script>
           
<%@ include file="../includes/footer.jsp" %> 