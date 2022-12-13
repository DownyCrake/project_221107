<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="my-page-box mt-5 pt-5 mb-5">
		<h2 class="text-secondary">My page</h2>
		<button  class="btn btn-block mb-4 mt-5 order-history-btn">Order</button>
		<button  class="btn btn-block mb-4 profile-btn">Profile</button>
		<button  class="btn btn-block mb-4 address-btn">Address</button>
		<button class="btn btn-block mb-4 qna-view-btn">q&A</button>
		<button class="btn btn-block mb-4">Review</button>
		<a href="/user/sign_out">
			<button class="btn btn-block mb-4 ">Logout</button>
		</a>
	</div>
</div>

<script>
$(document).ready(function() {
	
	$('.profile-btn').on('click', function() {
		location.href="/account/profile_view";
		return;
	}); // profile btn- click - end
	
	$('.address-btn').on('click', function() {
		location.href="/account/address_list_view";
		return;
	});
	
	
	$('.order-history-btn').on('click', function() {
		location.href="/order/order_history_view";
		return;
	}); 
	
	$('.qna-view-btn').on('click', function() {
		location.href="/board/list_view";
		return; 
	});
	
	
});//ready

</script>