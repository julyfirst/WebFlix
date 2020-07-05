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
    <title>Create Account</title>
</head>
<body>
   
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                    <h2 class="form-title">Create Account</h2>
                    <form role="form" id="signup-form" class="signup-form" action="/sp/signUp" method="post" >
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
	                                <i class="far fa-id-card"></i>
	                                <input type="text" class="form-input" name="userid" id="userid" placeholder="아이디" />
                            	</div>
						
								 <div class="form-group">
	                                <i class="fas fa-lock"></i>
	                                <input type="password" class="form-input" name="userpw" id="userpw" placeholder="비밀번호"/>
                            	</div>
								
								<div class="form-group">
	                                <i class="fas fa-user"></i>
	                                <input type="text" class="form-input" name="username" id="username" placeholder="이름" />
                           		 </div>
                           		 
                           		<div class="form-group">
                                	<i class="fas fa-envelope"></i>
                                	<input type="text" class="form-input" name="email" id="email" placeholder="이메일" required />
                            	</div>
                            	
                            	 <div class="form-group">
	                                <i class="fas fa-mobile-alt"></i>
	                                <input type="text" class="form-input" name="phonenumber" id="phonenumber" placeholder="핸드폰 번호" 
	                                pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####" required/>
	                            </div>
	                            
								<div class="form-group">
	                                <i class="fas fa-birthday-cake"></i>
	                                <input type="text" class="form-input" name="birth_date" id="birth_date" placeholder="생년월일 ex. YYYY-MM-DD" />
                            	</div>
                           		 
								 <div class="form-group">
                                	<button type="submit" name="submit" id="submit" class="form-submit" >Sign up</button>
                            	</div>
								<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>						                        		
                        	</form>       
	                    	<p class="loginhere">
	                            Have already an account ? <a href="../customLogin" class="loginhere-link">Login here</a>
	                        </p>
                     
                    </div>
                </div>
            </section>
        </div>
</body>
</html>
