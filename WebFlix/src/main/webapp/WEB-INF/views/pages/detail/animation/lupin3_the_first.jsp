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
			src="../../../resources/css/image/detail/animation/lupin3_the_first/firstmain.jpg"	alt="">

		<div class="content3">
			<img
				src="../../../resources/css/image/detail/animation/lupin3_the_first/ani1.jpg" alt="">
		</div>
	</div>

	<div class="content4">
		<form method="post" action="/pages/detail/animation/lupin3_the_first">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>' readonly="readonly">

			<c:forEach var="lupin3_the_first" begin="9" end="9"	items="${lupin3_the_first}">
				<input type="hidden" name="movie_id" value="${lupin3_the_first.movie_id}" />
				<input type="hidden" name="deal_price"value="${lupin3_the_first.movie_price2}" />
			</c:forEach>

			<button type="submit" class="button1">구매</button>
			<a id="downloadbtn" class="button2 downloadbtn">파일다운</a> 
			

			<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
		</form>
	</div>
</div>

<div class="content5">
	<h2>
		<c:forEach var="lupin3_the_first" begin="9" end="9"
			items="${lupin3_the_first}">
		    ${lupin3_the_first.movie_name}	<p>THE FIRST , Lupin III: The
				First</p>
		    가격 : ${lupin3_the_first.movie_price1 } -> 할인가     ${lupin3_the_first.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">줄거리</h3>

	<p class="mv-section2">
		세상의 운명을 바꿀 비밀이 담겨 있는 브레송 다이어리. <br> 어느 날, 다이어리가 전시된 브레송 회고전에 ‘루팡
		3세’의 예고장이 날아들고, <br> 다이어리를 노리는 비밀 조직 역시 고고학도 ‘레티시아’를 이용해 이를 가로채려고
		하는데… <br> 과연, ‘루팡 3세’는 브레송 다이어리를 손에 넣고 그 안에 숨겨진 비밀을 풀 수 있을까?
	</p>


	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/lupin3_the_first/first1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/lupin3_the_first/first2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/lupin3_the_first/first3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/lupin3_the_first/first4.jpg"
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
			src="../../../resources/css/image/detail/animation/lupin3_the_first/actor4.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8"
		src="../../../resources/css/mv_preview/first.mp4" controls autoplay></video>



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
						window.location.href = "/download?fileName=lupin3_the_first.mp4";				 
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