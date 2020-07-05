<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./resources/css/login.css">

<title>web flex : 로그인</title>
</head>
<body>
	<h1>Login Page</h2>
	<h2><c:out value="${error}" /></h2>
	<h2><c:out value="${logout}" /></h2>
		<!-- Form-->
		<div class="form">
			<div class="form-toggle"></div>
			<div class="form-panel one">
				<div class="form-header">
					<h1>환영합니다 :)</h1>
				</div>
				<div class="form-content">
					<form method="post" action="/login" >
						<div class="form-group">
							<label for="username">아이디</label> <input type="text"
								id="username" name="username" value="admin90" required="required" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								id="password" name="password" value="pw90"required="required" />
						</div>
						<div class="form-group">
							<label class="form-remember"> <input type="checkbox" name='remember-me' /> 로그인
								유지
							</label> <a class="form-recovery" href="#">아이디/비밀번호 찾기</a>
						</div>
						<div class="form-group">
							<a href="index.html" class="btn btn-lg btn-success btn-block" >로그인</a>
						</div>
						<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="form-group">
							<button type="button">회원가입</button>
						</div>
					</form>
				</div>
			</div>
			
			 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			 <script type="text/javascript">
			 	$(".btn-success").on("click", function(e){
			 		e.preventDefault();
			 		$("form").submit();
			 	});
			 	
			 </script>

</body>
</html>