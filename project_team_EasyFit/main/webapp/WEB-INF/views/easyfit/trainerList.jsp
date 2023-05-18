<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/adminHeader.jsp" %>

<div class="card-body">		
	<div class="d-sm-flex align-items-center justify-content-between mb-4 ml-2">
		<h1 class="h3 mb-0 text-gray-800"> 트레이너 목록</h1>	
	</div>

	<table class="table table-bordered dataTable mt-4" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
	<thead>
		<tr role="row">
			<!-- <th class="sorting sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" aria-sort="descending" style="width: 86px;">No</th> -->              
			<th class="sorting width-12 bg-light" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 121px;">트레이너번호</th>
			<th class="sorting width-10 bg-light" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 65px;">트레이너이름</th>
			<th class="sorting width-20 bg-light" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 31px;">전화번호</th>
			<th class="sorting width-25 bg-light" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 67px;">주소</th>
    	</tr>
	</thead>
	<tbody>
		<c:forEach items="${trainerList}" var="trainerList">
		<tr>
			<td>${trainerList.tno}</td>
			<td><a href="/easyfit/trainerGet?tno=${trainerList.tno}">${trainerList.tname}</a></td>
			<td>${trainerList.ttel}</td>
			<td>${trainerList.taddress}</td>
		</tr>
		</c:forEach> 
	</tbody>
	</table>
</div>

<!-- 회원 리스트 끝 ------------------------------------------------------------------------------->

<!-- 검색 창 시작 --------------------------------------------------------------------------------->	
<div class="row">
	<div class="col-lg-12" align="center">
		<form id='searchForm' action="/easyfit/trainerList" method='get' class='form-inline justify-content-center'>	
			<div class="card-body py3">
				<div class="d-sm-flex justify-content-center align-items-center mb-4">
					<select class='custom-select custom-select-sm form-control form-control-sm' name='type'>
						<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>----</option>
						<option value="A" <c:out value="${pageMaker.cri.type eq 'A' ? 'selected' : ''}" />>트레이너이름</option>
						<option value="B" <c:out value="${pageMaker.cri.type eq 'B' ? 'selected' : ''}" />>트레이너번호</option>	
						<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>전화번호</option>
					</select>	
					<input type="text" name="keyword" class='custom-select-sm form-control form-control-sm ml-2' value='<c:out value="${pageMaker.cri.keyword}"/>' />
					<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
					<input type='hidden' name='amount'	value='<c:out value="${pageMaker.cri.amount}"/>' />
					<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>">
					<div class="ml-2">
						<button type="submit" class="btn btn-secondary custom-select-sm btn-width" >검색</button>
					</div>
					<!-- 조회 및 등록 버튼 시작 ------------------------------------------------------------------------>
					
					<div class="ml-2">
						<button type="button" class="btn btn-primary custom-select-sm" onclick="location.href='/easyfit/trainerRegister'">트레이너등록</button>
					</div>
					
					<!-- 조회 및 등록 버튼 종료 ------------------------------------------------------------------------>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 검색 창 종료 ---------------------------------------------------------------------------------->


<!-- 페이지 시작 ----------------------------------------------------------------------------------->

<ul class="pagination justify-content-center mb-5">
	<c:if test="${pageMaker.prev}">
		<li class="paginate_button page-item previous disabled" id="dataTable_previous">
		<a href="${pageMaker.startPage -1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
	</c:if>	
	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<li class='paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : ""}'>
			<a href="/easyfit/trainerList?pageNum=${num}&amount=10" aria-controls="dataTable" data-dt-idx="${num}" tabindex="0" class="page-link">${num}</a>
		</li>
	</c:forEach>				
	<c:if test="${pageMaker.next}">
		<li class="paginate_button page-item next" id="dataTable_next">
			<a href="${pageMaker.endPage +1 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
		</li>
 	</c:if>
</ul>

<!-- 페이지 종료 ----------------------------------------------------------------------------------->            	

<%@ include file="../includes/footer.jsp" %>