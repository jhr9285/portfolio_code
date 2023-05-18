<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal" var="principal"/>					
<sec:authorize access="hasRole('ROLE_ADMIN')"> 
	<%@ include file="../includes/adminHeader.jsp" %>			        
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MANAGER')"> 		        
	<%@ include file="../includes/header.jsp" %>
</sec:authorize>

<div class="card-body shadow bg-light container mb-3">
	<!-- 페이지 이름 -->
	<div class="col-lg-12 py-4 d-inline-block">
		<div class="panel-heading col-lg-9 align-items-center justify-content-start mb-1 d-inline-block"> 
			<h1 class="h3 mb-0 text-gray-800 font-weight-bold">공지사항 등록</h1>
			<hr>
		</div>

		<!-- 공지사항 글목록 -------------------------------------------------------------------------->
		<form method="post" class="px-3 mt-0">
			<div class="form-group my-1 ml-0">
				<input class="box6 h4 mb-0 font-weight-bold" type="text" name="ntitle" placeholder="공지사항 제목을 입력하세요." />
			</div>			
			<div class="form-group mt-3">
				<textarea class="form-control z-depth-1" name="ncontent" rows="8"  placeholder="공지사항 내용을 입력하세요." ></textarea>
			</div>
			<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
			<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->			
			<div>
				<div class="float-right"> 
					<button type="submit" data-oper="register" class="btn btn-primary mb-4 h7-5" >작성 완료</button>
					<button type="reset" class="btn btn-warning mb-4 h7-5" onclick="location.href = '/easyfit/noticeRegister'">초기화</button>
					<button type="button" data-oper="list" class="btn btn-success mb-4 h7-5" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록</button>
				</div>
			</div>	
		
		</form>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>
