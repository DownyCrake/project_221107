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
		<h2><b>제품 소개 페이지 생성</b></h2>
		<div class="mt-5">
			<form>
				<div class="d-flex m-3"><span class="col-3"><h3>제품명</h3></span>
				<select name="productName" class="form-control">
					<c:forEach items="${productList}" var="product">
						<option data-product-id="${product.id }">${product.productName }</option>
					 </c:forEach>
				</select>
				</div>
				<div class="m-3"><textarea id="content" name="content" rows="10" class="form-control"></textarea></div>
				<div class="d-flex justify-content-end my-3">
					<input type="file" id="file" name="imgList" accept=".jpg,.jpeg,.png,.gif" multiple>
				</div>
				<div class="d-flex justify-content-between">
					<div>
						<a href="/admin/introduction/list_view"
						class="btn btn-secondary text-white m-3">목록</a>
					</div>
					<div>
						<button class="btn btn-primary text-white m-3" id="uploadBtn" >상품 등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

<script>
$(document).ready(function(){ 
	
	
	
});
</script>
</body>
</html>