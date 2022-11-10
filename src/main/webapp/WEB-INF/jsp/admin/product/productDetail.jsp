<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">

</head>
<body>
<div class="container bg-light">
	<div class="mt-5">
		<h2><b>상품 등록</b></h2>
		<div class="mt-5">
			<div class="d-flex m-3"><span class="col-3"><h3>상품명</h3></span><input type="text" id="productName" class="form-control"></div>
			<div class="d-flex m-3"><span class="col-3"><h3>가격</h3></span><input type="number" id="price" class="form-control"></div>
			<div class="d-flex m-3"><span class="col-3"><h3>카테고리 넘버</h3></span><input type="number" id="category" class="form-control" placeholder="아우터:1 상의:2 바지:3 악세사리:4"></div>
			<div class="d-flex justify-content-end my-3">
				<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif">
			</div>
			<div class="d-flex justify-content-between">
				<div>
					<button class="btn btn-secondary text-white m-3" id="backToList">목록</button>
				</div>
				<div>
					<button class="btn btn-primary text-white m-3" id="createProduct" >상품 등록</button>
				</div>
			</div>
		</div>
	</div>

</div>
<script>
$(document).ready(function() {
	
	$('#backToList').on('click', function(){  // 뒤로가기 버튼
		location.href='/admin/product/list_view';
	});
	
	$('#createProduct').on('click', function() {
		let productName = $('#productName').val().trim();
		if (productName == ''){
			alert("제품명을 입력해주세요.");
			return false;
		}
		let price = $('#price').val().trim();
		if (price == ''){
			alert("가격을 입력해주세요.");
			return false;
		}
		let category = $('#category').val().trim();
		if (category == ''){
			alert("카테고리 넘버를 입력해주세요.");
			return false;
		}
		// alert(productName + ".." + price + ".." + category);
		let file = $('#file').val();
		//alert (file);
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase(); // .뒤의 문자 소문자로 
			if ($.inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) == -1) {  // 찾지 못했을 경우 -1반환
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#file').val(''); //파일을 비운다
				return;
			}
		}
		
		let formData = new FormData();
		formData.append('productName',productName);  // from태그에 name 으로 넣는것과 같음
		formData.append('price', price);
		formData.append('category', category);
		formData.append('file', $('#file')[0].files[0]);		
		
		$.ajax({
			type:'POST'
			, url:'/admin/product/update'
			, data:formData
			, enctype:"multipart/form-data"  // 파일 업로드를 위한 필수 설정
			, processData:false  // 파일 업로드를 위한 필수 설정
			, contentType:false  // 파일 업로드를 위한 필수 설정
			
			, success:function(data){
				if (data.code == 100) {
					alert("수정되었습니다.");
					location.href="/admin/product/list_view";
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(data){
				alert("ERROR");
			}		
			
		}); // ajax -end
		
	}); // createProduct -click -end
	
});// ready -end

</script>
</body>
</html>