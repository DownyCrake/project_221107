<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="my-page-box mt-5 pt-5">
		<h2 class="text-secondary">My page</h2>
		<button class="btn btn-block mb-4 mt-5">Order</button>
		<button id="profileBtn" class="btn btn-block mb-4">Profile</button>
		<button class="btn btn-block mb-4">q&A</button>
		<button class="btn btn-block mb-4">Review</button>
		<a href="/user/sign_out">
			<button class="btn btn-block mb-4 ">Logout</button>
		</a>
	</div>
</div>

<script>
$(document).ready(function() {
	
	$('#profileBtn').on('click', function() {
		location.href="/user/profile_view";
		return;
	}); // profile btn- click - end
	
});//ready

</script>