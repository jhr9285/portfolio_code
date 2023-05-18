<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
    
<%--  사용하실때 풀어요! <%@ include file="../includes/header.jsp" %> --%>


					<!-- 스케줄 페이지 시작 ------------------------------------------------------------------------>
                   <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">SCHEDULE</h1>
                   </div>


                    <!-- 달력 - 월간 달력 (Monthly) 시작 ----------------------------------------------------->
                    <div class="row row-cols-1" id="monthly">
                       	<div class="month-wrap">
                      			<div class="button_wrap">
                      				<button type="button" class="btn" id="month-prev" class="month-move" data-monthly="2023-02-01"> < </button>
                      				<span id="month-this">2023년 3월 </span>
                      				<button type="button" class="btn" id="month-next" class="month-move" data-monthly="2023-04-01"> > </button>
                      			</div>
                       		<div class="table-responsive-sm">
	                        	<table class="table date-month">
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
	                        		<tbody id="tbl_month">
	                        			<tr> <!-- 첫째주 -->
	                        				<!-- 일요일 --> <td class="sun"> </td>
	                        				<!-- 월요일 --> <td class=""> </td>
	                        				<!-- 화요일 --> <td class=""> </td>
	                        				<!-- 수요일 --> <td class="sun">1</td>
	                        				<!-- 목요일 --> <td class="">2</td>
	                        				<!-- 금요일 --> <td class="">3</td>
	                        				<!-- 토요일 --> <td class="">4</td>
	                        			</tr>
	                        			<tr> <!-- 둘째주 -->
	                        				<!-- 일요일 --> <td class="sun">5</td> 
	                        				<!-- 월요일 --> <td class="">6</td>
	                        				<!-- 화요일 --> <td class="">7</td>
	                        				<!-- 수요일 --> <td class="">8</td>
	                        				<!-- 목요일 --> <td class="">9</td>
	                        				<!-- 금요일 --> <td class="">10</td>
	                        				<!-- 토요일 --> <td class="">11</td>
	                        			</tr>
	                        			<tr> <!-- 셋째주 -->
	                        				<!-- 일요일 --> <td class="sun">12</td> 
	                        				<!-- 월요일 --> <td class="">13</td>
	                        				<!-- 화요일 --> <td class="">14</td>
	                        				<!-- 수요일 --> <td class="">15</td>
	                        				<!-- 목요일 --> <td class="">16</td>
	                        				<!-- 금요일 --> <td class="">17</td>
	                        				<!-- 토요일 --> <td class="">18</td>
	                        			</tr>
	                        			<tr> <!-- 넷째주 -->
	                        				<!-- 일요일 --> <td class="sun">19</td> 
	                        				<!-- 월요일 --> <td class="">20</td>
	                        				<!-- 화요일 --> <td class="">21</td>
	                        				<!-- 수요일 --> <td class="">22</td>
	                        				<!-- 목요일 --> <td class="">23</td>
	                        				<!-- 금요일 --> <td class="">24</td>
	                        				<!-- 토요일 --> <td class="">25</td>
	                        			</tr>
	                        			<tr> <!-- 다섯째주 -->
	                        				<!-- 일요일 --> <td class="sun">26</td> 
	                        				<!-- 월요일 --> <td class="">27</td>
	                        				<!-- 화요일 --> <td class="">28</td>
	                        				<!-- 수요일 --> <td class="">29</td>
	                        				<!-- 목요일 --> <td class="">30</td>
	                        				<!-- 금요일 --> <td class="">31</td>
	                        				<!-- 토요일 --> <td class=""> </td>
	                        			</tr>
	                        		</tbody>
	                        	</table>
                       		</div>	
                       	</div>
					</div>
            		<!-- 달력 - 월간 달력 (Monthly) 끝 -->


            
<%-- 사용하실때 풀어요! <%@ include file="../includes/footer.jsp" %> --%>