<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    

<div class="d-flex justify-content-center">
	<div class="address-list-div  mt-5 pt-5 col-7">
		<h1 class="text-secondary">배송지 관리</h1>
		<table	class="table text-center mt-5">
			<thead>
				<tr>
					<th>배송지</th>
					<th>주소</th>
					<th>연락처</th>
					<th></th>
				</tr>			
			</thead>
			<tbody>
				<c:forEach items="${addressList}" var="address" varStatus="status">
					<tr>
						<td>
							<div>
								<div>${address.recipient}</div>  
								<div class="text-secondary">${address.shippingAddress }</div>
							</div>
						</td>
						<td>${address.address1} *** </td>
						<td>${address.phoneNumber } </td>
						<td>
							<button type="button" data-address-id="${address.id}" class="deleteAdrBtn bg-white">삭제</button>
						</td>
					</tr>
				</c:forEach>					
					
			</tbody>		
		</table>
		<button type="button" class="mt-5" id="addAdrViewBtn" href="#" data-user-id="${userId}">배송지 등록</button>
		
	</div>
</div>

<script>
$(document).ready(function() {
	$('#addAdrViewBtn').on('click', function() {
		let userId = $(this).data('user-id');
		$.ajax({
			type:'get'
			,url: '/address/count'
			, data: {'userId':userId}
			, success:function(data){
				if (data.code == 100) {
					location.href="/account/address_create_view";
				} else if (data.code == 200) {
					alert('등록 가능한 개수를 초과했습니다.');
					return;
				} 
			}
			, error:function(){
				alert('error');
			}
		});
		
		
		
	});
	
$('.deleteAdrBtn').on('click', function() {
	addressId = $(this).data('address-id');
	if( confirm("주소를 삭제하시겠습니까?")  ){
		$.ajax({
			type:'delete'
			, url:'/address/delete'
			, data:{'addressId':addressId}
			, success:function(){
				alert('삭제되었습니다.');	
				document.location.reload(true);
			}
			, error:function() {
				alert('에러');
			}
		});
	} else {
		return;	
	}
});
	
}); //document - ready - end
</script>