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
<div class="container">
	<div class="mt-5">
		<h2><b>상품 관리</b></h2>
		<table class="table text-center">
			<thead>
				<tr>
					<td>id</td>
					<td>상품명</td>
					<td></td>
				</tr>
			</thead>
			<hbody>
				<tr>
				</tr>
			</hbody>
		</table>
		<div>
			<button class="btn btn-secondary text-white m-3" id="backToListBtn">뒤로</button>
			<button class="btn btn-block btn-primary text-white m-3" id="productCreateViewBtn">상품 등록</button>  
		</div>
	</div>

</div>
<script>
$(document).ready(function() {
	$('#backToListBtn').on('click', function(){  // 뒤로가기 버튼
		location.href='/admin/main_view';
	});
	$('#productCreateViewBtn').on('click', function(){  // 뒤로가기 버튼
		location.href='/admin/product/create_view';
	});
	
}); //ready -end
</script>
</body>
</html>