<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 상세 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                            	게시글 상세페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
						
							<div class="form-group">
								<label>게시글번호</label>
								<input class="form-control" name="bno" value="<c:out value='${board.bno}'/>"
								readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>제목</label>
								<input class="form-control" name="title" value="<c:out value='${board.title}'/>"
								readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="3"  name="content" readonly="readonly"><c:out value='${board.content}'/></textarea> 
							</div>
							
							<div class="form-group">
								<label>작성자</label>
									<input class="form-control" name="writer" value="<c:out value='${board.writer}'/>"
								readonly="readonly">
							</div>
							<sec:authentication property="principal" var="pinfo"/>
							 	<sec:authorize access="isAuthenticated()">
								 	<c:if test="${pinfo.username eq board.writer}">
								 	<button data-oper='modify' class="btn btn-danger">게시물 수정</button>
								 	</c:if>
						 	</sec:authorize>
							<button data-oper='list' class="btn btn btn-info">목록으로</button>
						               		
                        </div>
                        <!-- /.panel-body -->
                        	<form id="operForm" action="/bb/modify" method="get">
								<input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">	
								<input type="hidden"  name="pageNum" value="<c:out value='${cri.pageNum}'/>">	
								<input type="hidden"  name="amount" value="<c:out value='${cri.amount}'/>">	
								<input type="hidden"  name="keyword" value="<c:out value='${cri.keyword}'/>">
								<input type="hidden"  name="type" value="<c:out value='${cri.type}'/>">	
									
							</form>  
                    </div>
                    <!-- /.panel -->
                 
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
   <%@include file="./reply.jsp" %>
   
      <script type="text/javascript">
      $(document).ready(function(){
    	  
    	  var operForm = $("#operForm");
    	  
    	  
    	  $("button[data-oper='modify']").on("click", function(e){
    		  operForm.attr("action","/bb/modify").submit();
    	  });
    	  
    	  $("button[data-oper='list']").on("click", function(e){
    		 operForm.find("#bno").remove();
    		 operForm.attr("action","/bb/list");
    		 operForm.submit();
    	  });
      });
</script>
      <%@include file="../includes/footer.jsp" %>
