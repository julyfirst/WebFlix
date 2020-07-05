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
			src="../../../resources/css/image/detail/animation/weaterchild/weatermain2.jpg"
			alt="">

		<div class="content3">
			<img
				src="../../../resources/css/image/detail/animation/weaterchild/ani2.jpg"
				alt="">
		</div>
	</div>



	<div class="content4">
		<form method="post" action="/pages/detail/animation/weater_child">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">

			<c:forEach var="child" begin="10" end="10" items="${child}">
				<input type="hidden" name="movie_id" value="${child.movie_id}" />
				<input type="hidden" name="deal_price" value="${child.movie_price2}" />
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
		<c:forEach var="child" begin="10" end="10" items="${child}">
		    ${child.movie_name}	<p>Weathering With You</p>
		    가격 : ${child.movie_price1 } -> 할인가     ${child.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">줄거리</h3>

	<p class="mv-section2">
		“이제 비는 그치고, 우리의 세상이 빛나기 시작할 거야” <br> 비가 그치지 않던 어느 여름날, <br>
		가출 소년 ‘호다카’는 수상한 잡지사에 취직하게 되고 <br> 비밀스러운 소녀 ‘히나’를 우연히 만난다. <br>
		“지금부터 하늘이 맑아질 거야” <br> 그녀의 기도에 거짓말 같이 빗줄기는 멈추고, <br> 사람들의
		얼굴에 환한 빛이 내려온다. <br> “신기해, 날씨 하나에 사람들의 감정이 이렇게나 움직이다니” <br>
		하지만, 맑음 뒤 흐림이 찾아오듯 <br> 두 사람은 엄청난 세계의 비밀을 마주하게 되는데… <br>
		흐리기만 했던 세상이 빛나기 시작했고, 그 끝에는 네가 있었다.
	</p>


	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/weaterchild/weater1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/weaterchild/weater2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/weaterchild/weater3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/animation/weaterchild/weater4.jpg"
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
			src="../../../resources/css/image/detail/animation/weaterchild/actor6.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8"
		src="../../../resources/css/mv_preview/weater.mp4" controls autoplay></video>

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
						window.location.href = "/download?fileName=weaterchild.mp4";				 
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