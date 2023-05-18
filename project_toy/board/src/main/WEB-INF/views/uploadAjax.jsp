<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAjax</title>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
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
}

.uploadResult ul li img {
	width: 100px;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		
<script>
	function showImage(fileCallPath) {
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>").animate({width: '100%', height: '100%'}, 1000);
	}
	
	$(document).ready(function(){
		
	$(".bigPictureWrapper").on("click", function(e) {
		// 1초 동안 애니메이션 실행하고 이후에 보이지 않게 하는 코드
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000, function(){$(".bigPictureWrapper").hide();});
	});
	
	// 이미지 파일 출력하는 메소드
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr) {
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj) { // ★ jQuery - $.each 함수 중요!!
			
			if(!obj.image) { // 이미지가 아니면
			
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obh.uuid + "_" + obj.fileName);
				
				str += "<li><a href='/download?fileName=" + fileCallPath + "'>" 
					+ "<img src='/resources/img/attach.png'>" + obj.fileName + "</a></li>";
			} else { // 이미지면
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
				originPath = originPath.replace(new RegExp(/\\/g), "/"); // \\ 를 / 로 바꾼다 (Web에서 경로 표시는 /로 하기 때문)
				
				str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a></li>";
			}
		});
		
		uploadResult.append(str);
	}
	// end showUploaedeFile
	
	
		// 업로드 테스트 코드
/* 		$('#uploadBtn').on('click', function(e){
			
			var formData = new FormData(); // formData 객체 생성
			var inputFile = $('input[name="uploadFile"]'); // 배열 (jQuery 선택자 결과는 배열 형태로 리턴됨)
			var files = inputFile[0].files; // multiple이라 여러 개 선택할 수 있어서 file's' (배열)
			console.log(files);
			
			// add filedate to formdata
			for(var i = 0; i < files.length; i++) { // 배열의 길이 .length로 구함
				formData.append('uploadFile', files[i]); // formData에 uploadFile이라는 이름으로 넣어서 서버에 보냄
			}
			
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false, // 필수 입력 속성. 값은 무조건 false
				contentType: false, // 필수 입력 속성. 값은 무조건 false
				data: formData,
				type: 'POST',
				success: function(result) {
					alert('Uploaded');
				} 
			}); //$.ajax
		}); */
		// 업로드 테스트 코드 끝
		
		
		// 파일 확장자를 정규식으로 체크, 파일 사이즈 상한선 제한
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 이 확장자의 파일은 업로드 불가
		var maxSize = 5242880; // 5MB
		
		function checkExtension(fileName, fileSize) {
			
			if(fileSize >= maxSize) { 
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;
		}
		
		var cloneObj = $(".uploadDiv").clone(); // 다시 '선택된 파일 없음'으로 되돌리기 위해 clone에 그 상태를 저장해둠
		
		$('#uploadBtn').on('click', function(e) {
			
			var formData = new FormData(); // formData 객체 생성
			var inputFile = $('input[name="uploadFile"]'); // 배열 (jQuery 선택자 결과는 배열 형태로 리턴됨)
			var files = inputFile[0].files; // multiple이라 여러 개 선택할 수 있어서 file's' (배열)
			
			for(var i = 0; i < files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size )) {
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false, // 필수 입력 속성. 값은 무조건 false
				contentType: false, // 필수 입력 속성. 값은 무조건 false
				data: formData,
				type: 'POST',
				success: function(result) {
					
					console.log("result: " + result);
					
					showUploadedFile(result);
					
					$(".uploadDiv").html(cloneObj.html());
				} 
			});  //$.ajax 
			
		});
		// 파일 확장자를 정규식으로 체크, 파일 사이즈 상한선 제한 끝

	});
</script>
</head>
<body>
	<h1>Upload with Ajax</h1>
	
	<div class='bigPictureWrapper'>
	  <div class='bigPicture'>
	  </div>
	</div>
	
	<!-- form 태그 없이 input 태그만 ajax 방식으로 전송 -->
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	
	<div class='uploadResult'>
		<ul>
		
		</ul>
	</div>
	
	<button id='uploadBtn'>Upload</button>



</body>
</html>