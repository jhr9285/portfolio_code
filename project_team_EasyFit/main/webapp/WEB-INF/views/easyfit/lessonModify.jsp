<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="../includes/header.jsp" %>

<script>
	var ergroupNo = 0;
</script>

    
    				<!-- 운동일자, 작성일자, 회원이름 시작  -------------------------------------------------->
					<div class="d-sm-flex align-items-center justify-content-between mb-3 h7 ml-2">
						<div>
							<label class="text-gray-800">운동일자 : </label>
							<input type="date" id="edate" class="box2 width-60 h7 px-2" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${vo[0].edate}" />'>
						</div>
 						<div>
							<label class="text-gray-800">작성일자 : </label>
							<input type="text" id="erdate" class="box2 width-40 h7" readonly>
						</div>
					</div>
					
					<div>
						<div class="mb-3">
							<input type="text" id="mname" value="${vo[0].mname}" class="text-center box2 width-10" readonly>
							<label class="text-gray-800 h6 ml-1">
								   회원님 운동일지
							</label>
						</div>
					</div>
					<!-- 운동일자, 작성일자, 회원이름 끝 -->
				
				
					<!-- 운동내역 수정 시작 --------------------------------------->
					<div class="card shadow mb-4">
						<div class="card-body px-5 py-4 mt-2">
							<div id="exerciseRecordRepeat">
								<c:forEach items="${vo}" var="voVar" varStatus="status">
									<c:if test="${vo[status.index-1].ergroup ne vo[status.index].ergroup}">
										<div class="row m-0 exerciseRecordColumn">
											<div class="align-items-center col-lg-12 p-0 m-0">
												<div class="h7 mb-0 text-gray-800 font-weight-bold my-2 ename">
													<!-- 운동 수정 버튼 -->
													<button type="button" class="btn h8 cbtn pl-1 pr-0"><i class="fas fa-edit"></i></button>
													<span class="ergroup">${vo[status.index].ergroup}</span>번 운동 : <input type="text" class="box3 newEname" value="${vo[status.index].ename}" readonly >
												</div>
												<script>
													ergroupNo = ${vo[status.index].ergroup};
												</script>
												<div class="row p-0 m-0">	
													<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">세트</div>
													<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">무게(kg)</div>
													<div class="box text-center col-lg-2 p-0 m-0 h8 text-gray-800 bg-light">횟수</div>
													<div class="box text-center col-lg-4 p-0 m-0 h8 text-gray-800 bg-light">코멘트</div>
													<div class="text-center col-lg-2 p-0 my-0"></div>
												</div> 
											</div>
										</div>
									</c:if>										
										<form role="form" action="/easyfit/lessonModify" method="post" class="m-0 exerciseRecordRow">
											<div class="row m-0">
												<input type="hidden" name="prno" value="${voVar.prno}">
												<input type="hidden" name="ergroup" value="">
												<input type="hidden" name="edate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${voVar.edate}" />'>
												<input type="hidden" name="erno" value="${voVar.erno}">
												<input type="hidden" name="eno" value="${voVar.eno}">
												<input type="text" name="erset" class="box text-center col-lg-2 m-0 h8 erset" value="${voVar.erset}">
												<input type="text" name="erweight" class="box text-center col-lg-2 m-0 h8 erweight" value="${voVar.erweight}">
												<input type="text" name="ernumber" class="box text-center col-lg-2 m-0 h8 ernumber" value="${voVar.ernumber}">
												<textarea name="ermemo" class="box lh-150 text-left col-lg-4 m-0 h8 ermemo">${voVar.ermemo}</textarea> 
												<div class="text-left col-lg-2 d-inline-block p-0 ml-2">
													<button type="button" class="btn btn-outline-dark ml-2 mb-0 mt-2 h6 pbtn"> + </button>
													<button type="button" class="btn btn-outline-dark ml-2 mb-0 mt-2 h6 mbtn"> - </button>
												</div>
																				
												<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
												<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
												<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
											</div>
										</form>	
								</c:forEach>
							</div>
							
							<div class="col-lg-10 mt-4">
								<button type="button" id="exerciseAddBtn" class="col-lg-12 btn btn-dark">운동 추가</button>
							</div>

							<div class="mt-4 mr-5 float-right">
								<button type="button" class="d-sm-inline-block btn btn-success shadow-sm btn-width pt-1" data-oper="back">
									<span class="fas fa-sm text-white h8">Back</span>
								</button>
								<span>&nbsp;</span>
								<button type="button" class="d-sm-inline-block btn btn-primary shadow-sm btn-width-lg pt-1" data-oper="modify">
									<span class="fas fa-sm text-white h8">수정 완료</span>
								</button>
							</div>
						</div>			
					</div>
					<!-- 운동내역 수정 끝 -->
					
			
					
				<!-- 모달 시작 ----------------------------------------------------------------->
				<div class="modal fade" id="lessonModifyModal" tabindex="-1" role="dialog"
					 aria-labelledby="lessonModifyModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="lessonModifyModalLabel">알림</h4>
							</div>
							<div class="modal-body">수정이 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default close" data-dismiss="modal" id="lessonModifyModalCloseBtn">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝-->
					
					
 				<!-- 운동종목 모달 시작 ---------------------------------------------------------------------------------->
	            <div class="modal fade" id="exerciseTypeModal" tabindex="-1" role="dialog"
	            	 aria-labelledby="exerciseTypeModalLabel" aria-hidden="true">
	            
	            	<div class="modal-dialog max-width-800">
	            		<div class="modal-content">
	            			<div class="modal-header">
	            				<h4 class="modal-title ml-2" id="exerciseTypeModalLabel">운동 선택</h4>
	            				<button type="button" class="close mr-2" data-dismiss="modal" aria-hidden="true">&times;</button>
	            			</div>
	            			<div class="modal-body mb-2 center">
								<form id='exerciseTypeChoiceForm' action="/exercisetype" method='get'>
									<div class="col-lg-11 ml-4">
										<div class="row p-0 mb-3">
												<button type="button" class="col btn btn-lg btn-white px-0"></button>
												<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="D">가슴</button>
												<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="E">하체</button>
												<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="F">등</button>
												<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="G">어깨</button>
												<button type="button" class="col btn btn-lg btn-white px-0 exerciseTypeLargeGroup" data-type="H">팔</button>
										</div>
										<div class="row p-1">
											<div class="col-lg-2 d-inline-block">
												<button type="button" class="btn btn-lg btn-white mb-4 ml-1 exerciseTypeMediumGroup d-none" data-type="W">바벨</button>
												<button type="button" class="btn btn-lg btn-white mb-4 ml-1 exerciseTypeMediumGroup d-none" data-type="X">덤벨</button>
												<button type="button" class="btn btn-lg btn-white mb-4 ml-1 exerciseTypeMediumGroup d-none" data-type="Y">기구</button>
												<button type="button" class="btn btn-lg btn-white ml-1 exerciseTypeMediumGroup d-none" data-type="Z">맨몸</button>
											</div>
											<div class="col-lg-10 d-inline-block modal-scroll">
											</div>
										</div>
									</div>
								</form>
	            			</div>
	            			<div class="modal-footer">
								<div class="col-lg-12">
									<span class="col-lg-12 h7 p-1 mb-2 text-black">선택한 운동 목록</span>
									<div class="col-lg-10 mt-2" id="exerciseTypeChoiceList"></div>
								</div>
		            			<button type="button" id="exerciseTypeSaveBtn" class="btn btn-primary btn-width float-right">등록</button>
		            			<button type="button" id="exerciseTypeChangeBtn" class="btn btn-success btn-width float-right">수정</button>
	            			</div>
	            		</div>
	            	</div>
	            </div> 
          		<!-- 운동종목 모달 끝 -->
				
				

<script type="text/javascript">
	$(document).ready(function() {
		
		var url = location.search;
		var url2 = url.substring(1);
		var url3 = url2.split("&");
		var url4 = url3[0].split("=");
		var url5 = url3[1].split("=");
		var prnoValue = url4[1];
		var edateValue = url5[1];
		
		// csrf
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
		
		/* 작성일자에 오늘 날짜 띄우기 **********************************/
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		
		$("#erdate").val(year + "-" + month + "-" + day);
		
	
		/* Back 버튼 클릭 이벤트 **********************************/
		$("button[data-oper='back']").on("click", function(){
			
			history.back();
		});

		/* 수정 완료 버튼 클릭 이벤트 **********************************/
		$("button[data-oper='modify']").on("click", function(){
			
			$.each($(".exerciseModifyRegister"), function(i, value) {
				
				var object = {
					
					prno: $(value).find("div").find("input[name='prno']").val(),
					ergroup: $(value).find("div").find("input[name='ergroup']").val(),
					erno: $(value).find("div").find("input[name='erno']").val(),
					eno: $(value).find("div").find("input[name='eno']").val(),
					erset: $(value).find("div").find("input[name='erset']").val(),
					erweight: $(value).find("div").find("input[name='erweight']").val(),
					ernumber: $(value).find("div").find("input[name='ernumber']").val(),
					ermemo: $(value).find("div").find("textarea[name='ermemo']").val(),
					edate: $(value).find("div").find("input[name='edate']").val()

				};
				
			 	$.ajax({
					url: "/easyfit/lessonModifyRegister?tno=<sec:authentication property='principal.trainerVO.tno'/>",
					data: JSON.stringify(object),
					contentType: "application/json; charset=utf-8",
					type: "post",
					beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success: function(data) {
						
					},
					error: function(xhr, status) {
						alert(xhr + " : " + status);
					}
				});
			});
			
			$("#lessonModifyModal").modal("show");
			
			$("#lessonModifyModalCloseBtn").on("click", function() {
				location.href="/easyfit/lessonGet?prno=" + prnoValue + "&edate=" + $("input[name='edate']").eq(0).val() + "&tno=<sec:authentication property='principal.trainerVO.tno'/>";
			});
		}); 
		
		
		/* 운동일자 수정 체인지(focusout) 이벤트 *************************************/
		$("#edate").on("change", function() {
			
			$("input[name='edate']").val($("#edate").val());
			
			$.each($(".exerciseRecordRow"), function(i, value) {
				
				var object = {
						
					prno: $(value).find("div").find("input[name='prno']").val(),
					ergroup: $(value).find("div").find("input[name='ergroup']").val(),
					erno: $(value).find("div").find("input[name='erno']").val(),
					eno: $(value).find("div").find("input[name='eno']").val(),
					erset: $(value).find("div").find("input[name='erset']").val(),
					erweight: $(value).find("div").find("input[name='erweight']").val(),
					ernumber: $(value).find("div").find("input[name='ernumber']").val(),
					ermemo: $(value).find("div").find("textarea[name='ermemo']").val(),
					edate: $(value).find("div").find("input[name='edate']").val()

				};
				
			 	$.ajax({
					url: "/easyfit/lessonModify?tno=<sec:authentication property='principal.trainerVO.tno'/>",
					data: JSON.stringify(object),
					contentType: "application/json; charset=utf-8",
					type: "post",
					beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success: function(data) {
						
					},
					error: function(xhr, status) {
						alert(xhr + " : " + status);
					}
				});
			});
		});
		
		
		/* 운동내역 수정 체인지(focusout) 이벤트 *************************************/
		$(".erset").on("focusout", function() {
			
			$.each($(".exerciseRecordRow"), function(i, value) {
				
				var object = {
						
					prno: $(value).find("div").find("input[name='prno']").val(),
					ergroup: $(value).find("div").find("input[name='ergroup']").val(),
					erno: $(value).find("div").find("input[name='erno']").val(),
					eno: $(value).find("div").find("input[name='eno']").val(),
					erset: $(value).find("div").find("input[name='erset']").val(),
					erweight: $(value).find("div").find("input[name='erweight']").val(),
					ernumber: $(value).find("div").find("input[name='ernumber']").val(),
					ermemo: $(value).find("div").find("textarea[name='ermemo']").val(),
					edate: $(value).find("div").find("input[name='edate']").val()

				};
				
			 	$.ajax({
					url: "/easyfit/lessonModify?tno=<sec:authentication property='principal.trainerVO.tno'/>",
					data: JSON.stringify(object),
					contentType: "application/json; charset=utf-8",
					type: "post",
					beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success: function(data) {
						
					},
					error: function(xhr, status) {
						alert(xhr + " : " + status);
					}
				});
			});
			
		});
		
		$(".erweight").on("focusout", function() {
			
			$.each($(".exerciseRecordRow"), function(i, value) {
				
				var object = {
						
					prno: $(value).find("div").find("input[name='prno']").val(),
					ergroup: $(value).find("div").find("input[name='ergroup']").val(),
					erno: $(value).find("div").find("input[name='erno']").val(),
					eno: $(value).find("div").find("input[name='eno']").val(),
					erset: $(value).find("div").find("input[name='erset']").val(),
					erweight: $(value).find("div").find("input[name='erweight']").val(),
					ernumber: $(value).find("div").find("input[name='ernumber']").val(),
					ermemo: $(value).find("div").find("textarea[name='ermemo']").val(),
					edate: $(value).find("div").find("input[name='edate']").val()

				};
				
			 	$.ajax({
					url: "/easyfit/lessonModify?tno=<sec:authentication property='principal.trainerVO.tno'/>",
					data: JSON.stringify(object),
					contentType: "application/json; charset=utf-8",
					type: "post",
					beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success: function(data) {
						
					},
					error: function(xhr, status) {
						alert(xhr + " : " + status);
					}
				});
			});
			
		});
		
		$(".ernumber").on("focusout", function() {
			
			$.each($(".exerciseRecordRow"), function(i, value) {
				
				var object = {
						
					prno: $(value).find("div").find("input[name='prno']").val(),
					ergroup: $(value).find("div").find("input[name='ergroup']").val(),
					erno: $(value).find("div").find("input[name='erno']").val(),
					eno: $(value).find("div").find("input[name='eno']").val(),
					erset: $(value).find("div").find("input[name='erset']").val(),
					erweight: $(value).find("div").find("input[name='erweight']").val(),
					ernumber: $(value).find("div").find("input[name='ernumber']").val(),
					ermemo: $(value).find("div").find("textarea[name='ermemo']").val(),
					edate: $(value).find("div").find("input[name='edate']").val()

				};
				
			 	$.ajax({
					url: "/easyfit/lessonModify?tno=<sec:authentication property='principal.trainerVO.tno'/>",
					data: JSON.stringify(object),
					contentType: "application/json; charset=utf-8",
					type: "post",
					beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success: function(data) {
						
					},
					error: function(xhr, status) {
						alert(xhr + " : " + status);
					}
				});
			});
		});
		
		$(".ermemo").on("focusout", function() {
			
			$.each($(this).parent().parent(), function(i, value) {
				
				var object = {
						
					prno: $(value).find("div").find("input[name='prno']").val(),
					ergroup: $(value).closest("form").prev("div").find("div").find("div").find("span").val(),
					erno: $(value).find("div").find("input[name='erno']").val(),
					eno: $(value).find("div").find("input[name='eno']").val(),
					erset: $(value).find("div").find("input[name='erset']").val(),
					erweight: $(value).find("div").find("input[name='erweight']").val(),
					ernumber: $(value).find("div").find("input[name='ernumber']").val(),
					ermemo: $(value).find("div").find("textarea[name='ermemo']").val(),
					edate: $(value).find("div").find("input[name='edate']").val()

				};
				
				console.log("ermemo : " + object);
				
			 	$.ajax({
					url: "/easyfit/lessonModify?tno=<sec:authentication property='principal.trainerVO.tno'/>",
					data: JSON.stringify(object),
					contentType: "application/json; charset=utf-8",
					type: "post",
					beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success: function(data) {
						
					},
					error: function(xhr, status) {
						alert(xhr + " : " + status);
					}
				});
			});
		});
		
		
		/* 운동종목 모달 관련 변수 선언 *********************************/
 		var modal = $("#exerciseTypeModal");
		var modalSaveBtn = $('#exerciseTypeSaveBtn');
		var modalChangeBtn = $('#exerciseTypeChangeBtn');
		
		var split = [];
		var ename = [];
		var enameValue = [];
		
		/* 운동 추가 버튼 클릭 이벤트 ***********************************/
		$("#exerciseAddBtn").on("click", function() {
			
			modalChangeBtn.hide();
			modalSaveBtn.show();
			
 			$.each($(".ename"), function(i, value) {
 				
				var text = $(value).html().trim().split(" : ");
 				split.push(text);
 				
				ename.push(split[i][0]);
				enameValue.push(split[i][1]);
 				
			});
 			
			$(enameValue).each(function(i, enameList) {
				
				var realEname = enameList.substring(enameList.indexOf('value="') + 7, enameList.indexOf('readonly') - 2);
				$("#exerciseTypeChoiceList").append("<div class='d-inline-block bg-dark text-white border rounded p-2 h8'>" + realEname + "</div>");
			}); 

			modal.modal("show");
		});

		
		/* 운동종목 클릭 이벤트 ********************************************/
		var type = "";
		var saveType = "";
		var str = "";

		
  		$(".exerciseTypeLargeGroup").on("click", function() {
  			
  			saveType = "";
  			$(".modal-scroll").find("div").remove();
  			
			type = $(this).data("type");
			saveType = type;
		
			console.log("saveType(l) : " + saveType);
			
			$.getJSON("/exercisetype/" + saveType + ".json", function(data) { 
				
				$(".exerciseTypeMediumGroup").removeClass("d-none");
				
				$.each(data, function(i, item) {
					str += "<button type='button' class='col btn btn-lg btn-white exerciseTypeSmallGroup'>" + item.ename + "</button>"; 
				});
				
				$(".modal-scroll").append(str);
				
			}).fail(function(xhr, status, err) {
				if(error) { error(); }
			});
			
		});
  		
  		
		$(".exerciseTypeMediumGroup").on("click", function() {
			
			type = $(this).data("type");
			saveType += type;
			
			console.log("saveType(m) : " + saveType);
			
			$.getJSON("/exercisetype/" + saveType + ".json", function(data) {
				
				$(".modal-scroll").children().remove();
				str = "";
				
				$.each(data, function(i, item) {
					str += "<button type='button' class='col btn btn-lg btn-white exerciseTypeSmallGroup'>" + item.ename + "</button>"; 
				});
				
				$(".modal-scroll").append(str);
				
			}).fail(function(xhr, status, err) { 
				if(error) { error(); }
				
			});
		});
		
		
		var chosenExerciseTypeValue = [];
		
		$(".modal-scroll").on("click", "button", function() {
			
			$("#exerciseTypeChoiceList").append("<div class='d-inline-block bg-dark text-white border rounded p-2 h8 append-bg-dark'>" + $(this).html() + "</div>");
			
			chosenExerciseTypeValue.push($(this).html());
			
			$(".exerciseTypeMediumGroup").addClass("d-none");
			
			$(".modal-scroll").children().remove();
			
			str = "";
			
		});
		
		/* 운동종목 저장(등록) 버튼 클릭 이벤트 (모달에 있는 데이터를 register input 태그로 이동) **********************************/
		modalSaveBtn.on("click", function() {

			$.each(chosenExerciseTypeValue, function(i, value) {
	
				var exerciseRecordColumn = $(".exerciseRecordColumn").eq(0).clone();
				var exerciseRecordRow = $(".exerciseRecordRow").eq(0).clone();
				
				ergroupNo++;
				
				exerciseRecordColumn.find(".ergroup").html(ergroupNo);
				exerciseRecordColumn.find(".newEname").val(value);
				exerciseRecordRow.addClass("exerciseModifyRegister");
				
				exerciseRecordRow.find("input[name='ergroup']").val(ergroupNo);
				exerciseRecordRow.find("input[name='erweight']").val("");
				exerciseRecordRow.find("input[name='ernumber']").val("");
				exerciseRecordRow.find("textarea[name='ermemo']").val("");

				
				$.getJSON("/exercisetype/eno/" + value + ".json", function(data) {
					
					exerciseRecordRow.find("input[name='eno']").val(data.eno);
					
				}).fail(function(xhr, status, err) { 
					
					if(error) { error(); }
					
				});
			
				
				$("#exerciseRecordRepeat").append(exerciseRecordColumn);
				$("#exerciseRecordRepeat").append(exerciseRecordRow);

			});
			
			modal.modal("hide");  
		});
		
		
		
		/* 행 추가(+)/삭제(-) 버튼 클릭 이벤트 **********************************/
		$(document).on("click", ".pbtn", function() {
			
			var plusForm = $(this).closest("form").clone();
			plusForm.find("input[name='erset']").val(parseInt($(this).closest("form").find("input[name='erset']").val()) + 1);
			
			var ergroupNum = $(this).closest("form").siblings(".exerciseRecordColumn").find("div > div > span").html();
			plusForm.find("input[name='ergroup']").val(ergroupNum);
			
			plusForm.addClass("exerciseModifyRegister");
			
			$(this).closest("form").after(plusForm);
		});
		
		$(document).on("click", ".mbtn", function() {
			 
			if($(this).parent().parent().find(".erset").val() == 1 && $(this).closest("form").prev().attr("class", "exerciseRecordColumn")) {
				alert("1세트는 삭제할 수 없습니다.")
				return;
			}
			$(this).closest("form").remove();
		});

		
		/* 운동 수정 관련 변수 선언 ************************************/
		var changeEname = null;
		
		/* 운동 수정 버튼 클릭 이벤트 **********************************/
		$(document).on("click", ".cbtn", function() {
			
			changeEname = $(this).siblings(".newEname");
			console.log("changeEname : " + changeEname.val());
			modalSaveBtn.hide();
			modalChangeBtn.show();
			modal.modal("show");
		});
		
		/* 운동종목 수정 버튼 클릭 이벤트 (모달에 있는 데이터를 register input 태그로 이동) **********************************/
		modalChangeBtn.on("click", function() {

			$.each(chosenExerciseTypeValue, function(i, value) {
				
				console.log("value : " + value);
				
				$.getJSON("/exercisetype/eno/" + value + ".json", function(data) {
				
					changeEname.val(value);
					console.log("changeEname2 : " + changeEname.val());
					
					console.log("Data : " + data.eno);
					
					changeEname.parent().parent().parent().next("form[role='form']").find("div").find("input[name='eno']").val(data.eno);
					
					console.log("check : " + changeEname.parent().parent().parent().next("form[role='form']").find("div").find("input[name='eno']").val());
					console.log("check : " + changeEname.val());
					
					
					/* eno update 적용 코드 */
					var object = {
							
						ergroup: changeEname.prev("span").html(),
						edate: changeEname.parent().parent().parent().next("form[role='form']").find("div").find("input[name='edate']").val(),
						eno: data.eno

					};
					
					console.log("object : " + JSON.stringify(object));
					
				 	$.ajax({
						url: "/easyfit/lessonModifyEno?tno=<sec:authentication property='principal.trainerVO.tno'/>",
						data: JSON.stringify(object),
						contentType: "application/json; charset=utf-8",
						type: "post",
						beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						success: function(data) {
							
						},
						error: function(xhr, status) {
							alert(xhr + " : " + status);
						}
					});
					
				 	
				}).fail(function(xhr, status, err) { 
					
					if(error) { error(); }
					
				});
			
			});
			
			modal.modal("hide");  
		});
		
	});
</script>					
<%@ include file="../includes/footer.jsp" %>				