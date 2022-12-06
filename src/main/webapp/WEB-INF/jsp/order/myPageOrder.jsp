<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center">
	<div class=" col-8">
		<div class="m-4">
		<h2>주문내역 조회</h2>	
		</div>	
		<div class="mt-5 d-flex justify-content-center">
			<table class="w-100 text-center order-history-table">
				<thead>			
					<tr>
						<th>상품 정보</th>
						<th>주문 일자</th>
						<th>주문 번호</th>
						<th>주문 금액</th>
						<th>주문 상태</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${orvdl}" var="orderItem">
					<tr>
						 <td>
							 ${orderItem.productName }<br>
							 ${orderItem.size }
						 </td>
						 <td>
							 ${orderItem.createdAt }
						 </td>
						 <td>
							 ${orderItem.orderNumber }
						 </td>
						 <td>
							${orderItem.totalPrice }<br>
							 ${orderItem.count }개
						 </td>
						 <td>
							 ${orderItem.state }
						 </td>
					</tr>			
				</c:forEach>
				</tbody>
			</table>
		</div>
	
	</div>
</div>

<script>


</script>