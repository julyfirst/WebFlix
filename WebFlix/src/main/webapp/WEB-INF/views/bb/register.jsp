<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%
 	request.setCharacterEncoding("utf-8");
 %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                            	게시글 추가
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form role="form" action="/bb/register" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title">
								</div>
								
								<div class="form-group">
									<label>내용</label>
									<input class="form-control" name="content">
								</div>
								
								<div class="form-group">
									<label>작성자</label>
									<!-- 현재 로그인된 아이디 출력 -->
									<input class="form-control" name="writer"
										 value='<sec:authentication property="principal.username"/>' readonly="readonly">
								</div>
								
								<button type="submit" class="btn btn-default">게시물 등록</button>
								<button type="reset" class="btn btn-default">초기화</button>
								                        		
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
