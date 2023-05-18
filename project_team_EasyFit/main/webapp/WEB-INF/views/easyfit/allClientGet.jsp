<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>

<div class="card-body shadow bg-light">
<!-- 페이지 이름 -->
	<div class="col-lg-4 py-4 d-inline-block ">
		<div class="col-lg-9 align-items-center justify-content-start mb-4 d-inline-block">
			<h1 class="h3 mb-0 text-gray-800">회원 정보</h1>
		</div>
		<form method="post" class="table table-bordered">
			<div class="form-group mt-3">
				<label class="w-25">회원번호 : </label>
				<input class="box" type="number" name="mno" value="${client.mno}" disabled/><br />	
			</div>
			<div class="form-group ">
				<label class="w-25">Email : </label>
				<input class="box" type="text" name="memail" value="${client.memail}" disabled/><br />	
			</div>
			<div class="form-group ">
				<label class="w-25">이름 : </label>
				<input class="box" type="text" name="mname" value="${client.mname}" disabled/><br />	
			</div>
			<div class="form-group ">
				<label class="w-25">가입일 : </label>
				<input class="box" type="text" name="mjoindate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mjoindate}"/>' disabled/><br />
			</div>
			<div class="form-group ">
				<label class="w-25">생년월일 : </label>
				<input class="box" type="text" name="mbirth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${client.mbirth}"/>' disabled/><br />
			</div>
			<div class="form-group ">
				<label class="w-25">주소 : </label>
				<input class="box" type="text" name="maddress" value="${client.maddress}" disabled/><br />
			</div>
		</form>
		<div class="text-right">
			<!-- ↓Parameter 전달을 위한 코드, 절대 수정 금지 ------------------------------------------------------------>		
			<input type="hidden" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" /><br />
			<!-- ↑Parameter 전달을 위한 코드, 절대 수정 금지------------------------------------------------------------->
			<button type="button" class="btn btn-info custom-select-sm btn-width" onclick="location.href = '/easyfit/allClientModify?mno=${client.mno}'">수정</button>
			<button type="button" class="btn btn-danger custom-select-sm btn-width"  onclick="location.href = '/easyfit/allClientRemove?mno=${client.mno}'">삭제</button>
		</div>
	</div>
	<!-- PT 등록 및 이력  ---------------------------------------------------->
	<div class="col-lg-7 d-inline-block float-right mt-5">	
		<div class="align-items-center justify-content-start mb-3 d-inline-block">
			<h4 class="h3 mb-0 text-gray-800">PT 이력</h4>
			<!-- <label>담당 트레이너</label> -->
			<%-- <input type="text" name="tno" value="${ptRecordList.tno}" disabled/><br /> --%>
		</div>
		<table id="ptTable" class="table table-bordered">
			<thead>
				<tr>
					<th class="width-8 bg-light">PT 회차</th>
					<th class="width-25 bg-light">PT 기간</th>
					<th class="width-8 bg-light">PT 진행도</th>
				</tr>
			</thead>		
			
			<tbody>
				<c:forEach items="${ptRecordList}" var="ptRecordList">
					<tr class="chat" data-prno="${ptRecordList.prno}" data-prstartdate="${ptRecordList.prstartdate}" data-prenddate="${ptRecordList.prenddate}">
						<td>${ptRecordList.prturn}</td>
						<td><a href='/easyfit/lessonDetailList?mno=${client.mno}&prno=<c:out value="${ptRecordList.prno}"/>&tno=<sec:authentication property="principal.trainerVO.tno"/>'>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${ptRecordList.prstartdate}" />
									 ~ 
								<fmt:formatDate pattern="yyyy-MM-dd" value="${ptRecordList.prenddate}" />
							</a>
						</td>					
						<td>${ptRecordList.prcount} / ${ptRecordList.prcountall}</td>				
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="page-navigation"></div>
		<div class="float-right mt-4">
			<button id="addPTBtn" type="button" class="btn btn-primary custom-select-sm btn-width" data-toggle="modal" data-target="#ptModal">PT 등록</button>
		</div>
	</div>
</div>		
		

<!-- PT등록 모달 시작 --------------------------------------------------------------------------------------------------------------------------------------->

<div class="modal fade" id="ptModal" tabindex="-1" role="dialog" aria-labelledby="ptModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="ptModalLabel">PT 등록</h5>
				<button type="button" class="close"	data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<!--<div class="form-group">
					<label for="prno">PT등록번호</label>
					<input type="number" class="form-control" id="prno" name="prno">
				</div>-->
				<input type="hidden" name="mno" value="${client.mno}"> <!-- hidden 태그를 사용하여 이전 화면에서 전달된 회원번호를 모달창에서도 사용할 수 있도록 함 -->
				<div class="form-group">
					<label for="mname">회원이름</label>
					<input type="text" class="form-control" name="mname" value="${client.mname}" disabled> 
				</div>
				
				<div class="form-group">
					<label for="tname">담당 트레이너</label>
					<input type="hidden" class="form-control" id="tno" name="tno" value="<sec:authentication property="principal.trainerVO.tno"/>" disabled>
					<input type="text" class="form-control" id="tname" name="tname" value="<sec:authentication property="principal.trainerVO.tname"/>" disabled>
				</div>
				
				<div class="form-group">
					<label for="ptTurn">PT 횟수</label>
					<input type="number" class="form-control" id="ptTurn" name="prturn">
				</div>
				<div class="form-group">
					<label for="ptStartDate">PT 시작일</label>
					<input type="date" class="form-control" id="ptStartDate" name="prstartdate">
				</div>
				<div class="form-group">
					<label for="ptEndDate">PT 종료일</label>
					<input type="date" class="form-control" id="ptEndDate" name="prenddate">
				</div>
				<div class="form-group">
					<label for="ptCount">PT 진행 회차</label>
					<input type="number" class="form-control" id="ptCount" name="prcount">
				</div>
				<div class="form-group">
					<label for="ptCountAll">PT 전체 회차</label>
					<input type="number" class="form-control" id="ptCountAll" name="prcountall">
				</div>
				<div class="form-group">
					<label for="ptMemo">비고</label>
					<input type="text" class="form-control" id="ptMemo" name="prmemo">
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning" data-dismiss="modal">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger" data-dismiss="modal">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary" data-dismiss="modal">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- PT등록 모달 종료 --------------------------------------------------------------------------------------------------------------------------------------->

<script type="text/javascript" src="/resources/js/ptrecord.js"></script><!-- 모달 적용을 위한 JS 파일 -->

<script>
$(document).ready(function() {	
	
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";        
	
$(document).ajaxSend(function(e, xhr, options) { 
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
}); 

	var modal = $(".modal");
    /* var modalInputPrno = modal.find("input[name='prno']"); */
	var mnoValue = '<c:out value="${client.mno}"/>';
    var modalInputTno = modal.find("input[name='tno']");
    var modalInputPrTurn = modal.find("input[name='prturn']");
    var modalInputPrStartDate = modal.find("input[name='prstartdate']");
    var modalInputPrEndDate = modal.find("input[name='prenddate']");
    var modalInputPrCount = modal.find("input[name='prcount']");
    var modalInputPrCountAll = modal.find("input[name='prcountall']");
    
    var addPTBtn = $("#addPTBtn");
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
	
    
    addPTBtn.on("click", function(e){
    	// Add PT 버튼 클릭 시 다른 버튼들 숨기기
	    modalModBtn.hide();
	    modalRemoveBtn.hide();
	    modalRegisterBtn.show();
	    
	    modal.find(modalInputPrTurn).val("");
	    modal.find(modalInputPrStartDate).val("");
	    modal.find(modalInputPrEndDate).val("");
	    modal.find(modalInputPrCount).val(0);
	    modal.find(modalInputPrCountAll).val("");
	    $(".modal").modal("show");
    });
    
    modalRegisterBtn.on("click",function(e){
    e.preventDefault();
    	
	    if ($('#ptTurn').val() === '') {
	        alert('PT 횟수를 입력해주세요.');
	        return false;
	    } 
		if ($('#ptStartDate').val() === '') {
	        alert('PT 시작일을 입력해주세요.');
	        return false;
	    } 
		if ($('#ptEndDate').val() === '') {
	        alert('PT 종료일을 입력해주세요.');
	        return false;
	    } 
		if ($('#ptCount').val() === '') {
	        alert('PT 진행회차을 입력해주세요.');
	        return false;
	    } 
		if ($('#ptCountAll').val() === '') {
	        alert('PT 전체회차를 입력해주세요.');
	        return false;
	    } 
        var ptRecord = {
	        	/* prno: modalInputPrno.val(), */
	            tno:modalInputTno.val(),
	            prturn:modalInputPrTurn.val(),
	            prstartdate:modalInputPrStartDate.val(),
	            prenddate:modalInputPrEndDate.val(),
	            prcount:modalInputPrCount.val(),
	            prcountall:modalInputPrCountAll.val(),
	            mno:mnoValue
            };
        	console.log(ptRecord);
        	// PT 추가
        	ptRecordService.add(ptRecord, function(result){
          
          		alert(result);
          
	          	modal.find("input").val("");
	          	modal.modal("hide");
          
	          	//showList(1);
	          	location.reload();
        	});
        
      });
    // PT 내역 상세보기
    $(".chat").on("click", function(e){
        
        var prno = $(this).data("prno");
        var prstartdate = $(this).data("prstartdate");
        var prenddate = $(this).data("prenddate");
        $(".modal").modal("show");
        
        
  		console.log($(this).data("prno"));
        console.log(prno);
        console.log($(this).data("prstartdate"));
        console.log(prenddate);
    	ptRecordService.get(prno, function(ptRecord){
    		modalInputTno.val(ptRecord.tno);
            modalInputPrTurn.val(ptRecord.prturn);
            modalInputPrStartDate.val(prstartdate);
            modalInputPrEndDate.val(prenddate);
            modalInputPrCount.val(ptRecord.prcount);
            modalInputPrCountAll.val(ptRecord.prcountall);
	    	modal.data("prno", ptRecord.prno);
    		
            
            modal.find("button[id !='modalCloseBtn']").hide();
            modalModBtn.show();
            modalRemoveBtn.show();
            
            
            
            $(".modal").modal("show");
    	});
    });
    
    // PT 내역 수정하기
    modalModBtn.on("click", function(e){
        
        var ptRecord = {prno:modal.data("prno"), 
		        		prturn:modalInputPrTurn.val(),
			            prstartdate:modalInputPrStartDate.val(),
			            prenddate:modalInputPrEndDate.val(),
			            prcount:modalInputPrCount.val(),
			            prcountall:modalInputPrCountAll.val()};
        
        ptRecordService.update(ptRecord, function(result){
              
          alert(result);
          modal.modal("hide");
          location.reload();
          
        });
        
      });
    
    // PT 내역 삭제하기
    modalRemoveBtn.on("click", function (e){
    	  var prno = modal.data("prno");
    	  console.log($(this).data("prno"));
  	  	  console.log(prno);
    	  
    	  ptRecordService.remove(prno, function(result){
    	        
    	      alert(result);
    	      modal.modal("hide");
    	      location.reload();
    	      
    	  });    	  
    });
});
</script>
<script>
$(document).ready(function() {
    var show_per_page = 5;
    var $pt_rows = $("#ptTable tbody tr");
    var number_of_items = $pt_rows.length;
    var number_of_pages = Math.ceil(number_of_items / show_per_page);
    var $navigation = $('<ul class="pagination justify-content-center"></ul>');
    for (var page = 1; page <= number_of_pages; page++) {
        $navigation.append('<li class="page-item"><a href="javascript:void(0);" class="page-link" data-page="' + page + '">' + page + '</a></li>');
    }
    $("#page-navigation").html($navigation);
	
    // 첫 번째 페이지에 대한 행들만 보여주기
    var start_index = 0;
    var end_index = start_index + show_per_page;
    $pt_rows.hide().slice(start_index, end_index).show();

    // 페이지 버튼 클릭 시 해당 페이지에 대한 행들 보여주기
    $navigation.on("click", "a", function() {
        var page_number = $(this).data("page");
        var start_index = (page_number - 1) * show_per_page;
        var end_index = start_index + show_per_page;
        $pt_rows.hide().slice(start_index, end_index).show();
    });
});
</script>
<%@ include file="../includes/footer.jsp" %>