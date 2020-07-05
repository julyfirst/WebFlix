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

<title>로그아웃</title>
</head>
<body>
	<h1>Logout Page</h1>
	<form action="/customLogout" method="post">
			<a href="customLogin"class="btn btn-lg btn-success btn-block">Logout</a>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button>로그아웃</button>	 --%>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(".btn-success").on("click",function(e){
			e.preventDefault();
			$("form").submit();
		});
	</script>
	
	<c:if test="${param.logout != null }">
		<script>
			$(document).ready(function(){
				alert("로그아웃하였습니다.");
			});
		</script>
	</c:if>
	
</body>
</html>