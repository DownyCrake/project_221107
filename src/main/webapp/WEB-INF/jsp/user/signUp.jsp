<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center  p-5">
	<div class="sign-up-box mt-5 ">
			<div class="form-group d-flex m-0">
				<input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디 입력">
				<button type="button" id="loginCheckBtn" class="btn btn-success btn-sm ml-1">중복확인</button>
			</div>	
				<small id="idCheckLength" class="text-danger d-none isDuplicationText">아이디가 4글자 이하입니다.</small>
				<small id="idCheckDuplicated" class="text-danger d-none isDuplicationText">중복된 아이디입니다.</small>
				<small id="idCheckOk"class="text-secondary d-none isDuplicationText">사용가능한 아이디입니다.</small>
				<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호 입력">
			</div>	
			<small class="text-danger">&nbsp</small>
			
			<div class="form-group m-0">
				<input type="password" id="passwordCheck" name="passwordCheck" class="form-control" placeholder="비밀번호 확인">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="name" name="name" class="form-control" placeholder="이름 입력">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="전화번호">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="email" name="email" class="form-control" placeholder="이메일">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="address" name="address" class="form-control" placeholder="주소">
			</div>	
			<small class="text-danger">&nbsp</small>
			<button type="submit" id="signUpBtn" class="btn btn-block text-secondary">회원가입</button>
	</div>

</div>

<script>
$(document).ready(function(){
	
	$('#loginCheckBtn').on('click', function(){
		let loginId = $('#loginId').val().trim();
		//alert(loginId);
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			return;
		}	
		$.ajax({
			url:"/user/is_duplicated_id"
			, data:{"loginId":loginId}
			
			, success:function(data){
				if (data.result){ //중복 ㅇ
					$('#idCheckLength').addClass('d-none');
					$('#idCheckDuplicated').removeClass('d-none');
					$('#idCheckOk').addClass('d-none');
				} else { //중복 x
					$('#idCheckLength').addClass('d-none');
					$('#idCheckDuplicated').addClass('d-none');
					$('#idCheckOk').removeClass('d-none');
				}
			}
			, error:function(e){
				alert("아이디 중복확인에 실패했습니다.");
			}
		});//ajax
		
	}); // 중복확인버튼 클릭
	
	$("#signUpForm").on('submit', function(e){
		e.preventDefault();
		
		let loginId = $("#loginId").val().trim();
		let password = $("#password").val().trim();
		let passwordCheck = $("#passwordCheck").val().trim();
		let name = $("#name").val().trim();
		let email = $("#email").val().trim();
		
		if (loginId.length < 1)	{
			alert("아이디를 입력하세요");	
			return false;
		}
		if (password.length < 1)	{
			alert("비밀번호를 입력하세요");	
			return false;
		}
		if (passwordCheck.length < 1)	{
			alert("비밀번호를 확인하세요");	
			return false;
		}
		if (passwordCheck != password )	{
			alert("비밀번호가 일치하지 않습니다");	
			return false;
		}
		if (name.length < 1)	{
			alert("이름을 입력하세요");
			return false;
		}
		if (email.length < 1)	{
			alert("이메일을 입력하세요");
			return false;
		}	
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 다시 해주세요")	
			return false;
		}
		
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url, params).done(function(data){
			if (data.code ==100){
				alert("가입을 환영합니다! 로그인 해주세요");
				location.href="/user/sign_in_view";
			} else {
				alrer("가입에 실패했습니다");
			}
			
		});//done
			
	}); // 회원가입 버튼 클릭
	
});//ready
</script>
