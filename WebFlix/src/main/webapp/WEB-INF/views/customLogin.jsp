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
								id="username" name="username" value="admin" required="required" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								id="password" name="password" value="admin"required="required" />
						</div>
						<div class="form-group">
							<label class="form-remember"> <input type="checkbox" name='remember-me' checked="checked"/> 로그인
								유지
						 <a class="form-recovery" href="../sp/findIdForm">아이디찾기</a>
							</label> <a class="form-recovery" href="../sp/findPwForm">비밀번호찾기</a>
						</div>
						<div class="form-group">
							<button type="submit">로그인</button>
						</div>
						<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="form-group">
							<button id="signup" type="button">회원가입</button>
						</div>
					</form>
				</div>
			</div>
			

			
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function (){
		$("#signup").click(function(){
			location.href = "../sp/signUp";
		});
	});
</script>
</body>
</html>