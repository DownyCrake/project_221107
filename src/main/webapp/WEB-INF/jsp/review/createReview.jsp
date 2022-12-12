<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="mt-5 col-5">
		<div class="mt-3 ">
			<h5 class="text-dark"><b>${productName }</b></h5>
			
			<div id="reivew-point-div">
				<input type="radio" name="pointSelect"  value=5 id="5pt">
				<label for="5pt">
				★</label>
				<input type="radio" name="pointSelect"  value=4 id="4pt">
				<label for="4pt">
				★</label>
				<input type="radio" name="pointSelect"  value=3 id="3pt">
				<label for="3pt">
				★</label>
				<input type="radio" name="pointSelect"  value=2 id="2pt">
				<label for="2pt">
				★</label>
				<input type="radio" name="pointSelect"  value=1 id="1pt">
				<label for="1pt">
				★</label>
			</div>
			
			<textarea class="w-100 mt-2" id="reviewContent" placeholder="후기를 20자 이상 작성해 주세요." rows=3 maxlength=400 required></textarea>
			
			<div class="d-flex mt-4">
				<a type="button" class="form-control mr-2 text-center text-light bg-dark" href="/order/order_history_view">취소</a>
				<button type="button" class="form-control ml-2 bg-light" id="uploadReviewBtn">등록</button>
			</div>
		</div>
			
	</div>
	
	<input type="hidden" id="orderItemId" value="${orderItemId }">
	<input type="hidden" id="productId" value="${productId }">
	<input type="hidden" id="userId" value="${userId }">
</div>

<script>
$(document).ready(function() {
	$('#uploadReviewBtn').on('click', function() {  // 등록 버튼 클릭
	
		let point = $('input[name=pointSelect]:checked').val(); // null 허용

		let content = $('#reviewContent').val().trim();
		if (content.length < 20) {
			alert('후기를 20자 이상 작성해 주세요.');
			return;
		} else if (content.length > 400) {
			alert('글자수를 초과했습니다.');
			return;
		} 
		let orderItemId = $('#orderItemId').val();
		let productId = $('#productId').val();
		let userId = $('#userId').val();
		if (userId == null) {
			location.href="/user/sign_in_view";
			return;
		}
		$.ajax({
			type:'post'
			, data: {'orderItemId':orderItemId, 'userId':userId, 'productId':productId,
				'content':content, 'point':point}
			, url: '/review/create'
			
			, success:function(data){
				if (data.code == 100){
					location.href='/order/order_history_view';
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