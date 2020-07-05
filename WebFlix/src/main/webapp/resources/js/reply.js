console.log("Reply Module.......");

var replyService = (function(){

	// 댓글추가
	function add(reply, callback, error){
		console.log(" add reply............");
		
		/*
		 * 데이터 전송타입이 application/json;charset=utf-8;로전송
		 * 파라미터로 callback과 error를 함수로  받을 것이라는 점
		 */
		$.ajax({
			type : 'post',
			url : '/rp/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error) {
					error(er);
				}
			}
		});
	}
	// 조회
	function get(rno, callback, error){
		
		$.get("/rp/" + rno + ".json", function(result){
			if(callback){
				callback(result);
			}
			
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	// param이라는 객체를통해서 필요한 파라미터를 전달 받아 json목록을 호출함
	// json 형태가 필요하므로 URL 호출시 확장자를 '.json'으로 요구함
	function getList(param, callback, error){
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/rp/pages/" + bno + "/" + page + ".json",
			function(data){
				if(callback){
					// callback(data); 댓글 목록만 가져옴
					callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져옴
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
	}
	// 삭제
	function remove(rno, replyer, callback, error){
		$.ajax({
			type : 'delete',
			url : '/rp/' + rno,
			data : JSON.stringify({rno:rno, replyer:replyer}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error) {
					error(er);
				}
			}
		});
	}
	
	// 수정
	function update(reply, callback, error){
		console.log("rno : " + reply.rno);
		
		$.ajax({
			type : 'put',
			url : '/rp/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error) {
					error(er);
				}
			}
		});
	}

	// 시간처리
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return[(hh > 9? '' : '0') + hh, ':',(mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return[yy, '/',(mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	}
	return {
		add : add,
		get: get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
		
		
	};
})();