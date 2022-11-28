<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="d-flex justify-content-center">
	<div class="cart-div mt-5 pt-5 col-6">
		<h1>Cart</h1>
			<form method="post" action="/order/order_view" >
		<table class="table border-bottom text-center mt-5 cart-table">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAllCart"></th>
					<th></th>
					<th>상품명</th>
					<th>옵션</th>
					<th>가격</th>
					<th>수량</th>
					<th>주문관리</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="cart" varStatus="status">
					<tr>
						<td><input type="checkbox" name="cartId" class="check-cart" value="${cart.cartId}"></td>
						<td class="p-0"><img src="${cart.imagePath}" alt="상품 이미지"
							class="cart-thumbnail"></td>
						<td>${cart.productName}</td>
						<td>${cart.size}</td>
						<td>${cart.price}</td>
						<td>
						<a href="#" class="minusBtn fix mr-2">-</a> 
						<input type="text" value="${cart.count}" class="input-count" maxlength="1" readonly> 
						<a href="#" class="plusBtn fix" data-quantity="${cart.quantity}">+</a>
						</td>
						<td>
							<button type="button" class="oder-delete-btn" data-cart-id = "${cart.cartId}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="submit" class="cart-oder-btn mt-5">주문하기</button>
		</div>
			</form>
	</div>
</div>

<script>
	$(document).ready(function() {

		$(".fix").click(function(e) { // 스크롤 방지 코드 
			e.preventDefault();
		});

		$('.plusBtn').on('click', function() { // 플러스 버튼 
			let thisRow = $(this).closest('tr');
			let quantity = $(this).data('quantity');
			let value = parseInt(thisRow.find('td:eq(5)').find('input').val());
			if (value >= quantity) {
				alert("구매 가능 수량 초과");
				return;
			}
			if (value < 9) {
				thisRow.find('td:eq(5)').find('input').val(value + 1);
				return;
			}
		});

		$('.minusBtn').on('click', function() { // 마이너스 버튼
			let thisRow = $(this).closest('tr');
			let value = parseInt(thisRow.find('td:eq(5)').find('input').val());			
			if (value > 1) {
				thisRow.find('td:eq(5)').find('input').val(value - 1);
				return;
			}
		});
		
		
		$('#checkAllCart').on('click', function() {
			if ($(this).is(':checked')){
			$('.check-cart').prop("checked", true);
			return;
			}
		});
		
		$('.check-cart').on('click',function() {
			if ($('#checkAllCart').is(':checked') ) {
				$('#checkAllCart').prop("checked", false);
				return;
			}
		});
		
		
		$(".oder-delete-btn").on('click', function() {
			
			if( !confirm("장바구니에서 삭제하시겠습니까?")  ){
			    return;
			} else {
				let cartId = $(this).data('cart-id');
				
				$.ajax({
					type:'delete'
					, url: '/cart/delete' 
					, data:{'cartId':cartId}
					, success:function(data) {
						alert('장바구니에서 삭제되었습니다.');
						document.location.reload(true);
					}
					, error:function() {
						alert('에러');
					}
				});

			}
		}); // delete btn -end
		
		
					
		
	}); // ready-end
</script>
