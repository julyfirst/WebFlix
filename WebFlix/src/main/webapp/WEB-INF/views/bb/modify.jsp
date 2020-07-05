<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 수정 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                            	게시글 수정 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
						<form id="formPost" role="form" action="/bb/modify" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden"  name="pageNum" value="<c:out value='${cri.pageNum}'/>">	
							<input type="hidden"  name="amount" value="<c:out value='${cri.amount}'/>">	
							<input type="hidden"  name="keyword" value="<c:out value='${cri.keyword}'/>">	
							<input type="hidden"  name="type" value="<c:out value='${cri.type}'/>">	
							
							<div class="form-group">
								<label>게시글번호</label>
								<input class="form-control" name="bno" value="<c:out value='${board.bno}'/>"
								readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>제목</label>
								<input class="form-control" name="title" value="<c:out value='${board.title}'/>">
							</div>
							
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="3"  name="content"><c:out value='${board.content}'/></textarea> 
							</div>
							
							<div class="form-group">
								<label>작성자</label>
									<input class="form-control" name="writer" value="<c:out value='${board.writer}'/>"
								readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>생성날짜</label>
									<input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>'
								readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>수정날짜</label>
									<input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>'
								readonly="readonly">
							</div>
							<sec:authentication property="principal" var="pinfo"/>
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq board.writer }">
									<button type="submit" data-oper='modify' class="btn btn-default">게시글 수정</button>
									<button type="submit" data-oper='remove' class="btn btn-danger">게시글 삭제</button>
								</c:if>
							</sec:authorize>
							<button type="submit" data-oper='list' class="btn btn-info">목록으로</button>
						</form>                        		
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
    	 var formObj = $("form");
    	 
    	 $("button").on("click",function(e){
    		 e.preventDefault();
    		 
    		 var operation = $(this).data("oper");
    		 
    		 console.log(operation);
    		 
    		 if(operation === 'remove'){
    			 formObj.attr("action", "/bb/remove");
    		 }else if(operation === 'list'){
    			 formObj.attr("action", "/bb/list").attr("method","get");
    			 
    			 var pagNumTag = $("input[name='pageNum']").clone();
    			 var amountTag = $("input[name='amount']").clone();
    			 var keywordTag = $("input[name='keyword']").clone();
    			 var typeTag = $("input[name='type']").clone();
    			 
    			 formObj.empty();
    			 formObj.append(pagNumTag);
    			 formObj.append(amountTag);
    			 formObj.append(keywordTag);
    			 formObj.append(typeTag);
    		 }
    		 formObj.submit();
    	 });
      });

</script>
