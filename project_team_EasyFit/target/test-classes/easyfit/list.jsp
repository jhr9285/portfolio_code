<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
    
<%-- 사용하실때 풀어요! <%@ include file="../includes/header.jsp" %> --%>


			    
		       <div class="d-sm-flex align-items-center justify-content-between mb-4 ml-2">
                       <h1 class="h3 mb-0 text-gray-800">List</h1>
               </div>
			    
				<!-- 회원 리스트 -------------------------------------------------------------------------->
				<div class="card-body">	
					<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
	                    <thead>
	                        <tr role="row">
		                        <th class="sorting sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" aria-sort="descending" style="width: 86px;">No</th>
		                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 121px;">회원번호</th>
		                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 65px;">이름</th>
		                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 31px;">핸드폰 번호</th>
		                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 72px;">최근 PT 일자</th>
		                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 67px;">가입일</th>
	                        </tr>
	                    </thead>
	               
	                    <tbody> 
		                    <tr class="odd">
	                            <td class="sorting_1">1</td>
	                            <td>0001</td>
	                            <td>이성연</td>
	                            <td>010-5436-6414</td>
	                            <td>23.03.22</td>
	                            <td>22.11.23</td>
		                    </tr>
		                    <tr class="even">
	                            <td class="sorting_1">2</td>
	                            <td>0002</td>
	                            <td>김기철</td>
	                            <td>010-2342-5893</td>
	                            <td>17.08.28</td>
	                            <td>34.01.19</td>
	                        </tr>
	                        <tr class="odd">
	                            <td class="sorting_1">3</td>
	                            <td>0003</td>
	                            <td>이태호</td>
	                            <td>010-6849-2049</td>
	                            <td>15.04.11</td>
	                            <td>15.04.10</td>
	                        </tr>
	                        <tr class="even">
	                            <td class="sorting_1">4</td>
	                            <td>0004</td>
	                            <td>이유진</td>
	                            <td>1588-1588</td>
	                            <td> - </td>
	                            <td>21.09.12</td>
	                        </tr>
	                        <tr class="odd">
	                            <td class="sorting_1">5</td>
	                            <td>0005</td>
	                            <td>이원종</td>
	                            <td>017-6834-4938</td>
	                            <td>23.03.29</td>
	                            <td>19.04.22</td>
	                        </tr>
	                        <tr class="even">
	                            <td class="sorting_1">6</td>
	                            <td>0006</td>
	                            <td>이종우</td>
	                            <td>*23#</td>
	                            <td>08.12.11</td>
	                            <td>07.12.25</td>
	                        </tr>
	                        <tr class="odd">
	                            <td class="sorting_1">7</td>
	                            <td>0007</td>
	                            <td>유지은</td>
	                            <td>02-591-0759</td>
	                            <td>11.04.25</td>
	                            <td>11.03.22</td>
	                        </tr>
	                        <tr class="even">
	                            <td class="sorting_1">8</td>
	                            <td>0008</td>
	                            <td>이혜림</td>
	                            <td>112</td>
	                            <td>13.08.11</td>
	                            <td>13.05.10</td>
	                        </tr>
	                        <tr class="odd">
	                            <td class="sorting_1">9</td>
	                            <td>0009</td>
	                            <td>이순신</td>
	                            <td>비둘기</td>
	                            <td>10.03.17</td>
	                            <td>10.02.11</td>
	                        </tr>
	                        <tr class="even">
	                            <td class="sorting_1">10</td>
	                            <td>0010</td>
	                            <td>해모수</td>
	                            <td> - </td>
	                            <td> - </td>
	                            <td> - </td>
	                        </tr>
                        </tbody>
	                </table>
				</div>
				<!-- 회원 리스트 -->
				
				
				<!-- 회원 조회 및 등록 버튼 -------------------------------------------------------------->
				<div class="card-header py3">
					<div class="d-sm-flex justify-content-center align-items-center mb-4">
						<div class="ml-4">
			                <select class="custom-select custom-select-sm form-control form-control-sm">
			                    <option value="">----</option>
			                    <option value="회원이름">회원이름</option>
			                    <option value="전화번호">전화번호</option>
			                    <option value="회원번호"> 회원번호</option>
			                </select>
		         		</div>
		         		<div class="ml-4">
		                	<input type="search" class="custom-select-sm form-control form-control-sm">
		         		</div>
		                <div class="ml-4">
		                	<button type="submit" class="btn btn-secondary custom-select-sm" style="width: 80px;">조회</button>
		                </div>
		                <div class="ml-4">
		                	<button type="button" class="btn btn-primary custom-select-sm" style="width: 80px;">등록</button>
		                </div>
					</div>
					</div>
				<!-- 회원 조회 및 등록 버튼 -->
				
				
				<!-- 페이지 ----------------------------------------------------------------->
				
				<ul class="pagination justify-content-center mb-5">
					<li class="paginate_button page-item previous disabled" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
					<li class="paginate_button page-item active">
					<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
					<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
					<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
					<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
					<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
					<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a></li>
					<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
				</ul>
				
				<!-- 페이지 -->
            


            
<%-- 사용하실때 풀어요! <%@ include file="../includes/footer.jsp" %> --%>