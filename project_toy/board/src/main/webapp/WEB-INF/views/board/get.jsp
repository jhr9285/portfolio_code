<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@ include file="../includes/header.jsp" %>

<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bp {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bpc {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
.bpc img {
  width:600px;
}
</style>

           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">Board Read Page</div>
                        <!-- /.panel-heading -->
						<div class="panel-body">
						
							<!-- BoardController의 get 메소드로 반환된 데이터를 board.~로 호출, input 태그 안에 읽기전용으로 호출 -->
							<div class="form-group">
								<label>Bno</label>
								<input class="form-control" name="bno"
									   value='<c:out value="${ board.bno }"/>' readonly />
							</div>
							
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title"
									   value='<c:out value="${ board.title }"/>' readonly />
							</div>
							
							<div class="form-group">
								<label>Text Area</label>
								<textarea class="form-control" rows="3" name="content" readonly> 
										 <c:out value="${ board.content }"/></textarea>
							</div>
							
							<div class="form-group">
								<label>Writer</label>
								<input class="form-control" name="writer"
									   value='<c:out value="${ board.writer }"/>' readonly />
							</div>

							
				            <!-- attachFile list start ------------------------------------------------------------>
				            <div class="row">
				            	<div class="col-lg-12">
				            		<div class="panel panel-default">
				            		
				            			<div class="panel-heading">Files</div>
				            			<!-- /.panel-heading -->
				            			<div class="panel-body">
				            			<!-- Quiz230307 - 1. 게시판 상세보기에서 썸네일 이미지를 누르면 모달창에 원본 이미지 보이게 하기 -->
									  		<div class="modal fade" id="bp" role="dialog">
									  			<div class="modal-dialog">
									  				<div class="modal-content">
											  			<div class="modal-body" id="bpc"></div>
									  				</div>
									  			</div>
									  		</div>
				           					<div class="uploadResult">
				           						<ul></ul>
				           					</div>
				            			</div>
				            			<!--  /.panel-body -->
				            		</div>
				            		<!--  /.panel -->
				            	</div>
				            	<!--  /.col-lg-12 -->
				            </div>
				            <!--  /.row--> <!-- attachFile list end -->
							
							<!-- spring security 태그 -->
							<sec:authentication property="principal" var="pinfo" />
								<sec:authorize access="isAuthenticated()"> <!-- 로그인 되었는지 검사 -->
									<c:if test="${pinfo.username eq board.writer}"> <!-- 로그인 ID와 작성자가 일치하는지 확인 -->
										<button data-oper="modify" class="btn btn-default">Modify</button>
									</c:if>
								</sec:authorize>
								
							<button data-oper='list' class="btn btn-info">List</button>
							
							<form id='operForm' action="/board/modify" method="get">
								<input type='hidden' id='bno' name='bno' value='<c:out value="${ board.bno }"/>'>
								<input type='hidden' name='pageNum' value='<c:out value="${ cri.pageNum }"/>'>
								<input type='hidden' name='amount' value='<c:out value="${ cri.amount }"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${ cri.keyword }"/>'>
								<input type='hidden' name='type' value='<c:out value="${ cri.type }"/>'>
							</form>
								
						</div>
						<!-- /#panel-body -->
                     </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
           
            
            <!-- reply start ---------------------------------------------------------------------->
            <div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
            		
            			<div class="panel-heading">
            				<i class="fa fa-comments fa-fw"></i> Reply <b>[ <c:out value="${board.replyCnt}" /> ]</b>
            				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
            			</div>
            			<!-- /.panel-heading -->
            			
            			<div class="panel-body">
            			
            				<ul class="chat">
            				
            				</ul>
            				 <!-- ./ end ul -->
            			</div>
            			<!-- /.panel .chat-panel -->
            			
            		<div class="panel-footer"></div>
            		
            		</div>
            		
            	</div>
            	<!-- ./ end row -->
            </div>
            
            <!-- Modal ---------------------------------------------------------------------------------->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            	aria-labelledby="myModalLabel" aria-hidden="true">
            
            	<div class="modal-dialog">
            		<div class="modal-content">
            			<div class="modal-header">
            				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            			</div>
            			<div class="modal-body">
            				<div class="form-group">
            					<label>Reply</label>
            					<input class="form-control" name='reply' value='New Reply!!!!'>
            				</div>
            				<div class="form-group">
            					<label>Replyer</label>
            					<input class='form-control' name='replyer'  readonly='readonly' >
            				</div>
            				<div class="form-group">
            					<label>Reply Date</label>
            					<input class="form-control" name='replyDate' value='2018-01-01 13:13'>
            				</div>
            			</div>
            			<div class="modal-footer">
            				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            				<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
            				<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            			</div>
            		</div>
            		<!-- /.modal-content -->
            	</div>
            	<!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            
            
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	$(document).ready(function() {
		
		var bnoValue = '<c:out value="${board.bno}" />'; // 부모글 번호
		var replyUL = $(".chat"); // 댓글목록 감싸는 ul 태그
		
		showList(1);
		
		/* reply 목록 페이징 처리해서 보여주는 함수 */
		function showList(page) {
			console.log("show list " + page);
			
			// 첫 번째 파라미터 {} : 데이터, 두 번째 파라미터 function : 성공했을 때 처리하는 함수
			replyService.getList({bno: bnoValue, page: page || 1 }, function(replyCnt, list) {
				
				console.log("replyCnt: " + replyCnt);
				console.log("list: " + list);
				console.log(list);
				
				if(page == -1) {
					pageNum = Math.ceil(replyCnt / 10.0);
					showList(pageNum);
					return;
				}
				
				var str = '';
				
				if(list == null || list.length == 0) {
					return;
				}
		        
				// for문 사용하여 ul 태그 안에 li 태그 추가 (li 태그 : 댓글)
				for(var i = 0, len = list.length || 0; i < len; i++) {
					str += "<li class='left clearfix' style='cursor: pointer;' data-rno='" + list[i].rno + "'>";
					str += "	<div><div class='header'><strong class='primary-font'>[" 
						+ list[i].rno + "] " + list[i].replyer + "</strong>";
					str += "		<small class='pull-right text-muted'>"
						+ replyService.displayTime(list[i].replyDate) + "</small></div>";
					str += "		<p>" + list[i].reply + "</p></div></li>";
				}
				
				replyUL.html(str);
				
				showReplyPage(replyCnt); // 페이지 번호 만들기
				
			}); // end function
		} // end showList
		
		
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer"); // 페이지 번호, prev, next가 구현되는 영역
		
		/* 댓글 목록 페이지 넘버 보여주는 함수 */
		function showReplyPage(replyCnt) {
			// ajax 사용하기 위해 원래 java로 PageDTO에 입력하던 것들을 여기에서 JavaScript로 구현 (startNum, endNum, prev, next)
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1; // startNum이 1이 아니면 true 반환
			var next = false;
			
			if((endNum * 10) >= replyCnt) {
				endNum = Math.ceil(replyCnt / 10.0);
			}
			if((endNum * 10) < replyCnt) {
				next = true; // 페이징 영역 마지막 숫자 * 10 이 댓글수보다 적으면 next를 true로 수정
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev) { // prev가 있으면 Previous 링크 붙임
				str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
			}
			
			for(var i = startNum; i <= endNum; i++) { // startNum부터 endNum까지 li 태그 만들고 그 갯수만큼 출력
				
				var active = pageNum == i ? "active" : "" ; // 현재 페이지에는 active 표시한다는 조건식을 active 변수에 담음
				
				str += "<li class='page-item " + active + " '><a class='page-link' href='" + i +"'>" + i + "</a></li>";
			}
			
			if(next) {
				str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str); // 최종적으로 완성된 str을 replyPageFooter에 붙임
		}
		
		/* pageNum click event */
		replyPageFooter.on("click", "li a", function(e) { // 부모에 이벤트 처리 되어 있지만 실제로는 자식을 클릭했을 때 function 실행.
			e.preventDefault();
			console.log("page click"); 
			
			var targetPageNum = $(this).attr("href"); // replyPageFooter : 부모 / li a : 자식 ==> 부모쪽에 이벤트 처리 위임(delegate)
			
			console.log("targetPageNum : " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		
		/* modal event start ************************************************************/
		var modal = $("#myModal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $('#modalModBtn');
		var modalRemoveBtn = $('#modalRemoveBtn');
		var modalRegisterBtn = $('#modalRegisterBtn');
		
	    var replyer = null;
	    
	    <sec:authorize access="isAuthenticated()">
	    	replyer = '<sec:authentication property="principal.username"/>';   
		</sec:authorize>
		
		
		$('#modalCloseBtn').on("click", function(e) { 
			modal.modal('hide');
		});
		
		/* 
			Quiz230310
			1. 댓글 등록 버튼을 눌렀을 때 로그인 안한 경우 '로그인 후 댓글을 등록해주세요' 출력하기 
			2. 댓글 등록할 때 작성자 이름을 로그인 id가 자동으로 입력되게 하기 
		*/
		
		/* add reply button click event */
		$('#addReplyBtn').on("click", function(e) { // 댓글 등록 버튼 클릭 시 모달창 띄움
			
			var originalReplyer = modalInputReplyer.val();
			
			if(!replyer) { // 로그인이 되지 않은 경우
				
				alert("로그인 후 댓글을 등록해주세요.");
				modal.modal("hide");
				return;
			}
		  	
			<sec:authorize access="isAnonymous()">
	 			self.location = "/customLogin";
  			</sec:authorize>
		
			modal.find('input[name="reply"]').val('');
			modal.find("input[name='replyer']").val(replyer);
			modalInputReplyDate.closest('div').hide(); // 모달창에 여러 기능을 하는 버튼들이 많아서, 하나의 기능을 사용할 때 무관한 버튼들은 숨김
			modal.find('button[id !="modalCloseBtn"]').hide();
			
			modalRegisterBtn.show();
			
			modal.modal('show');
				
		});
		
		/* csrf - 현재 페이지에서 발생하는 모든 ajax 전송 시 헤더에 csrf 토큰 적용(선생님 추천 방식) */
		var csrfHeaderName ="${_csrf.headerName}"; 
    	var csrfTokenValue="${_csrf.token}";
		
		$(document).ajaxSend(function(e, xhr, options) { 
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});

		
		/* reply register button click event */
		modalRegisterBtn.on("click", function(e) {
			
			var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno: bnoValue
			};
			
			replyService.add(reply, function(result){ // replyService : reply.js에 있는 replyService
													  // 파라미터 자리에 function 코딩 ==> 전송되는 것은 그 함수의 레퍼런스 ==> reply.js의 매개변수 callback 으로 전송
				alert(result);
				
				modal.find('input').val('');
				modal.modal('hide');
				
				//showList(1);
				showList(-1);
			});
		});

		/* 
			Quiz230310
			3. 댓글 상세보기에서 자기가 쓴 글만 수정,삭제 버튼 보이게 하기
		*/
		/* view reply click event */
		$(".chat").on("click", "li", function(e) { // 위임(delegate)
			
			var rno = $(this).data("rno"); // data- : 사용자 정의 속성. data- 는 필수 입력값, 이어지는 단어는 사용자 임의로 설정. 이 코드는 data-rno의 값을 불러옴.
			var originalReplyer = modalInputReplyer.val();
			
			replyService.get(rno, function(reply){
				
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rno", reply.rno); // 모달창에 data-rno 속성 생성하여 값 저장하는 코드
				
				modal.find("button[id != 'modalCloseBtn']").hide(); // ★ close 버튼이 아닌 건 모두 숨긴다. (활용하기 좋은 코드)
				
				if(replyer == originalReplyer) { // 작성자와 로그인ID가 다른 경우
					modalModBtn.show(); 	// 숨긴 버튼 중 mod버튼을 보이게 한다.
					modalRemoveBtn.show(); 	// 숨긴 버튼 중 삭제 버튼을 보이게 한다.
				}
					
				$("#myModal").modal("show");
			});
		});
		
		
		/* modal modify button click event */
		modalModBtn.on("click", function(e) {
			
			var originalReplyer = modalInputReplyer.val();

			if(!replyer) { // 로그인이 되지 않은 경우
				alert("로그인 후 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			console.log("Original Replyer: " + originalReplyer);
			
			if(replyer != originalReplyer) { // 작성자와 로그인ID가 다른 경우
				alert("자신이 작성한 댓글만 수정이 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			
			replyService.update(reply, function(result) {
				
				alert(result);
				modal.modal("hide");
				showList(pageNum);
				
			});
		});
		
		
		/* modal delete button click event */
		modalRemoveBtn.on("click", function(e) {
			
			var rno = modal.data("rno");
			var originalReplyer = modalInputReplyer.val(); // 로그인 인증 위해 추가
			
			console.log("RNO: " + rno);
			console.log("REPLYER: " + replyer);
			console.log("Original Replyer: " + originalReplyer);
			
			if(!replyer) { // 로그인이 되지 않은 경우
				alert("로그인 후 삭제가 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			if(replyer != originalReplyer) { // 작성자와 로그인ID가 다른 경우
				alert("자신이 작성한 댓글만 삭제가 가능합니다.");
				modal.modal("hide");
				return;
			}
			
			
			replyService.remove(rno, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});

	});
</script>	

<script type="text/javascript">
	$(document).ready(function() {	
		
		/* modify button, list button click event start **********************************/
			var operForm = $("#operForm");
			
			$("button[data-oper='modify']").on("click", function(e){
				operForm.attr("action", "/board/modify").submit();											
			});
			
			$("button[data-oper='list']").on("click", function(e){
				operForm.find('#bno').remove();
				operForm.attr("action", "/board/list");
				operForm.submit();
			});
		// end  modify button, list button click event
	});
</script>			

<script type="text/javascript">
	$(document).ready(function() {	
		
		/* attach file event start ********************************************************/
		(function(){
		
			var bno = '<c:out value="${board.bno}"/>';
			
			$.getJSON("/board/getAttachList", {bno: bno}, function(arr) {
				
				console.log("arr:" + arr);
				
				var str = "";
				
				$(arr).each(function(i, attach) {
					
					// image type
					if(attach.fileType) { // attach.fileType이 true면 (=이미지면)
						console.log("attach fileName: " + attach.fileName);
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName); // s_ 붙여서 섬네일 생성
						
						str += "<li style='cursor: pointer;' data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid 
						    + "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
						str += "<img src='/display?fileName=" + fileCallPath + "'></div></li>";
					
					} else { // attach.fileType이 false면 (=이미지가 아닌 파일이면)
						
						str += "<li style='cursor: pointer;' data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid 
					   		+ "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
						str += "<span> " + attach.fileName + "</span><br>";
					   	str += "<img src='/resources/img/attach.png'></div></li>";
					
					}
				});
				
				$(".uploadResult ul").html(str);
				
			}); // end getJSON
		})(); // end attach file event 
		
		// 첨부파일 클릭 이벤트 - 원본 사이즈로 보기 / 다운로드
		$(".uploadResult").on("click", "li", function(e) { // delegate
			
			console.log("view image");
		
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
			
			if(liObj.data("type")) { // liObj의 data-type이 존재하면 (=이미지면)
				showImage(path.replace(new RegExp(/\\/g), "/")); // 크게 보여준다
			} else { // liObj의 data-type이 존재하지 않으면 (=이미지가 아닌 파일이면)
				// download
				self.location = "/download?fileName=" + path; // 다운로드한다
			}
		});
		// end 첨부파일 클릭 이벤트 - 원본 사이즈로 보기 / 다운로드
		
		<!-- Quiz230307 - 1. 게시판 상세보기에서 썸네일 이미지를 누르면 모달창에 원본 이미지 보이게 하기 -->
		// 이미지 보여주는 메소드
		function showImage(fileCallPath) {
		    
		    $("#bpc").append("<img width='100%' height='auto' src='/display?fileName="+fileCallPath+"' >");
		    
		    $(".bpc").css("cursor", "pointer");
		 	
		    $("#bp").modal("show");
		}
		
		// 커진 이미지 닫는 메소드
		  $("#bp").on("click", function(e){
		    
			$("#bpc").find('img').remove();
			  
		    $("#bp").modal("hide");
		    
		  });
		
	});
</script>


            
<%@ include file="../includes/footer.jsp" %>