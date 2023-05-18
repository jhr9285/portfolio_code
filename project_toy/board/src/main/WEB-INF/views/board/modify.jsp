<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@ include file="../includes/header.jsp" %>

<style>
.uploadResult { 
	width:100%;
	height:200px; 
	background-color:lightgray;
	color: white!important;
}
.uploadResult ul {
	display: flex;
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
  float: left;
}
.loader { /* 로더(로딩 바) CSS */
  display: none;
  border: 12px solid #f1f1f1;
  border-radius: 50%;
  border-top: 12px solid #3498db;
  width: 100px;
  height: 100px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
  float: none;
  margin: auto;
  position: relative;
  top: 45px;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

</style>

           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">Board Modify</div>
                        <!-- /.panel-heading -->
						<div class="panel-body">
						
							<form role="form" action="/board/modify" method="post">
								
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
								
								<input type='hidden' name='bno' value='<c:out value="${ board.bno }"/>'>
								<input type='hidden' name='pageNum' value='<c:out value="${ cri.pageNum }"/>'>
								<input type='hidden' name='amount' value='<c:out value="${ cri.amount }"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${ cri.keyword }"/>'>
								<input type='hidden' name='type' value='<c:out value="${ cri.type }"/>'> 
						
								<div class="form-group">
									<label>Bno</label>
									<input class="form-control" name="bno"
										   value='<c:out value="${ board.bno }"/>' readonly />
								</div>
								
								<div class="form-group">
									<label>Title</label>
									<input class="form-control" name="title"
										   value='<c:out value="${ board.title }"/>' />
								</div>
								
								<div class="form-group">
									<label>Text Area</label>
									<textarea class="form-control" rows="3" name="content"> 
											  <c:out value="${ board.content }"/></textarea>
								</div>
								
								<div class="form-group">
									<label>Writer</label>
									<input class="form-control" name="writer"
										   value='<c:out value="${ board.writer }"/>' readonly />
								</div>
								
								<div class="form-group">
									<label>RegDate</label>
									<input class="form-control" name="regDate"
										   value='<fmt:formatDate pattern="yyyy/MM/dd" value="${ board.regdate }" />' readonly />
								</div>
								
								<div class="form-group">
									<label>Update Date</label>
									<input class="form-control" name="updateDate"
										   value='<fmt:formatDate pattern="yyyy/MM/dd" value="${ board.updatedate }" />' readonly />
								</div>
								           
					     		<!-- attach file ------------------------------------------------------->
					        	<div class="row">
					        		<div class="col-lg-12">
					        			<div class="panel panel-default">
					        				
					        				<div class="panel-heading">Files</div>
					        				<!-- /.panel-heading -->
					        				<div class="panel-body">
									    	  	<div class='bigPictureWrapper'>
													<div class='bigPicture'></div>
												</div>
					        					<div class="form-group uploadDiv">
					        						<input type="file" name="uploadFile" multiple>
					        					</div>
					        					
					        					<div class="uploadResult">
					        						<div class="loader"></div> <!-- 로더(로딩 바) 추가 -->
					        						<ul></ul>
					        					</div>
					        					
					        				</div>
					        				<!-- /.panel-body -->
					        			</div>
					        			<!-- /.panel -->
					        		</div>
					        		<!-- /.col-lg-12 -->
					        	</div>
					        	<!-- /.row --> <!-- end attach file -->
								
								<!-- spring security 태그 -->
								<sec:authentication property="principal" var="pinfo" />
								<sec:authorize access="isAuthenticated()"> <!-- 로그인 되었는지 검사 -->
									<c:if test="${pinfo.username eq board.writer}"> <!-- 로그인 ID와 작성자가 일치하는지 확인 -->
	 									<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
										<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
									</c:if>
								</sec:authorize>
								
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
            			
            			e.preventDefault(); // 전송 막는 코드 (버튼 세 개가 전부 submit이므로 일단 정지시킴)
            			
            			var operation = $(this).data("oper"); // data-oper 값이 뭔지 확인
            			
            			console.log(operation);
            			
            			 if(operation === "remove") { 
            				 
            				formObj.attr("action", "/board/remove");
            				
            			} else if(operation === "list") {
            				//move to list (list는 GetMapping만 되어 있기 때문에 get 방식으로 변경)
							formObj.attr("action", "/board/list").attr("method", "get");
            				
            				var pageNumTag = $("input[name='pageNum']").clone(); // clone() : 코드 복제하는 메소드
            				var amountTag = $("input[name='amount']").clone(); 
            				var typeTag = $("input[name='type']").clone();
            				var keywordTag = $("input[name='keyword']").clone();
            				
            				formObj.empty(); // formObj 지우고
            				
            				formObj.append(pageNumTag); // pageNum 추가
            				formObj.append(amountTag); // amount 추가
            				formObj.append(keywordTag); // keyword 추가
            				formObj.append(typeTag); // type 추가
            				
            			} else if(operation === "modify") {
            				
            				console.log("submit clicked");
            				
            				var str = "";
            				
            				$(".uploadResult ul li").each(function(i, obj) { // ★ $.each 함수 매개변수는 (인덱스, 아이템) 순으로 작성해야 됨!
            					
            					var jobj = $(obj);
            				
            					console.dir(jobj);
            					
            					str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>"; 
            					str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
            					str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
            					str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
            			
            				});
            				formObj.append(str).submit();
            			}
            			formObj.submit();
            		});
            	});
            </script>
            
			<script>
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
									
									str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid 
									    + "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
								    str += "<span> " + attach.fileName + "</span>";
									str += "<button type='button' data-file='" + fileCallPath + "' "; // 삭제 버튼
									str += " data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"; 									
									str += "<img src='/display?fileName=" + fileCallPath + "'></div></li>";
								
								} else { // attach.fileType이 false면 (=이미지가 아닌 파일이면)
									var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
								
									str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid 
								   		+ "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
									str += "<span> " + attach.fileName + "</span><br>";
									str += "<button type='button' data-file='" + fileCallPath + "' "; // 삭제 버튼
									str += " data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"; 									
									str += "<img src='/resources/img/attach.png'></div></li>";
								
								}
							});
							
							$(".uploadResult ul").html(str);
							
						}); // end getJSON
					})(); // end attach file event 
					
					
					// 첨부파일 클릭 이벤트 - 삭제
					$(".uploadResult").on("click", "button", function(e) { // delegate
						
						console.log("delete image");
					
						if(confirm("Remove this file?")) {
							
							var targetLi = $(this).closest("li");
							targetLi.remove(); // 화면에서만 파일을 지우는 코드 (서버는 영향 X)
						}	
					
					});
					// end 첨부파일 클릭 이벤트 - 삭제
					
					
					// 파일 사이즈, 확장자 체크
					var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
					var maxSize = 5242880; //5MB
				  
					function checkExtension(fileName, fileSize){
				    
					    if(fileSize >= maxSize){
					      alert("파일 사이즈 초과");
					      return false;
					    }
					    
					    if(regex.test(fileName)){
					      alert("해당 종류의 파일은 업로드할 수 없습니다.");
					      return false;
					    }
					    
						return true;
				    }
					
					// csrf
					var csrfHeaderName ="${_csrf.headerName}"; 
					var csrfTokenValue="${_csrf.token}";
					
					// 파일 업로드 체인지 이벤트
					$("input[type='file']").change(function(e) {
						
						var formData = new FormData(); // FormData : 자바스크립트에서 form 태그에 대응되는 객체
						var inputFile = $("input[name='uploadFile']"); // 선택자 결과가 여러 개면 자동으로 배열 형태로 반환 ==> inputFile의 타입 : array
						var files = inputFile[0].files; // 2개 이상일 수 있으므로 file's', 초기값 인덱스 0으로 지정
						
						for(var i = 0; i < files.length; i++) {
							
							if(!checkExtension(files[i].name, files[i].size)) { // checkExtension 반환값이 true이므로, ! 붙여서 false인 경우의 조건식으로 작성
								return false;
							}
							formData.append("uploadFile", files[i]); // 파일목록 files를 하나씩 꺼내서 uploadFile에 넣음
						}
						// 서버에 데이터 전달
						$.ajax({ // ajax의 매개변수는 객체{}
							url: '/uploadAjaxAction',
							processData: false, // 작업이 진행될 때의 데이터
							contentType: false, // 서버로 가는 데이터의 타입
							data: formData, // ★★★ form에 입력한 값을 서버에 전송할 때 formData 객체에 담아서 전송한다!! - 보통 FormData 객체 혹은 JSON.stringify({..}) 두 가지 스타일로 전송한다.
							type: 'POST',
							dataType: 'json',
							beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
								$(".loader").show(); // 서버에 보내기 전에 로딩 바 보이게 하기
								xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
							},
							success: function(result) { // success는 callback
								console.log("result: " + result);
								$(".loader").hide(); // 서버 결과 나오면 로딩 바 숨기기
								showUploadResult(result); // 업로드 결과(첨부파일 미리보기 목록) 출력하는 함수
							}
						}); // /$.ajax
					}); // end 파일 업로드 체인지 이벤트
				    
					
				    function showUploadResult(uploadResultArr) { // 컨트롤러에서 배열 형태로 전달하기 때문에 매개변수가 Arr
				  	  // 배열이 null이거나 길이가 0이면 (=첨부파일이 없으면) ==> 즉시 종료  
						if(!uploadResultArr || uploadResultArr.length == 0) { return; }
				  	  	
				  	  	var uploadUL = $(".uploadResult ul");
				  	  	
				  	  	var str = "";
				  	    // 컨트롤러에서 보내준 배열에서 하나씩 꺼내서 obj에 넣음
						$(uploadResultArr).each(function(i, obj) {
							
							if(obj.image) { // obj.image가 존재하면 (=이미지면) ==> 섬네일 출력해야 됨
								
								var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName); // encodeURIComponent : 자바스크립트의 인코딩 함수? 한글 깨짐 방지 
								
								str += "<li data-path='" + obj.uploadPath + "'";
								str += " data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "'";
								str += " ><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file='" + fileCallPath + "' "; // 삭제 버튼
								str += " data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"; // fa : fontawesome, fa-times : x 버튼 이미지
								str += "<img src='/display?fileName=" + fileCallPath + "'>";
								str += "</div>";
								str += "</li>";
								
							} else { //  obj.image가 존재하지 않으면 (=이미지가 아니면) ==> attach.png 출력
								
								var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
								
								str += "<li ";
								str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "' ><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' ";
								str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/resources/img/attach.png'>";
								str += "</div>";
								str += "</li>";
							}
							 
						});
				  	    // ul 태그에 추가
				  	    uploadUL.append(str);
					}
			
					
				    $(".uploadResult").on("dragenter dragover",function(event){
						//기본이벤트취소.새창이 열리는 것 방지
						event.preventDefault();
					});
				    
				  	//파일 드롭시 새창으로 열리는것 방지. 파일업로드
					$(".uploadResult").on("drop",function(event){
						//기본이벤트취소.새창이 열리는 것 방지
						event.preventDefault();
						
						var formData = new FormData(); // FormData : 자바스크립트에서 form 태그에 대응되는 객체
						// drop했을 때 파일의 목록을 구함
						var files = event.originalEvent.dataTransfer.files;
						
						for(var i = 0; i < files.length; i++) {
							
							if(!checkExtension(files[i].name, files[i].size)) { // checkExtension 반환값이 true이므로, ! 붙여서 false인 경우의 조건식으로 작성
								return false;
							}
							formData.append("uploadFile", files[i]); // 파일목록 files를 하나씩 꺼내서 uploadFile에 넣음
						}
						// 서버에 데이터 전달
						$.ajax({ // ajax의 매개변수는 객체{}
							url: '/uploadAjaxAction',
							processData: false, // 작업이 진행될 때의 데이터
							contentType: false, // 서버로 가는 데이터의 타입
							data: formData, // ★★★ form에 입력한 값을 서버에 전송할 때 formData 객체에 담아서 전송한다!! - 보통 FormData 객체 혹은 JSON.stringify({..}) 두 가지 스타일로 전송한다.
							type: 'POST',
							dataType: 'json',
							beforeSend: function(xhr) { // 서버에 보내기 전에 실행되는 함수
								$(".loader").show(); // 서버에 보내기 전에 로딩 바 보이게 하기
								xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
							},
							success: function(result) { // success는 callback
								console.log("result: " + result);
								$(".loader").hide(); // 서버 결과 나오면 로딩 바 숨기기
								showUploadResult(result); // 업로드 결과(첨부파일 미리보기 목록) 출력하는 함수
								$("input[name=uploadFile]").val(""); // 초기화
							}
						}); // /$.ajax
						
					});
					
				});
			</script>

            
            
<%@ include file="../includes/footer.jsp" %>