console.log("Reply Module.............");

// 익명함수 안에 함수가 6개 들어있고, 6개의 속성을 갖는 객체로 반환한다.
// JavaScript는 function 안에 function을 넣을 수 있다.

// replyService : 사실상 함수의 이름 ==> 반환하는 객체의 레퍼런스가 됨 ==> replyService.add 같은 방식으로 호출이 가능해진다.
var replyService = (function() { 

	// INSERT
	function add(reply, callback, error) {
		console.log("add reply..............");
		
		$.ajax({
			type: 'post',
			url: '/replies/new', 							// 컨트롤러 주소
			data: JSON.stringify(reply), 					// client -> server 전송하는 데이터가 json 형태의 reply.(첫 번째 매개변수. reply를 json으로 변환)
			contentType: "application/json; charset=utf-8", // client -> server 전송하는 데이터 타입
			success: function(result, status, xhr) {		// result : success 들어옴
				if(callback) { 								// 두 번째 매개변수 callback : add() 내 익명함수의 레퍼런스가 된다. 내용이 있으면 그 익명함수를 호출한다.
					callback(result); 						// add()의 두 번째 매개변수인 익명함수의 형식과 동일하다. (result = Replycontroller의 success)
				}
			},
			error: function(xhr, status, er) {
				if(error) { // 세 번째 매개변수 error
					error(er);
				}
			}			
		});
	}
	
	// SELECT - LIST
	function getList(param, callback, error) {
		
		var bno = param.bno;
		var page = param.page || 1; // 페이지 번호가 없으면 기본값을 1로 하고, 있으면 그 값을 넣는다는 의미
		
		// 위 코드는 아래 코드와 동일 (if문 사용이 줄어들고 있음)
		//var page;
		//if(param.page) { page = param.page; } else { page = 1; }
		
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json", 
			function(data){ // 컨트롤러에서 넘긴 데이터가 data로 들어옴
			
				if(callback) {
					callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져옴
				}
				
			}).fail(function(xhr, status, err) { // function(data)가 실패했을 때의 코드
			if(error) {
				error();
			}
		});
	}
	
	
	// SELECT - VIEW
	function get(rno, callback, error) {

		$.get("/replies/" + rno + ".json", function(result) { // get방식

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	
	// UPDATE
	function update(reply, callback, error) {
		
		console.log("RNO: " + reply.rno);
		
		$.ajax({
			type: 'put', // ★ REST 방식에서는 update 시 put or patch 사용
			url: '/replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}						
		});
	}
	
	
	// DELETE
	function remove(rno, callback, error) {
		$.ajax({
			type: 'delete', // ★ REST 방식에서는 delete 시 delete 사용
			url: '/replies/' + rno,
			success: function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	
	
	// 시간 함수

	function displayTime(timeValue) {
		
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			// 숫자가 한 자리면 0 + 숫자 로 표기하여 반환 (join('') : 하나로 합치는 메소드, 소괄호 안에 구분자 넣음 - 공백은 구분자 없음을 의미)
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':',
					 (ss > 9 ? '' : '0') + ss ].join('');
		
		} else {
		
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/' , (mm > 9 ? '' : '0') + mm, '/',
					 (dd > 9 ? '' : '0') + dd ].join('');
		
		}
		
	};	
	
	// 객체를 반환 - 속성 : 값(=위의 함수 이름) (함수이름이 레퍼런스로 활용됨!)
	return { 
		add: add,
		getList: getList,
		get: get,
		update: update,
		remove: remove,
		displayTime: displayTime
	};
	
// 소괄호가 하나 더 붙는다 ==> 자기자신을 호출하는 함수 (즉시실행함수) (=replyService.add();)
})(); 