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
		<h2><b>상품 관리</b></h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th>id</th>
					<th>상품명</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${productList}" var="product">
				<tr>
					<td>${product.id }</td>
					<td><a href="/admin/product/detail_view?productId=${product.id }">${product.productName }</a></td>
					<td><button class="btn stock-list-btn" data-product-id="${product.id}">재고 수정</button></td>
					<td class="col-2">
						<div class="exposure-check-div">
						검색
							<c:choose>
							<c:when test="${product.exposure}">
							<button type="button" name="exposure" value=false 
							class="btn exposure-true-or-false-btn btn-success" data-product-id="${product.id}">가능</button> 
							</c:when>
							<c:otherwise>
							<button type="button" name="exposure" value=true 
							class="btn exposure-true-or-false-btn btn-danger" data-product-id="${product.id}">불가</button> 
							</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
				<div class="d-flex justify-content-center">
			<c:if test="${prevId ne 0 }">
				<a href="/post/post_list_view?prevId=${prevId}" class="mr-5"> &lt;&lt;이전 </a>
			</c:if>
			<c:if test="${nextId ne 0 }">
				<a href="/post/post_list_view?nextId=${nextId}"> 다음&gt;&gt; </a>
			</c:if>
		</div>
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
	$('.stock-list-btn').on('click', function(){  // 재고
		let productId = $(this).data('product-id');
		location.href='/admin/stock/detail_view?productId='+productId;
	});
	
	$('.exposure-true-or-false-btn').on('click', function() {  // 검색 노출 확인 취소 체크 
		let exposure =$(this).val();		
		let productId = $(this).data('product-id');
		$.ajax({
			type:'get'
			, data:{'productId':productId, 'exposure':exposure}
			, url:'/admin/product/update_exposure'

 			, success:function(data) {
				if (data.code == 100){
					document.location.reload(true);
					//$('.exposure-check-div').load(location.href+' .exposure-check-div');   -div만 새로고침시 연속 클릭 버튼 반응 안됨 
					return;
					} else {
					alert(data.errorMessage);
				}
			}
			, error:function() {
				alert('에러');
			}
		});
	}); //end
		
		
}); //ready -end
</script>
</body>
</html>