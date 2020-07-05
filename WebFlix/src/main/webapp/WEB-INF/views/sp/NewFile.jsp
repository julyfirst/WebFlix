<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	$.get("/examples/media/request_ajax.php", { species: "고양이", name: "나비",
	age: 3, }, // 서버가 필요한 정보를 같이 보냄. function(data, status) {
	$("#text").html(data + "
	<br>" + status); // 전송받은 데이터와 전송 성공 여부를 보여줌. } ); });
</body>
</html>