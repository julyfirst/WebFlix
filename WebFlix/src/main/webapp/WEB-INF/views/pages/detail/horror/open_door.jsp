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
			src="../../../resources/css/image/detail/horror/open_door/openmain.jpg"
			alt="">

		<div class="content3">
			<img
				src="../../../resources/css/image/detail/horror/open_door/fe3.jpg"
				alt="">
		</div>
	</div>

	<div class="content4">
		<form method="post" action="/pages/detail/horror/open_door">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">

			<c:forEach var="door" begin="6" end="6" items="${door}">
				<input type="hidden" name="movie_id" value="${door.movie_id}" />
				<input type="hidden" name="deal_price" value="${door.movie_price2}" />
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
		<c:forEach var="door" begin="7" end="7" items="${door}">
		    ${door.movie_name}	<p>Tvar , Stray</p>
		    가격 : ${door.movie_price1 } -> 할인가     ${door.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">줄거리</h3>

	<p class="mv-section2">
		사라진 아들, 뒤바뀐 아이… <br> 흔들리지 마라! <br> 절대, 사랑에 빠지지 마라! <br>
		6살 어린 아들이 흔적도 없이 실종됐다. 이고르와 아내 폴리나는 3년 동안 미친 듯이 아들을 찾아다니지만 <br>
		시체도, 아무런 단서도 발견하지 못한다. 절망에 빠져 집으로 돌아오는 차 안, 부부는 길에서 아들 또래의 <br>
		고아 소년을 발견하고 이끌리듯 집으로 데려온다. 아이에게 사랑을 쏟을수록 행동과 얼굴까지 점점 실종된 <br> 아들과
		똑같이 닮아가는 아이를 보며 혼란을 느끼는 이고르. 하지만 아이의 모습이 아들처럼 변해갈수록 <br> 주변에 기이한
		일들이 자꾸 벌어지고 급기야 아내 폴리나는 공포로 이상증세까지 보이는데... <br> 아이를 향한 사랑과 공포
		사이에서 갈등하던 이고르는 결국 아이의 정체를 쫓기 시작하고 드러나는 충격적인 <br> 비밀들. 공포는 걷잡을 수
		없이 충격적인 엔딩을 향해 극으로 치닫기 시작한다.
	</p>


	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/open_door/open1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/open_door/open2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/open_door/open3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/open_door/open4.jpg"
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
			src="../../../resources/css/image/detail/horror/open_door/actor11.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8"
		src="../../../resources/css/mv_preview/open.mp4" controls autoplay></video>

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
						window.location.href = "/download?fileName=open_door.mp4";				 
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