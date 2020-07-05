<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                	<form id="searchForm" action="/sp/memberList" method="get">
	              		<select name="type">
	              			<!-- 검색시 키워드 남아있게 -->
	              			<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
	              				<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
	              				<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
	              				<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
	              				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
	              				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
	              				<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':''}"/>>제목 or 내용 or 작성자</option>
	              				
	              		</select>
	              		
	              		<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'/>
	              		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
	              		<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'/>
	              		<button class="btn btn-default">검색</button>
	              		
                    </form>
                    <div class="panel panel-default">
                        <div class="panel-heading">회원목록페이지
                        <button id='regBtn' type="button" class="btn btn-xs pull-right">ㅋㅋㅋ</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <input class="form-control" name="writer"
										 value='<sec:authentication property="principal.username"/>' readonly="readonly">
                             <table class="table table-striped table-bordered table-hover" >
                                    <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>회원 아이디</th>
                                            <th>영화명</th>
                                            <th>장르</th>
                                            <th>가격</th>
                                            <th>구입날짜</th>     
                                        </tr>
                                    </thead>
                                    
                                    <c:forEach items="${purchaselist}" var="purchaselist">
	                                    <tr>
	                                    	<td><c:out value="${purchaselist.id}"></c:out></td>
	                                    	<td><c:out value="${purchaselist.member.userid}"></c:out></td>
	                                    	<td><c:out value="${purchaselist.movie.movie_name}"></c:out></td>
	                                    	<td><c:out value="${purchaselist.movie.movie_genre}"></c:out></td>
	                                    	<td><c:out value="${purchaselist.deal_price}"></c:out></td>
	                                    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${purchaselist.purchase_date}"></fmt:formatDate></td>
	                                    </tr>
                                    </c:forEach>
                                </table>
                                <div class="pull-right">
                                	<ul class="pagination">
                                		
                                		<c:if test="${pageMaker.prev }">
                                			<li class="paginate_button previous">
                                			<a href="${pageMaker.startPage -1 }">Previous</a>
                                			</li>
                                		</c:if>
                                		
                                		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
                                			<a href="${num}">${num}</a></li>
                                		</c:forEach>
                                		
                                		<c:if test="${pageMaker.next}">
                                			<li class="paginate_button next">
                                			<a href="${pageMaker.endPage + 1 }">Next</a></li>
                                		</c:if>
                                		
                                	</ul>
                                	<!-- 페이지 번호를 클릭해서 이동할 때에도 검색조건과 키워드는 같이 전달-->
                                
                                	<form id="actionForm" action="/sp/memberList" method="get">
                                		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
                                		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
                                	</form>
                                	
                                </div>
                                <!-- end Pag -->
                                
                                
	                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            
      <%@include file="../includes/footer.jsp" %>
      <script type="text/javascript">
      		$(document).ready(function(){
      			var result = '<c:out value="${result}"/>';
      			
      			checkModal(result);
      			
      		   	// 모달 창 띄울 필요 없음 상태 
      			history.replaceState({},null,null);
      			
      			function checkModal(result){
      				
      				if(result === '' || history.state){
      					return;
      				}
      				if(parseInt(result)>0){
      					$(".modal-body").html("게시글" +parseInt(result) + " 번이 등록 되었습니다.");
      				}
      				$("#myModal").modal("show");
      			}
      			
      			$("#regBtn").on("click", function(){
      				self.location="/bb/register";
      			});
      			
      			var actionForm = $("#actionForm");
      			
      			// page버튼 클릭했을때 해당번호이동
      			$(".paginate_button a").on("click", function(e){
      				e.preventDefault();
      				console.log("click");
      				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
      				actionForm.submit();
      			});
      			
      			$(".move").on("click", function(e){
      				e.preventDefault();
      				actionForm.append("<input type='hidden' name='bno' value='" +
      				$(this).attr("href")+"'>");
      				actionForm.attr("action","/bb/get")
      				actionForm.submit();
      			});
      			
      			// 검색 버튼 이벤트처리
      			var searchForm = $("#searchForm");
      			$("#searchForm button").on("click", function(e){
      				
      				if(!searchForm.find("option:selected").val()){
      					alert("검색종류선택해라 ㅡㅡ");
      					return false;
      				}
      				
      				if(!searchForm.find("input[name='keyword']").val()){
      					alert("너 바보냐 키워드입력해라 ㅡㅡ;");
      					return false;
      				}
      				
      				searchForm.find("input[name='pageNum']").val("1");
      				e.preventDefault();
      				
      				searchForm.submit();
      				
      			});
      			
      			
      		});
      </script>
