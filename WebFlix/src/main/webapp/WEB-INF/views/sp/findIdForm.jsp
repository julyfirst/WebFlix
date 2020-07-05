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

<title>web flix : id찾기 </title>
</head>
<body>


	<h1>아이디 찾기</h2>
		<!-- Form-->
		<div class="form">
			<div class="form-toggle"></div>
			<div class="form-panel one">
				<div class="form-header">
					<h1>환영합니다 :)</h1>
				</div>
				<div class="form-content">
					<form method="post" action="/sp/findIdForm" >
						<div class="form-group">
							<label for="username">아이디 찾기 써비스!</label> <input type="text"
								id="email" name="email" placeholder="가입된 이메일을 입력하세요" required="required" />
						</div>
						
						<div class="form-group find">
							<button id="findBtn">아이디찾기</button>
						</div>
					
						<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						
					</form>
						 <a class="form-recovery" href="../customLogin">로그인</a>
						 <a class="form-recovery" href="../sp/findPwForm">비밀번호찾기</a>
				</div>
			</div>
			
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
		
			var message = '${msg}'; 
			var returnUrl = '${findId}';		
	
			
		
										
					if(returnUrl === ""){
			   			Swal.fire({
			   				icon: 'error',
			   			  	title: '등록된 이메일 주소가 아닙니다.',
			   			  	text: '다시확인해보세요!',
			   			  	footer: '<a href = "../sp/signUp">WenFlix 회원가입 하러 가기</a>'
			   			});		   							
					}else if(returnUrl != null){
						Swal.fire(
							message,
							returnUrl,			   			
				   			'success'
				   		)	
					}
					
		
		
		   		
			
	   
			
			
	
			
	
</script>
</body>
</html>