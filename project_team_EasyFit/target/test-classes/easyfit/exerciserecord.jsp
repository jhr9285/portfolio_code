<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
    
<%-- 사용하실때 풀어요! <%@ include file="../includes/header.jsp" %> --%>

    
    
    				<!-- edate - 운동일자  -------------------------------------------------->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<div>
							<h1 class="h3 mb-0 text-gray-800">운동일자 : 2023-03-25</h1>
						</div>
						<span>
							작성일자 : 2023-03-25  15:21
						</span>
					</div>
				<!-- edate -->		
				
				<!-- userSelect -------------------------------------------------------->
					<div>
						<div class="mb-3">
							<label>
							<select>
								<option value="나">이성연  0001</option>
								<option value="그">이종우  0002</option>
								<option value="그녀">이혜림  0003</option>
								<option value="나의 뒤">유지은  0004</option>
							</select>
								 님의 운동일지
							</label>
						</div>
					</div>
				<!-- userSelect -->
				
				<!-- exercise select content card --------------------------------------->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="d-sm-flex align-items-center mb-4">
								<h1 class="h3 mb-0 text-gray-800">1번 운동</h1>
								<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm offset-2">
									<i class="fas fa-sm text-white-50"></i>
									Favorite
								</button>
							</div>
							<div class="row">
								<div class="col-lg-3">
									<div class="card py-2">
										<h5 class="text-center">운동이름</h5>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="card py-2">
										<h5 class="text-center">횟수</h5>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="card py-2">
										<h5 class="text-center">무게</h5>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="card py-2">
										<h5 class="text-center">세트</h5>
									</div>
								</div>
							</div>
								<button class="btn btn-primary btn-user btn-block mt-4">
									<h5 class="text-center text-white">운동 추가</h5>
								</button>
							<div class="mt-4 float-right">
								<button class="d-none d-sm-inline-block btn btn-sm btn-info shadow-sm ">
									<span class="fas fa-sm text-white">목록</span>
								</button>
								<button class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
									<span class="fas fa-sm text-white">운동완료</span>
								</button>
							</div>
						</div>			
					</div>
				</div>
				<!-- exercise select content card -->
				
				
<%-- 사용하실때 풀어요! <%@ include file="../includes/footer.jsp" %> --%>				