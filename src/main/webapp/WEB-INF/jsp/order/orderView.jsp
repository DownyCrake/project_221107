<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="d-flex justify-content-center">
<div class="w-75">
	<h1 class="mt-3">Order</h1>
	<div class="order-view-address-div mt-5">
		<div class="d-flex border-top pt-2">
		
		<c:set var="radioselect" value="0" />
		
		<c:forEach items="${addrList}" var="addr" varStatus="status">	<!-- 주소목록 반복 호출-->
		<c:set var="radioselect" value="1" />
			<div class="addr-radio-div">
			<input type="radio" name="address" value="${addr.id}"
			data-recipient ='${addr.recipient}' 
			data-shippingAddress = '${addr.shippingAddress}'
			data-zipcode = '${addr.zipcode}'
			data-address1 = '${addr.address1}'
			data-address2 = '${addr.address2}'
			data-phone-number = '${addr.phoneNumber}'
			<c:if test="${status.first }">checked</c:if>
				>
				
			<c:if test="${status.first }">
				<c:set var="recipient" value="${addr.recipient}" />
				<c:set var="zipcode" value="${addr.zipcode}" />
				<c:set var="address1" value="${addr.address1}" />
				<c:set var="address2" value="${addr.address2}" />
				<c:set var="phoneNumber" value="${addr.phoneNumber}" />
			</c:if>
			
			<c:choose>
				<c:when test="${fn:length(addr.shippingAddress) > 8}" >
				<small>${fn:substring(addr.shippingAddress, 0, 7)} ..</small>
				</c:when>
				<c:otherwise>
				<small>${addr.shippingAddress}</small>
				</c:otherwise>
			</c:choose>
			</div>
		</c:forEach>
		
			<div class="addr-radio-div">
				<input type="radio" name="address" value="new"
				<c:if test="${radioselect eq 0 }">checked</c:if>
					> 
				<small> 신규 배송지</small>
			</div>
			
		</div>
		
		<div class="input-address-manual-div col-6 p-0">
			<div class="d-flex mt-3">
				<span class="col-2">수령인</span>
				<input type="text" name="recipient" id="recipient" class="form-control " maxlength='25' value="${recipient}">
			</div>
			<div class="d-flex mt-3">
				<span  class="col-2">전화번호</span> 
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control" value="${phoneNumber}">
			</div>
			<div class="d-flex mt-3">
				<span  class="col-2">우편번호</span>
				<div class="d-flex">
					<input type="text" id="zipcode" class="form-control col-5 mr-3" value="${zipcode}" readonly>
					<button type="button" id="findAdrBtn" class="btn">주소 찾기</button>
				</div>
			</div>
			<div>
				<span>주소</span>		
				<input type="text" id="address1" name="address1" class="form-control" value="${address1}" readonly>	
			</div>			
			<div>
				<span>상세주소</span>		
				<input type="text" id="address2" name="address2" class="form-control" value="${address2}" maxlength='200'>	
			</div>			
		</div>
	</div>
		<table class="table text-center mt-5 border-bottom order-list-table">
		<thead>
			<tr>
				<th class="col-6">상품 정보</th>
				<th>사이즈</th>
				<th>수량</th>
				<th>주문 금액</th>
			</tr>
		</thead>
		<tbody>
					<c:set var="sumprice" value="0"/>
		<c:forEach items="${orders.orderViewList}" var="order" varStatus="status">		
			
			<tr>
				<td>
			<input type="hidden"  name="productId" value="${order.productId }">
			<input type="hidden"  name="stockId" value="${order.stockId }">
			<input type="hidden"  name="count" value="${order.count }">
			<input type="hidden"  name="totalprice" value="${order.totalprice }">
			
					<img src="${order.imagePath }" alt="상품 썸네일" class="cart-thumbnail">
					${order.productName }
				</td>
				<td>
					 ${order.size}
				</td>
				<td>
					${order.count } 개
				</td>
				<td>
					<fmt:formatNumber value="${order.totalprice }" type="number"/> 원
					<c:set var="sumprice" value="${sumprice + order.totalprice}"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<div class="mb-5 mt-5">
				<button type="button" id="paymentBtn" class="btn btn-primary w-100" 
					data-sum-price="${sumprice}">
				<fmt:formatNumber value="${sumprice}" type="number"/>원 결제
				</button>
		</div>
						
		
	
	<c:forEach items="${orders.cartId}" var="cartid" varStatus="status">	<!-- cartid 꺼내기 -->
		<input type="hidden" class="cart-id" value="${cartid }">
	</c:forEach>
	<input type="hidden" name="cartIdLength" value="${fn:length(orders.cartId)}">
	<input type="hidden" name="ordersLength" value="${fn:length(orders.orderViewList)}">
	
</div>	
</div>

<script>
$(document).ready(function(){
	
	let phoneCheck = RegExp(/^(0[2-8][0-5]?|01[01346-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/);	// 전화번호 정규식 

	$('input:radio[name=address]').on('click', function(){ // 주소 선택
		if ($(this).val() != 'new'){
			
		let recipient = $(this).data('recipient');
		let zipcode = $(this).data('zipcode');
		let address1 = $(this).data('address1');
		let address2 = $(this).data('address2');
		let phoneNumber = $(this).data('phone-number');
		
		$('#recipient').val(recipient);
		$('#zipcode').val(zipcode);
		$('#address1').val(address1);
		$('#address2').val(address2);
		$('#phoneNumber').val(phoneNumber);
		
		$('#recipient').attr('readonly',true);
		$('#address2').attr('readonly',true);
		$('#phoneNumber').attr('readonly',true);
		} else {
			
			$('#recipient').val('');
			$('#zipcode').val('');
			$('#address1').val('');
			$('#address2').val('');
			$('#phoneNumber').val('');
			
			$('#recipient').attr('readonly',false);
			$('#shippingAddress').attr('readonly',false);
			$('#address2').attr('readonly',false);
			$('#phoneNumber').attr('readonly',false);
		}
		
	}); // radio- select- end
	
	$('#paymentBtn').on('click', function() {
		
		//주소 선택 체크
		
 		let recipient = $('#recipient').val();
		if (recipient == '') {
			alert('수령인을 입력하세요.');
			return;
		}
		let zipcode = $('#zipcode').val();
		if (zipcode == ''){
			alert('우편번호를 입력하세요.');
			return;
		}
		let address1 = $('#address1').val();
		let address2 = $('#address2').val();
		if (address2 == '') {
			alert('상세주소를 입력하세요.');
			return;
		} 
		let phoneNumber = $('#phoneNumber').val();
		if (phoneCheck.test(phoneNumber) == false) {
			alert('전화번호를 입력하세요.');
			return;
		}
		
		let data = {};
		
		data['recipient'] = recipient;
		data['zipcode'] = zipcode;
		data['address1'] = address1;
		data['address2'] = address2;
		data['phoneNumber'] = phoneNumber;

		
		let cartLength = $('input[name=cartIdLength]').val();
		for (var i = 0; i < cartLength; i++ ){
			data['cartId['+i+']'] = $('.cart-id').eq(i).val();
		}
		
 		let ordersLength = $('input[name=ordersLength]').val();
		for (var i = 0; i < ordersLength; i++ ){
		data['orderItemList['+i+'].productId'] = $('input[name=productId]').eq(i).val();
		data['orderItemList['+i+'].stockId'] = $('input[name=stockId]').eq(i).val();
		data['orderItemList['+i+'].count'] = $('input[name=count]').eq(i).val();
		data['orderItemList['+i+'].totalPrice'] = $('input[name=totalprice]').eq(i).val();
		}
		 /* console.log(data); */ 
		$.ajax({
			url: "/order/create",
			data: data,
			type: 'POST',
			success:function(data){
				if (data.code == 111) {
					alert(data.errorMessage);
				} else if (data.code == 100) {
					alert('결제 성공');
					location.href="/order/order_result_view?orderNumber=" + data.orderNumber;
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(){
				alert('에러발생');
			}
			
		}); // ajax - end
	});
	
});//ready-end
</script>