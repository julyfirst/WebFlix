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
			src="../../../resources/css/image/detail/dramas/becoming_jane/janemain.jpg"
			alt="">

		<div class="content3">
			<img
				src="../../../resources/css/image/detail/dramas/becoming_jane/mel1.jpg"
				alt="">
		</div>
	</div>



	<div class="content4">
		<form method="post" action="/pages/detail/dramas/becoming_jane">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">

			<c:forEach var="jane" begin="3" end="3" items="${jane}">
				<input type="hidden" name="movie_id" value="${jane.movie_id}" />
				<input type="hidden" name="deal_price" value="${jane.movie_price2}" />
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
		<c:forEach var="jane" begin="3" end="3" items="${jane}">
		    ${jane.movie_name}<p>Becoming Jane</p>
		    가격 : ${jane.movie_price1 } -> 할인가     ${jane.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">영화정보</h3>

	<p class="mv-section2">
		영국 햄프셔에서 작가를 꿈꾸던 제인 오스틴 앞에 나타난 <br> 부와 명예를 가진 청혼남 위슬리와 <br>
		도시에서 온 가난한 변호사 톰 르프로이 <br> 인생을 바꿀 선택의 기로에 선 제인은 <br> 자신만의
		방식으로 사랑에 전부를 바치는데…
	</p>


	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/becoming_jane/jane1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/becoming_jane/jane2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/becoming_jane/jane3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/becoming_jane/jane4.jpg"
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
			src="../../../resources/css/image/detail/dramas/becoming_jane/actor7.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8"
		src="../../../resources/css/mv_preview/jane.mp4" controls autoplay></video>

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
						window.location.href = "/download?fileName=becoming_jane.mp4";				 
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