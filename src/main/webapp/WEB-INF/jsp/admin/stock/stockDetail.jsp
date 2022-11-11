<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">

</head>
<body>
	<div class="container">
		<div class="mt-5">
			<h2>
				<b>${productName}</b>
			</h2>
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
					<c:forEach items="${stockList}" var="stock">
						<tr>
							<td>${stock.size }</td>
							<td><input type="number" value="${stock.quantity}"></td>
							<td><button class="btn update-stock-btn"
									data-stock-id="${stock.id}">수정</button></td>
							<td><button class="btn delete-stock-btn"
									data-stock-id="${stock.id}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<div class="d-flex border-top justify-content-between pt-5">
					<a href="/admin/product/list_view">
						<button class="btn btn-secondary text-white">목록</button>
					</a>
					<div>
						<span class="col-1">사이즈</span><input type="text" id="sizeInput">
						<span class="col-1">수량</span><input type="number"
							id="quantityInput">
						<button class="btn btn-primary text-white" id="stockCreateBtn"
							data-product-id="${productId }">추가</button>
					</div>

				</div>
			</div>
		</div>

	</div>
	<script>
		$(document).ready(function() {

			$('#stockCreateBtn').on('click', function() {
				let productId = $(this).data('product-id');
				let size = $('#sizeInput').val().trim();
				let quantity = $('#quantityInput').val();
				if (size.length < 1) {
					alert('사이즈를 입력해 주세요');
					return;
				}
				if (quantity.length < 1) {
					alert('수량을 입력해 주세요');
					return;
				}
				// alert(size + "--" + quantity);
				$.ajax({
					type : 'PUT',
					url : '/admin/stock/create',
					data : {
						'productId' : productId,
						'size' : size,
						'quantity' : quantity
					},
					success : function(data) {
						if (data.code == 100) {
							alert('success');
							document.location.reload(true);
						} else {
							alert(data.errorMessage);
						}
					},
					error : function() {
						alert('error');
					}

				}); //ajax

			}); // "stockCreateBtn" on click -end

			$('.update-stock-btn').on('click', function() {
				let thisRow = $(this).closest('tr');
				let quantity = thisRow.find('td:eq(1)').find('input').val();
				let stockId = $(this).data('stock-id');
				// alert("수량" + quantity + "스톡아이디" + stockId);

				$.ajax({
					type : 'PUT',
					data : {
						'stockId' : stockId,
						'quantity' : quantity
					},
					url : '/admin/stock/update',

					success : function(data) {
						if (data.code == 100) {
							alert('수정되었습니다');
							document.location.reload(true);
						} else {
							alert(data.errorMessage);
						}
					},
					error : function() {
						alert('error');
					}
				});// ajax -end

				return;
			}); // update-stock-btn -click- end

			$('.delete-stock-btn').on('click', function() {
				let stockId = $(this).data('stock-id');
				
				$.ajax({
					type : 'DELETE',
					data : {
						'stockId' : stockId
					},
					url : '/admin/stock/delete',

					success : function(data) {
						if (data.code == 100) {
							alert('삭제되었습니다');
							document.location.reload(true);
						} else {
							alert(data.errorMessage);
						}
					},
					error : function() {
						alert('error');
					}
				});// ajax -end
			}); // delete-stock-btn - click - end

		});// ready -end
	</script>
</body>
</html>