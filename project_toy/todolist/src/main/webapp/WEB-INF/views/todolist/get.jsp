<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>
<style>
	.page-header {
		margin-top: 20px!important;
		margin-left: 15px!important;
	}
</style>
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">View</div>
                        <!-- /.panel-heading -->
						<div class="panel-body">
						
								<div class="form-group">
									<label>No</label>
									<input class="form-control" name="no"
										   value='<c:out value="${ vo.no }"/>' readonly />
								</div>
								
								<div class="form-group">
									<label>Content</label>
									<textarea class="form-control" rows="3" name="content" readonly> 
											 <c:out value="${ vo.content }"/></textarea>
								</div>
								
								<div class="form-group">
									<label>State</label>
									<input class="form-control" name="state"
										   value='<c:out value="${ vo.state }"/>' readonly />
								</div>
								
								<div class="form-group">
									<label>Write Date</label>
									<input class="form-control" name="wdate"
										   value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.wdate}" />' readonly />
								</div>
								
								<button data-oper='modify' class="btn btn-default">Modify</button>
								<button data-oper='list' class="btn btn-info">List</button>
								
								<form id='operForm' action="/todolist/modify" method="get">
									<input type="hidden" id="no" name="no" value="<c:out value='${ vo.no }'/>">  
									<input type="hidden" name="pageNum" value="<c:out value='${ cri.pageNum }'/>">  
									<input type="hidden" name="amount" value="<c:out value='${ cri.amount }'/>">  
									<input type="hidden" name="keyword" value="<c:out value='${ cri.keyword }'/>">  
									<input type="hidden" name="type" value="<c:out value='${ cri.type }'/>">  
								</form>
								
								<script type="text/javascript">
									$(document).ready(function() {
										
										var operForm = $("#operForm");
										
										$("button[data-oper='modify']").on("click", function(e){
											operForm.attr("action", "/todolist/modify").submit();											
										});
										
										$("button[data-oper='list']").on("click", function(e){
											operForm.find('#no').remove();
											operForm.attr("action", "/todolist/list");
											operForm.submit();
										});
									});
								</script>
						</div>
						<!-- /#panel-body -->
                     </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<%@ include file="../includes/footer.jsp" %>