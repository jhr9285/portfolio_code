<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>

           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">To Do List - Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">Modify</div>
                        <!-- /.panel-heading -->
						<div class="panel-body">
						
							<form role="form" action="/todolist/modify" method="post">
							
								<input type='hidden' name='no' value='<c:out value="${ vo.no }"/>'>
								<input type='hidden' name='pageNum' value='<c:out value="${ cri.pageNum }"/>'>
								<input type='hidden' name='amount' value='<c:out value="${ cri.amount }"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${ cri.keyword }"/>'>
								<input type='hidden' name='type' value='<c:out value="${ cri.type }"/>'>
						
								<div class="form-group">
									<label>No</label>
									<input class="form-control" name="no" 
										   value='<c:out value="${ vo.no }"/>' readonly />
								</div>
								
								<div class="form-group">
									<label>Content</label>
									<textarea class="form-control" rows="3" name="content"> 
											 <c:out value="${ vo.content }"/></textarea>
								</div>
								
								<div class="form-group">
									<label>State</label>
									<input class="form-control" name="state"
										   value='<c:out value="${ vo.state }"/>' />
								</div>
								
								<div class="form-group">
									<label>Write Date</label>
									<input class="form-control" name="wdate"
										   value='<fmt:formatDate pattern="yyyy/MM/dd" value="${ vo.wdate }"/>' readonly />
								</div>
								
								<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
								<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
								<button type="submit" data-oper="list" class="btn btn-info">List</button>
								
							</form>
								
						</div>
						<!-- /#panel-body -->
                     </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
             <script type="text/javascript">
            	$(document).ready(function(e) {
					
            		var formObj = $('form');
            		
            		$('button').on("click", function(e){
            			
            			e.preventDefault; // 전송 방지
            			
            			var operation = $(this).data("oper"); // data-oper 값 확인
            			
            			console.log(operation);
            			
            			 if(operation === "remove") { 
            				formObj.attr("action", "/todolist/remove");
            			} else if(operation === "list") {
            				
							formObj.attr("action", "/todolist/list").attr("method", "get"); //list는 GetMapping만 되어 있기 때문에 get 방식으로 변경
            				
            				var pageNumTag = $("input[name='pageNum']").clone();
            				var amountTag = $("input[name='amount']").clone(); 
            				var typeTag = $("input[name='type']").clone();
            				var keywordTag = $("input[name='keyword']").clone();
            				
            				formObj.empty();
            				
            				formObj.append(pageNumTag); 
            				formObj.append(amountTag); 
            				formObj.append(keywordTag); 
            				formObj.append(typeTag); 
            			}
            			formObj.submit(); 
            		});
            	});
            </script>
            
<%@ include file="../includes/footer.jsp" %>