<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		<h2><b>재고 관리</b></h2>
		<table class="table text-center">
			<thead>
				<tr>
					<td>사이즈</td>
					<td>수량</td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${stocktList}" var="stock">
				<tr>
					<td>${stock.size }</td>
					<td><a href="/admin/product/detail_view?productId=${stock.quantity }">${stock.quantity }</a></td>
					<td><button class="btn" data-product-id="${stock.id}">수정</button></td>
					<td><button class="btn" data-product-id="${stock.id}">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div>
			<a href="/admin/product/list_view">
				<button class="btn btn-secondary text-white m-3" id="backToListBtn">뒤로</button>
			</a>
			사이즈<input type="text" class="form-control" id="sizeInput">
			수량<input type="int" class="form-control" id="quantityInput">
			<button class="btn btn-block btn-primary text-white m-3" id="stockCreateViewBtn">추가</button>  
		</div>
	</div>

</div>
<script>
$(document).ready(function() {
	
	
	
});// ready -end

</script>
</body>
</html>