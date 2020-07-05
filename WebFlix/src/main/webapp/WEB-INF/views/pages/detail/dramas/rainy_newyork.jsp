<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../../../mv/action_header.jsp"%>
<div class="content2">
	<div class="cc">
		<img
			src="../../../resources/css/image/detail/dramas/rainy_newyork/rainymain.jpg"
			alt="">

		<div class="content3">
			<img
				src="../../../resources/css/image/detail/dramas/rainy_newyork/mel3.jpg"
				alt="">
		</div>
	</div>



	<div class="content4">
		<form method="post" action="/pages/detail/dramas/rainy_newyork">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">

			<c:forEach var="newyork" begin="3" end="3" items="${newyork}">
				<input type="hidden" name="movie_id" value="${newyork.movie_id}" />
				<input type="hidden" name="deal_price"
					value="${newyork.movie_price2}" />
			</c:forEach>

			<button type="submit" class="button1">구매</button>
			<a id="downloadbtn" class="button2 downloadbtn">파일다운</a> 

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>

	</div>
</div>

<div class="content5">
	<h2>
		<c:forEach var="newyork" begin="5" end="5" items="${newyork}">
		    ${newyork.movie_name}<p>A Rainy Day in New York</p>
		    가격 : ${newyork.movie_price1 } -> 할인가     ${newyork.movie_price2 }
	    </c:forEach>
	</h2>

</div>
</div>

<section>
	<h3 class="mv-section1">영화정보</h3>

	<p class="mv-section2">
		상상해 봐요 <br> 막 떨어지기 시작한 빗방울 <br> 센트럴 파크 델라코트 시계 아래 <br>
		누군가 당신을 기다리고 있다면… <br> 재즈를 사랑하는 ‘개츠비’(티모시 샬라메) <br> 영화에 푹 빠진
		‘애슐리’(엘르 패닝) <br> 낭만을 꿈꾸는 ‘챈’(셀레나 고메즈) <br> 매력적인 세 남녀가 선사하는
		낭만적인 하루! <br> 운명 같은 만남을 기대하며 <br> 봄비 내리는 뉴욕에서 <br> 로맨틱한
		하루를 함께 하실래요?
	</p>


	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/rainy_newyork/rainy1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/rainy_newyork/rainy2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/rainy_newyork/rainy3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/rainy_newyork/rainy4.jpg"
				alt=""></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label> <label for="pos2"></label> <label
				for="pos3"></label> <label for="pos4"></label>
		</p>
	</div>

	<h5 class="mv-section5">배우</h5>
	<div class="mv-section6">
		<img
			src="../../../resources/css/image/detail/dramas/rainy_newyork/actor9.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8"
		src="../../../resources/css/mv_preview/rainy.mp4" controls autoplay></video>

</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script>
		$(document).ready(function(){
			
			 $(".downloadbtn").on("click", function(e){
				 e.preventDefault();
			 	 $.ajax({
					url: '/download',					
					type: 'get',					
					datatype: 'json',
					success: function(data){
						window.location.href = "/download?fileName=rainy_newyork.mp4";				 
					},
					error:function(){
						alert("실패");
					}
				}); 			  
			});	
		});//documtent
	</script>

</body>

<footer>
	<div class="mv-footer contentbox">
		<h4>웹플릭스</h4>
		<p>서울특별시 관안구 중앙정보처리학원 | 고객센터 010-5499-2825</p>
		<p>대표이사 : 이상현 | 사업자등록번호 123-123-12345</p>
	</div>
</footer>
</html>