<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="mv/header.jsp" %>

	<!-- section-->
	<div class="mv-section contentbox">

		<div class="slide">
			<ul class="ww">
				<li><img src="../resources/css/image/index/main_img/main1.jpg" alt="asd"></li>
				<li><img src="../resources/css/image/index/main_img/main2.jpg" alt="asd"></li>
				<li><img src="../resources/css/image/index/main_img/main3.jpg" alt="asd"></li>
			</ul>
		</div>
	</div>

	<div class="mv-section">
		<div class="slider">
			<div>
				<img src="../resources/css/image/index/main_slider/si1.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si2.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si3.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si4.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si5.jpg" alt="">
			</div>
			<div>
				<img src="../resources/css/image/index/main_slider/si6.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si7.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si8.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si9.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si10.jpg" alt="">
			</div>
			<div>
				<img src="../resources/css/image/index/main_slider/si11.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si12.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si13.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si14.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si15.jpg" alt="">

			</div>
			<div>
				<img src="../resources/css/image/index/main_slider/si16.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si17.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si18.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si19.jpg" alt=""> <img
					src="../resources/css/image/index/main_slider/si20.jpg" alt="">
			</div>
		</div>
	</div>
	
	<div class="video">
		<video id="vid" width="1280" height="720" controls autoplay="autoplay"
			muted="muted" loop="loop">
			<source src="../resources/css/mv_preview/vovo1.mp4" type="video/mp4">
		</video>
	</div>
	<%@include file="includes/footer.jsp" %>
</body>
</html>