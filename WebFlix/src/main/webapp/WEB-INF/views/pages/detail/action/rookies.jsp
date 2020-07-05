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
			src="../../../resources/css/image/detail/action/rookies/momo2.jpg"
			alt="">

		<div class="content3">
			<img src="../../../resources/css/image/detail/action/rookies/mo1.jpg"
				alt="" />
		</div>
	</div>

	<div class="content4">
		<form method="post" action="/pages/detail/action/rookies">

			<input type="hidden" name="member_id"
				value='<sec:authentication property="principal.member.id"/>'
				readonly="readonly">

			<c:forEach var="rookies" begin="0" end="0" items="${rookies}">
				<input type="hidden" name="movie_id" value="${rookies.movie_id}" />
				<input type="hidden" name="deal_price"
					value="${rookies.movie_price2}" />
			</c:forEach>
		
			<button type="submit" class="button1">구매</button>	
			<a id="downloadbtn" class="button2 downloadbtn">파일다운</a> 

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		
	
	
		
<!-- 	<form id="downloadbtn" method="get">
				<a href="rookies.mp4" class="button2 downloadbtn">파일다운</a>
		</form>  -->
	
		
	</div>
</div>

<div class="content5">
	<h2>
		<c:forEach var="rookies" begin="0" end="0" items="${rookies}">
		    ${rookies.movie_name}<p>The Rookies</p>
		    가격 : ${rookies.movie_price1 } -> 할인가     ${rookies.movie_price2 }
	    </c:forEach>
	</h2>
</div>
</div>

<section>
	<h3 class="mv-section1">줄거리</h3>

	<p class="mv-section2">
		“발을 들여놓으면 빠져나갈 수 없어” <br> 위험천만 익스트림 스포츠를 즐기는 관종 ‘펑’(왕대륙)은 <br>
		마천루의 꼭대기를 점령하기 위한 사투를 벌이다가 <br> 우연한 기회(?)로 전 세계를 장악하려는 국제범죄조직들의 <br>
		비밀 거래 현장에 착륙하게 되고 <br> 그들을 쫓던 국제첩보조직 ‘팬텀’의 보스 ‘브루스’(밀라 요보비치)에 의해
		<br> 세계 테러를 막을 비밀 스파이로 스카우트되는데… 대책 없는 무근본 스파이들의 <br> 기상천외한
		첩보 작전이 시작된다!
	</p>

	<h4 class="mv-section3">스틸컷</h4>
	<div class="mv-section4">
		<input type="radio" name="pos" id="pos1"> <input type="radio"
			name="pos" id="pos2"> <input type="radio" name="pos"
			id="pos3"> <input type="radio" name="pos" id="pos4">
		<ul class="mv1">
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/rookies/ro1.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/rookies/ro2.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/rookies/ro3.jpg"
				alt=""></li>
			<li class="mv2"><img
				src="../../../resources/css/image/detail/action/rookies/ro4.jpg"
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
			src="../../../resources/css/image/detail/action/rookies/actor.png"
			alt="">
	</div>

	<h5 class="mv-section7">예고편</h5>

	<video class="mv-section8" src="../../../mv_preview/roo.mp4" controls
		autoplay></video>


</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script>
		$(document).ready(function(){
			
			 $(".downloadbtn").on("click", function(e){
				 
				   e.preventDefault();
				  /*  download(); */
				   /* $('#downloadbtn').append("<input type='hidden' name='fileName' value='" + $(this).attr('href') + "'/>");
		           $('#downloadbtn').attr("action", "/download");
		           $('#downloadbtn').submit();*/
		        /* function download(fileName) {
		               window.location.href = "/download?fileName=rookies.mp4";
		        } */
			 	 $.ajax({
					url: '/download',					
					type: 'get',					
					datatype: 'json',
					success: function(data){
						window.location.href = "/download?fileName=rookies.mp4";				 
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