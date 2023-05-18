<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>
<style>
	#wBtn {
		position: relative;
		top: 6px;
		right: 15px;
		font-size: 16px;
		font-weight: bold;
		background-color: #317873!important;
		color: white;
		margin-top: 10px;
		margin-bottom: 20px;
	}
	#pagingAmount {
		margin-bottom: 10px!important;
		margin-top: 5px!important;
	}
	th, td[width="10%"], td[width="15%"] {
		text-align: center;
	}
	th {
		background-color:#5f9ea0;
		color: white;
	}
	td[width="60%"] {
		padding-left: 13px!important;
	}
	tr:nth-child(even) {
		background-color: #ebf2e8!important;
	}
	
</style>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                            <button id="wBtn" type="button" class="btn btn-sm pull-right">
                            	Write New To Do
                            </button>                     
                        <!-- /.panel-heading -->
                        
                        <!-- panel-body ----------------------------------------------------------------->
						<div class="panel-body">
							<form id="pagingAmount" method="get" action="/board/list">
								<select name="amount">
									<option value="10"
										<c:out value="${pageMaker.cri.amount == 10? 'selected' : ''}" />>10개씩</option>
									<option value="20"
										<c:out value="${pageMaker.cri.amount == 20 ? 'selected' : ''}" />>20개씩</option>
									<option value="30"
										<c:out value="${pageMaker.cri.amount == 30 ? 'selected' : ''}" />>30개씩</option>
								</select>
							</form>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>내용</th>
										<th>상태</th>
										<th>작성일</th>
									</tr>
								</thead>
								
								<c:forEach items="${list}" var="vo"> 
									<tr>
										<td width="10%"><c:out value="${vo.no}" /></td>
										<td width="60%"> 
											<a class='move' href='<c:out value="${vo.no}"/>'>
												<c:out value="${vo.content}" />
											</a>
										</td> 
										<td width="15%"><c:out value="${vo.state}" /></td>
										<td width="15%"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wdate}" /></td>
									</tr>
								</c:forEach>
							<!-- /.c:forEach -->
							</table>
							<!-- /.table -->
							
							<!-- searchForm box start --------------------------------------------------------------->
							<div class="row">
								<div class="col-lg-12" align="center">
									
									<!-- searchForm start ------------------------------------------------------------>
									<form id='searchForm' action="/todolist/list" method='get' class='form-inline'>
										<select class='form-control' name='type'>
											<option value=""
												<c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>--</option>
											<option value="C"
												<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
											<option value="S"
												<c:out value="${pageMaker.cri.type eq 'S' ? 'selected' : ''}"/>>상태</option>
											<option value="CS"
												<c:out value="${pageMaker.cri.type eq 'CS' ? 'selected' : ''}"/>>내용 or 상태</option>
										</select>
										<input type='text' name='keyword' class='form-control' value='<c:out value="${pageMaker.cri.keyword}"/>'>
										<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'>
										<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'>
										<button class="btn btn-default">Search</button>
									</form>
									<!-- /#searchForm -->
								</div>
							</div>
							<!-- /searchForm box -->
							
							<!-- Paging ---------------------------------------------------------------------------------->
							<div align="center">
								<ul class="pagination">
									<c:if test="${ pageMaker.prev }">
										<li class="paginate_button privious">
											<a href="${ pageMaker.startPage - 1 }">Previous</a>
										</li>
									</c:if>
									
									<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
										<li class='paginate_button ${ pageMaker.cri.pageNum == num ? "active" : "" }'> <!-- active : 현재 페이지 표시 -->
											<a href="${ num }">${ num }</a>
										</li>
									</c:forEach>
									
									<c:if test="${ pageMaker.next }">
										<li class="paginate_button next">
											<a href="${ pageMaker.endPage + 1 }">Next</a>
										</li>
									</c:if>
									
								</ul>
							</div>
							<!-- /Paging -->
							
						</div>
						<!-- /.panel-body -->
						
						<!-- actionForm  -------------------------------------------------------------------------->
						<form id="actionForm" action="/todolist/list" method="get">
							<input type='hidden' name='pageNum' value="${ pageMaker.cri.pageNum }">
							<input type='hidden' name='amount' value="${ pageMaker.cri.amount }">
							<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
							<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
						</form>
						<!-- /#actionForm -->
						
						<!-- Modal 추가 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							 aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											    aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>
									</div>
									<div class="modal-body">${ result } : 처리가 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
								<!-- /.modal-content -->	 
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
                     </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<script type="text/javascript">

	$(document).ready(function() {

		var result = '<c:out value="${ result }" />'; // <== ToDoListController write-Postmapping의 result
		checkModal(result);
		
		/* write event ************************************************************************************************/
		function checkModal(result) {
			if(result === '' || history.state) {  // success 라는 문자열이 result로 들어옴
				return;
			}
			
			if(parseInt(result) > 0) { // 정수로 변환한 result가 0보다 크면 (result의 success 문자열은 parseInt 불가능)
				$(".modal-body").html( // 모달 창에 아래 내용을 띄운다.
					parseInt(result) + " 번 할일이 등록되었습니다."
				);
			}
			$('#myModal').modal("show");
		}
		
		$('#wBtn').on("click", function() {
			self.location = '/todolist/write';
		});
		
		/* paging event ************************************************************************************************/
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$('.move').on("click", function(e) {
			
			e.preventDefault();
			
			if($("input[name=bno]").length == 0) {
				actionForm.append('<input type="hidden" name="no" value="' + $(this).attr("href") + '">');
			}
			
			actionForm.attr("action", "/todolist/get");
			actionForm.submit();
		});
		
		
 		var pa = $("#pagingAmount");
		
 		pa.find('select').on("change", function(e) {
			
 			pa.submit();
 			
 		});
		
		/* search event ************************************************************************************************/
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
			
			e.preventDefault();
			
			if(!searchForm.find("option:selected").val()) {
				alert("검색 종류를 선택하세요.");
				return false;
			}
			
			
			if(!searchForm.find("input[name='keyword']").val()) {
				alert("검색어를 입력하세요.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		});
		
	});
</script>            

<%@ include file="../includes/footer.jsp" %>