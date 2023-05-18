console.log("PtRecord Module.....");

var ptRecordService = (function(){

	function add(ptRecord, callback, error) {		
		$.ajax({
			type : 'post',
			url : '/ptrecord/new',
			data : JSON.stringify(ptRecord),
			contentType : "application/json; charset=utf-8",
			dataType : "text",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	function get(prno, callback, error) {
		$.getJSON("/ptrecord/" + prno + ".json", function(result) {
			
			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function update(ptRecord, callback, error) {
		$.ajax({
			type : 'put',
			url : '/ptrecord/' + ptRecord.prno,
			data : JSON.stringify(ptRecord),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function remove(prno, callback, error) {
		$.ajax({
			   type : 'delete',
				url : '/ptrecord/' + prno,
			success : function(deleteResult, status, xhr) {
					if (callback) {
						callback(deleteResult);
					}
				},
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			});
		}
	
	return{
		add : add,
		get : get,
		update : update,
		remove : remove
	};
})();
