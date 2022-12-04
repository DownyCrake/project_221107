<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center  p-5">
	<div id="signInDiv" class="sign-in-box mt-5">
		<h3 class="text-secondary mb-5">Login</h3>
		<input type="text" id="loginId" name="loginId" maxlength='16' class="form-control mb-5" placeholder="아이디 입력">
		<input type="password" id="password" name="password" maxlength='24' class="form-control mb-5" placeholder="비밀번호 입력">
		<button type="button" id="signInBtn" class="btn btn-block btn-secondary mb-3">로그인</button>
		<button type="button" id="signUpViewBtn" class="btn btn-block btn-light ">회원가입</button>
	</div>
</div>

<script>
$(document).ready(function() {
	
	$('#signUpViewBtn').on('click', function() {
		location.href="/user/sign_up_view";
		return;
	});
	
	$('#signInBtn').on('click', function() {
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val().trim();
		
		if (loginId.length < 1) {
			alert("아이디를 입력해주세요");
			return;
		}
		
		if (password.length < 1) {
			alert("패스워드를 입력해주세요");
			return;
		}
		
		$.ajax({
			type:'POST'
			, url:'/user/sign_in'
			, data:{'loginId':loginId, 'password':password}
			
			, success:function(data){
				if (data.code == 100) {
					location.href="/main_view";
				}
				else{
					alert(data.errorMessage);
				}
			} 
			, error:function(){
				alert("로그인 에러");
			}
			
		}); // ajax
		
	});//signInBtn- click - end
	
	
	$('#password').on("keyup", function (e) {  // 비밀번호에서 엔터로 로그인 
	      if (e.keyCode === 13) {
	          e.preventDefault();
	          $('#signInBtn').click();
	        }
	      });
	
	
}); // ready
</script>