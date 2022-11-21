<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 소개 페이지 생성</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">

</head>
<body>

<div class="container bg-light">
	<div class="mt-5">
		<h2><b>제품 소개 페이지 관리</b></h2>
		<div class="mt-5">
			<form>
				<div class="d-flex m-3"><span class="col-3"><h3>제품명</h3></span>
				<select name="productName" class="form-control">
					<c:forEach items="${productList}" var="product">
						<option value="${product.id}">${product.id } : ${product.productName }</option>
					 </c:forEach>
				</select>
				</div>
				<div class="m-3"><textarea id="content" name="content" rows="10" class="form-control"></textarea></div>
				<div class="d-flex justify-content-end my-3">
					<input type="file" id="file" name="images" accept=".jpg,.jpeg,.png,.gif" multiple>
				</div>
				<div class="d-flex justify-content-between">
					<div>
						<a href="/admin/main_view"
						class="btn btn-secondary text-white m-3">목록</a>
					</div>
					<div>
						<button type="button" class="btn btn-primary text-white m-3" id="uploadBtn" >확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

<script>
$(document).ready(function(){ 
	let inputFileList = new Array();
	$('input[name=images]').on('change', function(e) {
		　　let files = e.target.files;
		　　let filesArr = Array.prototype.slice.call(files);

		　　filesArr.forEach(function(e) { 
		　　　　inputFileList.push(e);    
		　　});
		});
	
	$('#uploadBtn').on('click', function() {
		
		let productId = $('select[name=productName]').val();
		let content = $('#content').val().trim();
		
		let formData = new FormData();
		
		formData.append('productId', productId);
		formData.append('content', content);
		for (let i = 0; i < inputFileList.length; i++) {
		　　formData.append("images", inputFileList[i]);  
		}
		
		$.ajax({
			type:'POST'
			, data: formData
			, url: '/admin/store/update'
			, enctype:"multipart/form-data"  // 파일 업로드를 위한 필수 설정
			, processData:false  // 파일 업로드를 위한 필수 설정
			, contentType:false  // 파일 업로드를 위한 필수 설정
			
			, success:function(data){
				if (data.code == 100) {
					alert("스토어에 등록되었습니다.");
					location.href="/admin/main_view";
				} else {
					alert("에러. 관리자에게 문의해주세요.");
				}
			}
			, error:function(){
				alert("ERROR");
			}	
		}); // ajax - end
			
	});// uploadBtn - click - end
	
	
});
</script>
</body>
</html>