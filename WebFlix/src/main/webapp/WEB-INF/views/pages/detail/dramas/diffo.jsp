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
			src="../../../resources/css/image/detail/dramas/diffo/diffomain.jpg"
			alt="">

		<div class="content3">
			<img src="../../../resources/css/image/detail/dramas/diffo/mel2.jpg"
				alt="">
		</div>
	</div>



	<div class="content4">
		<form method="post" action="/pages/detail/dramas/diffo">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">

			<c:forEach var="diffo" begin="3" end="3" items="${diffo}">
				<input type="hidden" name="movie_id" value="${diffo.movie_id}" />
				<input type="hidden" name="deal_price" value="${diffo.movie_price2}" />
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
		<c:forEach var="diffo" begin="4" end="4" items="${diffo}">
		    ${diffo.movie_name}<p>diffo</p>
		    가격 : ${diffo.movie_price1 } -> 할인가     ${diffo.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">영화정보</h3>

	<p class="mv-section2">
		1979년에 사는 여대생 ‘소은’ <br> 2000년에 사는 남학생 ‘인’ <br> 개기월식이 이루어지던 날
		<br> 스며든 달빛과 함께 낡은 무전기에 수신호가 울린다. <br> “아, 아, 수신합니다” <br>
		다른 시간 속에 놓여진 두 사람은 <br> 무전을 통해 매일 밤 이야기를 나누며 <br> 같은 사랑을 품게
		되는데… <br> 시간을 넘어 당신을 만나고 싶습니다.
	</p>


	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/diffo/diffo1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/diffo/diffo2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/diffo/diffo3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/dramas/diffo/diffo4.jpg"
				alt=""></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label> <label for="pos2"></label> <label
				for="pos3"></label> <label for="pos4"></label>
		</p>
	</div>

	<h5 class="mv-section5">배우</h5>
	<div class="mv-section6">
		<img src="../../../resources/css/image/detail/dramas/diffo/actor8.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8"
		src="../../../resources/css/mv_preview/roo.mp4" controls autoplay></video>

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
						window.location.href = "/download?fileName=diffo.mp4";				 
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