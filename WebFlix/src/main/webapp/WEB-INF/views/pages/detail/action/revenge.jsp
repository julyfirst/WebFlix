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
			src="../../../resources/css/image/detail/action/revenge/revengemain.jpg"
			alt="">

		<div class="content3">
			<img src="../../../resources/css/image/detail/action/revenge/mo2.jpg"
				alt="">
		</div>
	</div>



	<div class="content4">
		<form method="post" action="/pages/detail/action/revenge">

			<input type="text" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">


			<c:forEach var="revenge" begin="1" end="1" items="${revenge}">
				<input type="hidden" name="movie_id" value="${revenge.movie_id}" />
				<input type="hidden" name="deal_price"
					value="${revenge.movie_price2}" />
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
		<c:forEach var="revenge" begin="1" end="1" items="${revenge}">
		    ${revenge.movie_name}<p>Revenge</p>
		    가격 : ${revenge.movie_price1 } -> 할인가     ${revenge.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">줄거리</h3>

	<p class="mv-section2">
		아름답고 무자비한 복수의 오페라! <br> 부유한 유부남 세 명의 친구들이 사막으로 사냥여행을 떠난다. <br>
		이것이 그들만의 연례행사. 하지만 이번엔 그 중 한 명인 리처드가 애인, ‘젠’을 데려온다 <br> 아름답고 섹시한
		‘젠’은 곧 다른 친구들의 호기심을 자극하게 되고, 급기야 끔찍한 일을 당하게 된다. <br> 극도의 공포감에 휩싸인
		‘젠’은 세 명에게 쫓기며 도망치던 중, 낭떠러지에 떨어지고 만다. <br> 그녀가 죽은 줄로만 알았던 세 명의
		남자, 그러나 그녀는 온데간데없이 사라져 버리는데… <br> 이제, 그녀의 핏빛 복수극이 시작된다!

	</p>

	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/revenge/revenge1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/revenge/revenge2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/revenge/revenge3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/revenge/revenge4.jpg"
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
			src="../../../resources/css/image/detail/action/revenge/actor2.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8" src="../../../mv_preview/revenge.mp4"
		controls autoplay></video>


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
						window.location.href = "/download?fileName=revenge.mp4";				 
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