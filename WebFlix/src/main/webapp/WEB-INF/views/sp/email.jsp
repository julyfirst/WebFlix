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
    <script src="https://kit.fontawesome.com/47fe552f79.js"></script>
    <link rel="stylesheet" href="../resources/css/signup.css">
    <title>이메일 인증</title>
</head>
<body>
   
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                    <h2 class="form-title">Email Authentication</h2>
                    <h4><span style="color: green; font-weight: bold;">이메일 인증 (이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</span> <br> <br>    </h4>
                    <form role="form" id="signup-form" class="signup-form" action="/sp/auth" method="post" >
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                           		<div class="form-group">
                                	<i class="fas fa-envelope"></i>
                                	<input type="email" class="form-input" name="e_mail" id="email" placeholder="이메일" required />
                            	</div>
                            	
								 <div class="form-group">
                                	<button type="submit" name="submit" id="submit" class="form-submit" >이메일 인증받기(보내기)</button>
                            	</div>
                            	
								<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>						                        		
                        	</form>       
	                    	<p class="loginhere">
	                            	메인화면으로 이동 <a href="../" class="loginhere-link">메인으로</a>
	                        </p>
                     
                    </div>
                </div>
            </section>
        </div>
</body>
</html>
