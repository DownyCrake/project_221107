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
		<h1>주문 관리</h1>
		<div>
			<table class="w-100 text-center admin-order-management-table">
				<thead>			
					<tr>
						<th>주문 번호</th>
						<th>구매자 id</th>						
						<th>주소 정보 </th>
						<th>제품명</th>
						<th>옵션</th>
						<th>개수</th>
						<th>결제금액</th>
						<th>배송상태</th>							
					</tr>
				</thead>
				<tbody>
				<c:set var="orderId" value="0"/>
				
				<c:forEach items="${orderList}" var="order">
					<tr <c:if test="${orderId ne order.orderId}"> class="border-top"</c:if> >
						 <td>
						 	${order.orderNumber}
						 </td>
						 <td>
						 	${order.userId}
						 </td>
						 <td>
							 <c:if test="${orderId ne order.orderId}"> 
							 	 ${order.recipient} <br>
							 	 ${order.zipcode} |
							 	${order.address1} <br>
							 	${order.address2} <br>
							 	 ${order.phoneNumber}
						 	 </c:if>
						 </td>
						 <td>
						 <a href="/admin/product/detail_view?productId=${order.productId}">
						 	${order.productId}.
						 	${order.productName}
						 </a>
						 </td>
						 <td>
						 	${order.size}
						 </td>
						 <td>
						 	
						 <a href="/admin/stock/detail_view?productId=${order.productId}">
						 	${order.count}
						 </a>
						 </td>
						 <td>
						 	${order.totalPrice}원
						 </td>
						 <td>
						 <div
						 <c:choose>
						 <c:when test="${order.state eq '주문취소'}"> class="bg-danger" </c:when>
						 <c:when test="${order.state eq '환불요청'}"> class="bg-danger" </c:when>
						 </c:choose>
						 >
						 	${order.state}
						 </div>
						 	<select class="admin-state-change-selector" data-order-item-id="${order.orderItemId}">
						 		<option>
						 			상품준비중
						 		</option>
						 		<option>
						 			배송중
						 		</option>
						 		<option>
						 			배송완료
						 		</option>
						 		<option>
						 			환불완료
						 		</option>
						 	</select>
						 	<span class="test">d</span>
						 </td>
						 
				<c:set var="orderId" value="${order.orderId }"/>
					</tr>			
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		</div>
		<a href="/admin/main_view" type="button" class="btn bg-secondary text-white mt-5">뒤로</a>
	</div>
<script>
$(document).ready(function() {
		
	$('.admin-state-change-selector').change( function() {
		
		let orderItemId = $(this).data('order-item-id');
		let changeValue = $(this).val();
		
		
	});
	
}); //ready -end
</script>
</body>
</html>