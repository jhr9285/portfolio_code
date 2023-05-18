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
 
	<div class="card-body shadow bg-light container px-2 mb-4">
		<!-- 페이지 이름 -->
		<div class="col-lg-12 pt-2 d-inline-block">
			<div class="panel-heading col-lg-9 align-items-center justify-content-start d-inline-block"> 
				<h1 class="h3 mb-0 text-gray-800 font-weight-bold">공지사항</h1>
				<hr>
			</div>
			
			<form method="post" class="px-3 mt-0">
				<div class="form-group mt-1 ml-3 mb-1" style="display:flex; align-items: baseline;">
					<label class="form-label mr-1 h7">#</label>
					<input class="box5 bg-light h7" type="number" name="nno" value="${notice.nno}" readonly />	
				</div>
				<div class="form-group mb-0 ml-3">
					<input class="box4 h5 bg-light mb-0 font-weight-bold" type="text" name="ntitle" value="${notice.ntitle}"  readonly /><br>
				</div>
				<div class="row my-0 py-0 my-0">
					<div class="col-lg-1 form-group mt-1 ml-4 mr-1 px-0">
						<img class="img-profile rounded-circle writerImg ml-2" src="/resources/img/undraw_profile.svg" width="23px">
						<input class="box5 bg-light h8 width-60 mb-0" type="text" name="tname" value="${notice.tname}" readonly /> <br>	
					</div>
					<div class="col-lg-2 form-group mt-1 px-0">
						<input class="box5 bg-light h8 width-60 mb-0" type="text" name="ndate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.ndate}"/>' readonly/><br />
					</div>
				</div>
				<div class="col-lg-12 form-group my-0 mx-1">
					<!-- <label class="form-label my-0 mr-3"></label> <br> -->
					<textarea class="form-control z-depth-1 h7 text-black-600" name="ncontent" rows="8" readonly><c:out value="${notice.ncontent}"/></textarea> <br>
				</div>
				<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
				<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
				<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
				<!-- 수정, 삭제 버튼 -->
				<div class="float-right">
				<sec:authentication property="principal" var="principal"/>					
		        <sec:authorize access="hasRole('ROLE_ADMIN')">			        
					<button type="button" class="btn btn-info mb-4 h7-5" onclick="location.href = '/easyfit/noticeModify?nno=${notice.nno}'">수정</button>
					<button type="button" class="btn btn-danger mb-4 h7-5" onclick="location.href = '/easyfit/noticeRemove?nno=${notice.nno}'">삭제</button>
		        </sec:authorize>
					<button type="button" class="btn btn-success mb-4 h7-5" onclick="location.href = '/easyfit/noticeList?nno=${notice.nno}'">목록</button>
				</div>
			</form>
		</div>
	</div>		

<%@ include file="../includes/footer.jsp" %>