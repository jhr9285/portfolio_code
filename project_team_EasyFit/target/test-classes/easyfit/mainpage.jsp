<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
    
<%-- 사용하실때 풀어요! <%@ include file="../includes/header.jsp" %> --%>


					<!-- 메인 페이지 시작 ------------------------------------------------------------------------>
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">This Week</h1>
                    </div>


                    <!-- 달력 - 주간 미니 달력 (Weekly) 시작 ----------------------------------------------------->
                    <div class="row row-cols-1" id="weekly">
                       	<div class="date-wrap">
                      			<div class="button_wrap">
                      				<button type="button" class="btn" id="week-prev" class="week-move" data-weekly="2023-03-19"> < </button>
                      				<span id="week-this">2023.03 - 5주차</span>
                      				<button type="button" class="btn" id="week-next" class="week-move" data-weekly="2023-04-02"> > </button>
                      			</div>
                       		<div class="table-responsive-sm">
	                        	<table class="table date-week">
	                        		<thead class="theadcolor">
	                        			<tr>
	                        				<td>일</td>
	                        				<td>월</td>
	                        				<td>화</td>
	                        				<td>수</td>
	                        				<td>목</td>
	                        				<td>금</td>
	                        				<td>토</td>
	                        			</tr>
	                        		</thead>
	                        		<tbody id="tbl_week">
	                        			<tr>
	                        				<!-- 일요일 --> <td class="sun">26</td>
	                        				<!-- 월요일 --> <td class="">27</td>
	                        				<!-- 화요일 --> <td class="">28</td>
	                        				<!-- 수요일 --> <td class="">29</td>
	                        				<!-- 목요일 --> <td class="">30</td>
	                        				<!-- 금요일 --> <td class="">31</td>
	                        				<!-- 토요일 --> <td class="">1</td>
	                        			</tr>
	                        			<tr>
	                        				<!-- 일요일 --> <td class=""></td> 
	                        				<!-- 월요일 --> <td class="">13:00 김철수</td>
	                        				<!-- 화요일 --> <td class="">15:00 최성은<br>17:00 김혁준<br>21:00 이영희</td>
	                        				<!-- 수요일 --> <td class=""></td>
	                        				<!-- 목요일 --> <td class="">11:00 박수정<br>15:00 최성은<br>17:00 김혁준<br>19:00 이 한 <br>21:00 이영희</td>
	                        				<!-- 금요일 --> <td class="">20:00 문지훈</td>
	                        				<!-- 토요일 --> <td class=""></td>
	                        			</tr>
	                        		</tbody>
	                        	</table>
                       		</div>	
                       	</div>
					</div>
					<!-- 달력 - 주간 미니 달력 (Weekly) 끝 -->
				
				
                    <!-- 그래프 및 미니 공지사항 영역 시작 ----------------------------------------------------------->
                    <div class="row">

                        <!-- 그래프 시작 ----------------------------------------------------------------------------->
                        <div class="col-xl-6 col-lg-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 PT 현황 요약</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 그래프 끝 -->

 						<!-- 공지사항 시작 -------------------------------------------------------------------------->
	                    <div class="col-lg-5 mb-5">
	                        <div class="card shadow mb-4">
	                            <div class="card-header py-3">
	                                <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
	                            </div>
	                            <div class="card-body">
	                            	<table class="table2">
	                            		<thead class="theadcolor">
	                            			<tr>
	                            				<td>No.</td>
	                            				<td>제목</td>
	                            			</tr>
	                            		</thead>
	                            		<tbody>
	                            			<tr>
	                            				<td>1</td>
	                            				<td>3월 휴무 안내</td>
	                            			</tr>
	                            			<tr>
	                            				<td>2</td>
	                            				<td>코로나 방역 대책 변경 안내</td>
	                            			</tr>
	                            		</tbody>
	                            	</table>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 공지사항 끝 -->
	                    
                    </div>
            		<!-- 그래프 및 미니 공지사항 영역 끝 -->
            


            
<%-- 사용하실때 풀어요! <%@ include file="../includes/footer.jsp" %> --%>