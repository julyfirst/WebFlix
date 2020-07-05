<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- 댓글창 -->
<div class="panel panel-default">
	<div class="panel-heading">
		<i class="fa fa-comments fa-fw"></i>댓글
		<sec:authorize access="isAuthenticated()">
			<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글
				추가</button>
		</sec:authorize>
	</div>
	<div class="panel-body">
		<ul class="chat">
			
		</ul>
	</div>
	<div class="panel-footer">
		
	</div>
</div>
<!-- 모달창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">댓글 추가창</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label>
						<input class="form-control" name="reply" value="New Reply!!!">
					</div>
					<div class="form-group">
						<label>Replyer</label>
						<input class="form-control" name="replyer" value="replyer" readonly="readonly">
					</div>
					<div class="form-group">
						<label>Reply Date</label>
						<input class="form-control" name="replyDate" value="replyDate">					
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
        			<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
        			<button id='modalRegisterBtn' type="button" class="btn btn-primary">추가</button>
        			<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
				</div>
			</div>
		</div>
	</div>

     <!-- 댓글처리 reply.js 호출해서 실행 -->
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>      
      <script type="text/javascript">
	      $(document).ready(function(){
	    		
			var bnoValue = '<c:out value="${board.bno}"/>';
			var replyUL = $(".chat");
			showList(1);
			
			// showList는 페이지 번호를 파라미터로 받도록 설계하고 없는경우 자동으로 1이되도록 설정
			function showList(page){
				replyService.getList({bno:bnoValue, page : page || 1}, function(replyCnt, list){
					console.log("replyCnt : " + replyCnt);
					console.log("list : " + list);
					console.log(list);
					
					if(page == -1){
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
					}
					
					var str = "";
					
					if(list == null || list.length == 0){
						replyUL.html("");
						return;
					}
					// 댓글 출력
					for(var i = 0, len = list.length || 0; i < len; i++){
						str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						str += "<div><div class='header'><strong class='primary-font'>["+list[i].rno+"]"+list[i].replyer+"</strong>";
						str += "	<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
						str += "		<p>" +list[i].reply+"</p></div></li>";
					}
					replyUL.html(str);
					showReplyPage(replyCnt);
				}); 
			}// end showlist
			var pageNum = 1;
			var replyPageFooter = $(".panel-footer");
			
			function showReplyPage(replyCnt){
			  
				var endNum = Math.ceil(pageNum / 10.0) * 10;  
				var startNum = endNum - 9; 
				
				var prev = startNum != 1;
				var next = false;
				
				if(endNum * 10 >= replyCnt){
					endNum = Math.ceil(replyCnt/10.0);
				}
				
				if(endNum * 10 < replyCnt){
					next = true;
				}
				
				var str = "<ul class='pagination pull-right'>";
				
				if(prev){
					str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
				}
				
				for(var i = startNum ; i <= endNum; i++){
				  
					var active = pageNum == i? "active":"";
					str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
				}
				
				if(next){
				  str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
				}
				
				str += "</ul></div>";
				console.log(str);
				replyPageFooter.html(str);
			}			
		   replyPageFooter.on("click","li a", function(e){
				
			   e.preventDefault();
				console.log("page click");
				
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: " + targetPageNum);
				pageNum = targetPageNum;
				showList(pageNum);
				
		    });    
			
			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal.find("input[name='replyer']");
			var modalInputReplyDate = modal.find("input[name='replyDate']");
			
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			var reply = null;
			
			<sec:authorize access="isAuthenticated()">
				replyer = '<sec:authentication property="principal.username"/>';
			</sec:authorize>
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			$("#modalCloseBtn").on("click", function(e){
				modal.modal('hide');
			});
			
			$("#addReplyBtn").on("click", function(e){
			    
				modal.find("input").val("");
				modal.find("input[name='replyer']").val(replyer);
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();
				    
				modalRegisterBtn.show();
				    
				$(".modal").modal("show");
			    
			});
			// Ajax spring security header...
			$(document).ajaxSend(function(e, xhr, options){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});
			
			// 댓글추가
			modalRegisterBtn.on("click",function(e){
			     
				var reply = {
					reply: modalInputReply.val(),
					replyer:modalInputReplyer.val(),
					bno:bnoValue
				};
					replyService.add(reply, function(result){
					  
						Swal.fire(
								  '댓글이 작성 되었습니다.',
								  'WebFlix',
								  'success'
						);
					  
					modal.find("input").val("");
					modal.modal("hide");
					  
					// showList(1);
					showList(-1);
				       
				});     
			});
					
			/*
				댓글 조회
				댓글을 조회하는 경우 모든내용이 화면에 있기때문에 조회할 필요는 없지만 원칙적으로 Ajax로 댓글을조회한후 수정/삭제를 하는 것이정상
			*/
			$(".chat").on("click", "li", function(e){
				var rno = $(this).data("rno");
				replyService.get(rno, function(reply){
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly", "readonly");
					modal.data("rno", reply.rno);
					
					modal.find("button[id != 'modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					
					$(".modal").modal("show");
					
				});
			});
			
			// 댓글 수정
			modalModBtn.on("click", function(e){
				
				
				var originalReplyer = modalInputReplyer.val();
				
				var reply = {
						rno: modal.data("rno"), 
						reply: modalInputReply.val(),
						replyer: originalReplyer
				};
				
				if(!replyer){
					alert("로그인후 수정이 가능합니다.");
					modal.modal("hide");
					return;
				}
				
				console.log("Original Replyer : " + originalReplyer);
				
				if(replyer != originalReplyer){
									 
					Swal.fire({
					  icon: 'error',
					  title: '자신이 작성한 댓글만 수정이 가능합니다.',
					  text: '댓글을 쓴 아이디로 로그인 해주세요.',
					  footer: '<a href="../customLogin">WebFlix</a>'
					})
					modal.modal("hide");
					return;
				}
				
				replyService.update(reply, function(result){
					alert(result);
					modal.modal("hide");
					showList(pageNum);
				});
				
			});
			
			// 댓글 삭제
			modalRemoveBtn.on("click", function(e){
				var rno = modal.data("rno");
				
				if(!replyer){
					alert("로그인후 삭제가 가능합니다.")
					modal.modal("hide");
					return;
				}
				
				var originalReplyer = modalInputReplyer.val();
				console.log("Original Replyer: " + originalReplyer ); // 댓글의 원래 작성자
				
				if(replyer != originalReplyer){
					Swal.fire({
					  icon: 'error',
					  title: '자신이 작성한 댓글만 삭제가 가능합니다.',
					  text: '댓글을 쓴 아이디로 로그인 해주세요.',
					  footer: '<a href="../customLogin">WebFlix</a>'
					});
					modal.modal("hide");
					return;
				}
				
				replyService.remove(rno, originalReplyer, function(result){
					Swal.fire(
							  '댓글삭제완료',
							  'WebFlix',
							  'success'
					);
					modal.modal("hide");
					showList(pageNum);
				});
			});
			
	      });
 </script>