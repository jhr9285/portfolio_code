<!-- Quiz230303 - 1. 댓글갯수가 0일때는 댓글갯수를 출력하지 않도록 변경하기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@ include file="../includes/header.jsp" %>

           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Coding Quiz List
                            
                            <!-- spring security 태그 -->
							<sec:authorize access="isAuthenticated()"> <!-- 로그인 되었는지 검사 -->
		                            <button id="regBtn" type="button" class="btn btn-primary btn-xs pull-right">
		                            	<b>Register New Board</b>
		                            </button>                     
							</sec:authorize>
								
                        </div>
                        <!-- /.panel-heading -->
                        
                        <!-- panel-body ----------------------------------------------------------------->
						<div class="panel-body">
						<!-- Quiz230306 - 1. 게시판에서 한 페이지 출력하는 글의 갯수 조절하는 기능 추가하기.
						 	  1) select 태그를 만든다.
						 	  2) 선택한 값으로 amount를 변경한다. -->
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
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>수정일</th>
									</tr>
								</thead>
								
								<!-- BoardController에서 list로 보낸 것을 list로 받음 -->
								<c:forEach items="${list}" var="board"> <!-- list를 하나씩 board로 뽑아냄 -->
									<tr>
										<td width="7%"><c:out value="${board.bno}" /></td>
										<td width="50%"> <!-- 목록에서 특정 게시물 선택 후 이동 처리 ==> 조회는 get 방식으로 처리 -->
											
											<!-- 페이징 처리를 하려면bno는 물론, pageNum과 amount도 함께 넘겨야 됨 ==> .move 이벤트 처리 코딩 -->
											<!-- <a href='/board/get?bno=<c:out value="${ board.bno }"/>'> --> 
											<a class='move' href='<c:out value="${ board.bno }"/> '>
												<c:out value="${board.title}" />  
													<c:if test="${board.replyCnt ne 0}">
														<b> [ <c:out value="${board.replyCnt}" /> ] </b> 
													</c:if>
											</a>
										</td> 
										<!-- util.date는 formatdate 필요, sql.date는 필요X -->
										<td width="13%"><c:out value="${board.writer}" /></td>
										<td width="15%"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
										<td width="15%"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" /></td>
									</tr>
								</c:forEach>
							</table>
							<!-- /.table -->
							
							<!-- 검색폼 시작 ------------------------------------------------------------>
							<div class="row">
								<div class="col-lg-12" align="center">
									
									<form id='searchForm' action="/board/list" method='get' class='form-inline'>
										<select class='form-control' name='type'> <!-- 검색 실행된 list.jsp로 이동했을 때 selected된 type을 그대로 유지 -->
											<option value=""
												<c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>--</option>
											<option value="T"
												<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />>제목</option>
											<option value="C"
												<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>내용</option>
											<option value="W"
												<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}" />>작성자</option>
											<option value="TC"
												<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}" />>제목 or 내용</option>
										</select>
										<input type='text' name='keyword' class='form-control' value='<c:out value="${pageMaker.cri.keyword}"/>'>
										<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'>
										<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'>
										<button class="btn btn-default">Search</button>
									</form>
								</div>
							</div>
							<!-- 검색폼 끝 -->
							
							<!-- 페이징 처리 시작 ------------------------------------------------------->
							<div align="center"> <!-- pull-right class : 오른쪽 정렬 (부트스트랩)-->
								<ul class="pagination">
									<c:if test="${ pageMaker.prev }">
										<li class="paginate_button privious">
											<a href="${ pageMaker.startPage - 1 }">Previous</a> <!-- startPage : 페이징 처리된 영역의 첫 페이지-->
										</li>
									</c:if>
									
									<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
										<li class='paginate_button  ${ pageMaker.cri.pageNum == num ? "active" : "" }'>
											<a href="${ num }">${ num }</a>
										</li>
									</c:forEach>  <!-- 3항 조건 연산자 사용 ==> 조건식 의미 : "현재 페이지면" -->
												  <!-- ==> T : active 클래스 추가(현재 페이지를 나타내는 색상으로 바꾸는 기능) -->
									<c:if test="${ pageMaker.next }">
										<li class="paginage_button next">
											<a href="${ pageMaker.endPage + 1 }">Next</a> <!-- endPage : 페이징 처리된 영역의 마지막 페이지 -->
										</li>
									</c:if>
									
								</ul>			  	
							</div>
							<!-- 페이징 처리 끝 -->
							
						</div>
						<!-- /.panel-body -->
						
						<!-- hidden 태그 전송용 폼 시작 ==> 페이징 처리를 위해 아래 행 반드시 필요 (pageNum, amount가 파라미터에 붙어있어야 됨) -->
						<form id="actionForm" action="/board/list" method="get">
							<input type='hidden' name='pageNum' value='${ pageMaker.cri.pageNum }'>
							<input type='hidden' name='amount' value='${ pageMaker.cri.amount }'>
							<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
						</form>
						<!-- hidden 태그 전송용 폼 끝 -->
						
						<!-- Modal 추가 ----------------------------------------------------------------->
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
										<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										<!-- <button type="button" class="btn byn-primary">Save changes</button> -->
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
		var result = '<c:out value="${ result }" />'; // <== BoardController resigter-postmapping의 result
		checkModal(result);
		
		/* history : 자바스크립트 내장객체 ==> history.back : 이전 페이지로 이동 */
		// 뒤로가기 버튼 클릭 시 모달창이 다시 뜨지 않게 하는 코드 (state 값이 null 처리되어 없어짐)
		// (그런데 지금은 주석 처리 해도 모달창이 다시 뜨지 않기는 함)
		// history.replaceState({}, null, null); 
		
		/* 등록 이벤트 처리 (모달) ******************************************************************/
		function checkModal(result) {
			if(result === '' || history.state) {  // success 라는 문자열이 result로 들어옴
				return;
			}
			
			if(parseInt(result) > 0) { // 정수로 변환한 result가 0보다 크면 (result의 success 문자열은 parseInt 불가능)
				$(".modal-body").html( // 모달 창에 아래 내용을 띄운다.
					parseInt(result) + " 번 게시글이 등록되었습니다."
				);
			}
			$('#myModal').modal("show");
		}
		
		$('#regBtn').on("click", function() {
			
			self.location = '/board/register';
			
		});
		
		/* 페이징 이벤트 처리 ******************************************************************/
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault(); // 소괄호를 쓰자!!!
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$('.move').on("click", function(e) {
			e.preventDefault();
			
			if($("input[name=bno]").length == 0) {
				actionForm.append('<input type="hidden" name="bno" value="' + $(this).attr("href") + '">');
			}
			
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});
		
		
		
 		var pa = $("#pagingAmount");
		
 		pa.find('select').on("change", function(e) {
			
 			pa.submit();
 			
 		});
		
		/* 검색 이벤트 처리 ******************************************************************/
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
			
			e.preventDefault();
			
			if(!searchForm.find("option:selected").val()) { // selected된 옵션의 value가 없으면
				alert("검색 종류를 선택하세요.");
				return false; // false 반환
			}
			
			if(!searchForm.find("input[name='keyword']").val()) { // 검색어가 없으면
				alert("키워드를 입력하세요.");
				return false; // false 반환
			}
			
			searchForm.find("input[name='pageNum']").val("1"); // pageNum에 1 입력 (1페이지가 기본값이므로)
			
			searchForm.submit();
			
		});
		
	});
</script>            

<%@ include file="../includes/footer.jsp" %>