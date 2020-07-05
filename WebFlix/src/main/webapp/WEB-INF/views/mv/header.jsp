<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebFlix</title>
<link rel="stylesheet"	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="../resources/css/index/index.css" type="text/css">

<script>
	$(document).ready(function() {

		$('.slider').bxSlider();
		
		$('.mypage').on( 'click', function(e) {
		            e.preventDefault();		            
		            $('#buylist').append("<input type='hidden' name='id' value='" + $(this).attr('href') + "'/>");
		            $('#buylist').attr("action", "/mv/purchaselist");
		            $('#buylist').submit();
		});

	});
	
</script>
<script>
	
</script>
</head>

<body>
	<div class="mv-container"></div>

	<!-- 메뉴바 -->
	<div class="mv-header">
		<h1>
			<a href="index.html" style="text-decoration: none;">웹플릭스</a>
		
		</h1>
	</div>

	<div class="mv-content">
		<ul class="menu">
			<li class="dropdown"><a href="javascript:void(0)"
				class="dropbtn">영화</a>
				<div class="dropdown-content">
					<a href="./pages/chart/action">액션</a> <a
						href="./pages/chart/dramas">멜로</a> <a
						href="./pages/chart/horror">공포</a> <a
						href="./pages/chart/animation">애니</a>
				</div></li>


			<li class="dropdown"><a href="javascript:void(0)"
				class="dropbtn">이벤트</a>
				<div class="dropdown-content"></div></li>

			<li class="dropdown"><a href="/bb/list"	class="dropbtn">자유게시판</a>
				<div class="dropdown-content"></div></li>

			<li class="dropdown">
				<form id="buylist" method="get">
				<sec:authorize access="isAuthenticated()">
					<a href="<sec:authentication property="principal.member.id"/>" class="mypage">마이페이지</a>
				</sec:authorize>
				</form>
			</li>					
			
			<li class="dropdown">
			<sec:authorize access="isAuthenticated()">
			<a href="/sp/memberList"
				class="dropbtn">회원정보</a></sec:authorize>
				<div class="dropdown-content"></div></li>			
				<li style="float: right"><a href="./customLogin">로그인</a></li>			
			<li style="float: right"><a href="./sp/signUp">회원가입</a></li>
		</ul>
	</div>