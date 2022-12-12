<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center">
	<div class=" col-9">
		<div class="m-4">
		<h2>주문내역 조회</h2>	
		</div>	
		<div class="mt-5 d-flex justify-content-center">
			<table class="w-100 text-center order-history-table">
				<thead>			
					<tr>
						<th class="col-3">상품 정보</th>
						<th class="col-2">주문 일자</th>
						<th class="col-2">주문 번호</th>
						<th class="col-2">주문 금액</th>
						<th class="col-2">주문 상태</th>
						<th class="col-1"></th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${orvdl}" var="orderItem">
				
					<tr>
						 <td>
						 
						 <a href="/store/product_view?productId=${orderItem.productId}">
						 ${orderItem.productName }</a>
							 <br>
							 <small class="text-secondary">${orderItem.size }</small>
						 </td>
						 <td>
						 <fmt:formatDate value="${orderItem.createdAt }" pattern="yyyy년 MM월 dd일"/>
							 
						 </td>
						 <td>
							 ${orderItem.orderNumber }
						 </td>
						 <td>
							<fmt:formatNumber value="${orderItem.totalPrice }" type="number"/>원<br>
							 <small class="text-secondary">${orderItem.count }개</small>
						 </td>
						 <td>
							${orderItem.state }
						</td>
						<td>	
							 <c:set var="state" value="${orderItem.state }"/>
							 <c:choose>
							 
							 
							 <c:when test="${state eq '상품준비중'}">
							 	<button  type="button" class="btn cancle-order-btn" value="주문취소" 
							 	data-stock-id="${orderItem.stockId }"
							 	data-count="${orderItem.count }"
							 	data-order-item-id="${ orderItem.orderItemId}">주문취소</button>
							 </c:when>
							 <c:when test="${state eq '배송완료'}">
							 	<button  type="button" class="btn change-order-state-btn" value="구매확정"
							 	data-order-item-id="${ orderItem.orderItemId}">구매확정</button>
							 </c:when>
							 <c:when test="${state eq '구매확정' && orderItem.reviewCheck == false}">
							 
							 	<form method="post" action="/review/write_view">
							 	<input type="hidden" name="orderId" value="${orderItem.orderId}"> 
							 	<input type="hidden" name="orderItemId" value="${orderItem.orderItemId}"> 
							 	<input type="hidden" name="productName" value="${orderItem.productName}"> 
							 	<input type="hidden" name="productId" value="${orderItem.productId}"> 
							 	<button type="submit" 
							 	<c:set var="id" value="${orderItem.orderItemId}"/>
							 	class="btn orderhistory-write-review-btn bg-dark text-white" 
							 	data-order-item-id="${ orderItem.orderItemId}" >
							 	리뷰작성</button>
							 	</form>
							 </c:when>
							 
							 </c:choose>
						 </td>
					</tr>	
							
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<a href="/account/mypage_view" type="button" class="btn bg-secondary text-white mt-5">뒤로</a>
	</div>
</div>

<script>
$(document).ready(function() {
	$('.change-order-state-btn').on('click', function() {  // 주문 상태 변경 버튼 클릭
		let orderItemId = $(this).data('order-item-id');
		let changeValue = $(this).val();
		// alert(orderItemId + '&' + changeValue);
		
		$.ajax({
			type:'PUT'
			, url:'/order/order_item_update'
			, data:{'orderItemId':orderItemId, 'changeValue':changeValue}
			, success:function(data){
				if (data.code == 100){
					document.location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(){
				alert('error');
			}
		}); // ajax - end
	});
	
	$('.cancle-order-btn').on('click', function() {  // 주문 취소 클릭
		let orderItemId = $(this).data('order-item-id');
		let stockId = $(this).data('stock-id');
		let count = $(this).data('count');
		//alert(orderItemId + '&' + stockId + '&' + count);

		$.ajax({
			type:'PUT'
			, url:'/order/order_item_cancle'
			, data:{'orderItemId':orderItemId, 'stockId':stockId, 'count':count}
			, success:function(data){
				if (data.code == 100){
					document.location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(){
				alert('error');
			}
		}); // ajax - end
	});
	
}); //ready - end
</script>