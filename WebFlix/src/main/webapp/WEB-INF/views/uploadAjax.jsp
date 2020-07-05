<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>Upload with Ajax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>	
	</div>
	
	<button id="uploadBtn">Upload</button>
	
	<div class="uploadResult">
		<ul>
			
		</ul>
	</div>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script>
		$(document).ready(function(){
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 41943040; // 40mb
			
			function checkExtension(fileName, fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
					
				$("#uploadBtn").on("click", function(e){
					
					var formData = new FormData();
					
					var inputFile = $("input[name='uploadFile']");
					
					var files = inputFile[0].files;
					
					console.log(files);
					
					for(var i = 0; i < files.length; i++){
						if(!checkExtension(files[i].name, files[i].size)){
							return false;
						}
						formData.append("uploadFile", files[i]);
					}
					
					var uploadResult = $(".uploadResult ul");
						function showUploadedFile(uploadResultAttr){
							var str = "";
							
							$(uploadResultArr).each(function(i, obj){
								str += "<li>" + obj.fileName + "</li>";
							});
							uploadResult.append(str);
						}
					
					$.ajax({
						url: '/uploadAjaxAction',
						processData: false,
						contentType: false,
						beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data: formData,
						type: 'POST',
						dataType: 'json',
						success: function(result){
							// alert("Uploaded 완료");
							console.log(result);
							showUploadedFile(result); // 업로드 결과 처리 함수
							
							/*
								<input type="file">은 다른 dom 요소들과 조금 다르게 readonly라 안쪽의 내용을 수정 할 수 없기 때문에 별도의 방법으로 초기화 시켜서
								다른 첨부파일을 추가할 수 있도록 만들어야함
							*/
							// 첨부파일 업로드하기전에 아무 내용이 없는 <input type="file"> 객체가 포함된 <div>를 복사(clone) 
							// 업로드 한뒤에는 복사된 객체를 <div> 내에 다시 추가해서 첨부파일 부분을 초기화 시킴
							$(".uploadDiv").html(cloneObj.html());
						}
					});// $.ajax
				});
		});//documtent
	</script>


		
	
</body>
</html>