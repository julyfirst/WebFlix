<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>WebFlix</title>

<!-- Core CSS - Include with every page -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Page-Level Plugin CSS - Tables -->
<link
	href="../resources/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- SB Admin CSS - Include with every page -->
<link href="../resources/css/sb-admin.css" rel="stylesheet">

</head>

<body>



	<!-- header  -->
	<div class="mv-header">
		<h10> <a href="../" style="text-decoration: none;">웹플릭스</a></h10>
	</div>

	<!-- 메뉴바 -->

	<div class="mv-content">
		<ul class="menu">
			<li class="dropdown2"><a href="#" class="dropbtn2">영화</a>
				<div class="dropdown2-content">
					<a href="../pages/chart/action">액션</a> <a href="../pages/chart/dramas">멜로</a> <a href="../pages/chart/horror">공포</a> <a
						href="../pages/chart/animation">애니</a>
				</div></li>

			<li class="dropdown2"><a href="#" class="dropbtn2">이벤트</a>
				<div class="dropdown2-content"></div></li>

			<li class="dropdown2"><a href="../bb/list" class="dropbtn2">자유게시판</a>
				<div class="dropdown2-content"></div></li>

			<li class="dropdown2"><a href="#" class="dropbtn2">마이페이지</a>
				<div class="dropdown2-content">
					<a href="#">구매목록</a>
				</div></li>

			<li class="dropdown2" style="float:right;"><a href="../sp/signUp" class="dropbtn2">회원가입</a>
	</div>
	</li>




	</ul>


	</div>
 <div class="ss">
	<li style="float: right">
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<sec:authorize access="isAuthenticated()">
						<form action="/customLogout" method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button>로그아웃</button>
						</form>
					</sec:authorize>

					<sec:authorize access="isAnonymous()">
						<li><a href="/customLogin"><i
								class="fa fa-sign-out fa-fw"></i> Login</a></li>
					</sec:authorize>
				</ul></li>
		</ul>
	</li>
</div>









	<div id="page-wrapper">

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>