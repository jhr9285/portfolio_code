<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>

           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">To Do List - Write</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Write</div>
                        
                        <!-- /.panel-heading -->
                        <!-- panel-body -->
						<div class="panel-body">
							
							<form role="form" action="/todolist/write" method="post">
								
								<div class="form-group">
									<label>Content</label>
									<textarea class="form-control" rows="3" name="content"></textarea>
								</div>
								
								<div class="form-group">
									<label>State</label>
									<input class="form-control" name="state">
								</div>
								
								<button type="submit" class="btn btn-default">Submit Button</button>
								<button type="reset" class="btn btn-default">Reset Button</button>
							</form>
							
						</div>
						<!-- /#panel-body -->
						
                     </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

<%@ include file="../includes/footer.jsp" %>