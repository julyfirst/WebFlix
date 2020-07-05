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
			src="../../../resources/css/image/detail/horror/this_house/streetmain.jpg"
			alt="">

		<div class="content3">
			<img
				src="../../../resources/css/image/detail/horror/this_house/fe2.jpg"
				alt="">
		</div>
	</div>



	<div class="content4">
		<form method="post" action="/pages/detail/horror/this_house">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">

			<c:forEach var="house" begin="6" end="6" items="${house}">
				<input type="hidden" name="movie_id" value="${house.movie_id}" />
				<input type="hidden" name="deal_price" value="${house.movie_price2}" />
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
		<c:forEach var="house" begin="6" end="6" items="${house}">
		    ${house.movie_name}	<p>Malasana 32 , 32 Malasana Street</p>
		    가격 : ${house.movie_price1 } -> 할인가     ${house.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">줄거리</h3>

	<p class="mv-section2">
		한 번 보면 잊히지 않는 충격 실화! <br> 1976년 스페인 마드리드, 새 출발을 꿈꾸며 도시로 이주한 6명의
		가족. <br> 그들이 이사한 ‘그 집’에는 수상한 기운이 감돌기 시작하고, <br> 마침내 가족의 꿈은
		악몽이 되고 마는데...
	</p>


	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/this_house/street1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/this_house/street2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/this_house/street3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/horror/this_house/street4.jpg"
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
			src="../../../resources/css/image/detail/horror/this_house/actor12.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8"
		src="../../../resources/css/mv_preview/street.mp4" controls autoplay></video>

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
						window.location.href = "/download?fileName=this_house.mp4";				 
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