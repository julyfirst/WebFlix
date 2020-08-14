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
    <title>이메일인증</title>
</head>
<body>
   
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                    <h2 class="form-title">이메일 인증</h2>
                    <h4><span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span> <br> <br>   </h4>
                    <form role="form" id="signup-form" class="signup-form" action="/sp/join_auth${CertificationNumber}" method="post" >
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						
								 <div class="form-group">
	                                <i class="fas fa-lock"></i>
	                                <input type="password" class="form-input" name="emailAuth" id="userpw" placeholder="인증번호입력하세요"/>
                            	</div>
								
                           		 
								 <div class="form-group">
                                	<button type="submit" name="submit" id="submit" class="form-submit" >인증번호 전송</button>
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
