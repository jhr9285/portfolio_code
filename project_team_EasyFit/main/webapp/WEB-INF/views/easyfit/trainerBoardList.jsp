<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
 
<%@ include file="../includes/header.jsp" %>

			    
		
		<div class="card-body">		
			<div class="d-sm-flex align-items-center justify-content-between mb-4 ml-2">
				<h1 class="h3 mb-0 text-gray-800"> 트레이너 게시판</h1>	
			</div>
			<table class="table table-bordered dataTable" id="dataTable" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
	                  <thead>
		
					<tr role="row">	
							<th>글번호</th>
							<th>글제목</th>
							<!-- <th>공지 내용</th> -->
							<th>작성자</th>
							<th>공지 날짜</th>
						</tr>
	                  </thead>
	             
                  <tbody> 
					<c:forEach items="${list}" var="list">
						<tr>									
							<td width="10%">${list.tbno}</td>
							<td width="50%">
								<a href='/easyfit/trainerBoardGet?tbno=${list.tbno}'>${list.tbtitle}</a>
							</td>
							<!--<td>${list.tbcontent}</td>  -->
							<td width="20%">${list.tname}</td>
							<td width="20%"><fmt:formatDate pattern='yyyy-MM-dd' value="${list.tbdate}" /></td>						
						</tr>
					</c:forEach>
                  </tbody>
             </table>
		</div>

				
				
				<!--공지사항 검색, 새로등록 버튼  -->
				<div class="row">
					<div class="col-lg-12" align="center">
						<form id='searchForm' action="/easyfit/trainerBoardList" method='get' class='form-inline justify-content-center'>
							
							<div class="card-body py3">
								<div class="d-sm-flex justify-content-center align-items-center mb-4">
								
									<select class='custom-select custom-select-sm form-control form-control-sm' name='type'> 
										<option value=""
											<c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>----</option>
										<option value="T"
											<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />>글제목</option>
										<option value="C"
											<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>내용</option>
										<option value="W"
											<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}" />>작성자</option>
										
									</select>
									
									<input type='text' name='keyword' class='custom-select-sm form-control form-control-sm ml-2' value='<c:out value="${pageMaker.cri.keyword}"/>'>
									<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'>
									<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'>
									<div class="ml-2">
			                			<button type="submit" class="btn btn-secondary custom-select-sm btn-width">조회</button>
			                		</div>
					                <div class="ml-2">
			                			<a href="/easyfit/trainerBoardRegister"><button type="button" class="btn btn-primary custom-select-sm btn-width">등록</button></a>
			                		</div>
								</div>
							</div>					
						</form>

						<form id='hiddenForm' action="/easyfit/trainerBoardList" method='get'>
							<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
							<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
							<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" />
						</form>

					</div>
				</div>					
				
				
				<!-- hidden 태그 전송용 폼 시작 -->
				<form id="hiddenForm" action="/easyfit/trainerBoardList" method="get">
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>				            
				<!-- hidden 태그 전송용 폼 끝 -->

				<!-- 페이지 ----------------------------------------------------------------->
				
				<ul class="pagination justify-content-center mb-5">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button page-item previous disabled" id="dataTable_previous">
						<a href="${pageMaker.startPage -1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li><a href="/easyfit/trainerBoardList?pageNum=${num}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">${num}</a></li>
        			</c:forEach>
        			<c:if test="${pageMaker.next}">
					<li class="paginate_button page-item next" id="dataTable_next">
						<a href="${pageMaker.endPage +1 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
					 </c:if>
				</ul>
				
				
				<!-- 페이지 -->
            	
   	
       
<%@ include file="../includes/footer.jsp" %>