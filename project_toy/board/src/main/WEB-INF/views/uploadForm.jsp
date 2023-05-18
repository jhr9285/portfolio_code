<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadForm (Test Code)</title>
</head>
<body>
	
	<form action="uploadFormAction" method="post" enctype="multipart/form-data">
	
		<input type="file" name="uploadFile" multiple>
		<!-- input 태그에 multiple 설정을 붙이면 파일을 여러 개 올릴 수 있다. 
			 (파일 탐색기 창에서 파일을 여러 개 선택할 수 있는 기능을 한다.)
			 단, multiple 설정은 브라우저별로 사용에 제약이 있다. 
			 ex) chrome 6.0 이상, IE 10.0 이상... -->
		
		<button>Submit</button>
	
	</form>

</body>
</html>