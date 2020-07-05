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
<link rel="stylesheet" href="../resources/css/login.css">

<title>web flix : 비밀번호찾기</title>

</head>
<body>


	<h1>비밀번호 찾기</h2>
		<!-- Form-->
		<div class="form">
			<div class="form-toggle"></div>
			<div class="form-panel one">
				<div class="form-header">
					<h1>환영합니다 :)</h1>
				</div>
				<div class="form-content">
					<form method="post" action="/sp/findPwForm" >
					
						<div class="form-group">
							<label for="username">아이디</label> <input type="text"
								id="userid" name="userid" placeholder="아이디를 입력 하세요." required="required" />
						</div>
						
						<div class="form-group">
							<label for="username">이메일</label> <input type="text"
								id="email" name="email" placeholder="가입된 이메일을 입력하세요" required="required" />
						</div>
						
						<div class="form-group">
							<button id="findBtn" type="submit">비밀번호 재설정</button>
						</div>
						
						<a class="form-recovery" href="../customLogin">로그인</a>
						<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						
					</form>
				</div>
			</div>
			

	
			

</body>
</html>