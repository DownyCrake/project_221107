<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center  p-5">
	<form id="signUpForm" method="post" class="input-box mt-5" action="/user/sign_up">
			<div class="form-group d-flex m-0">
				<input type="text" id="loginId" name="loginId" class="form-control " maxlength='16' placeholder="아이디 입력">
			</div>	
				<small id="idValidation" class="text-danger d-none ">영문 소문자 또는 숫자 4~16자로 입력하세요.</small>
				<small id="idCheckDuplicated" class="text-danger d-none ">중복된 아이디입니다.</small>
				<small id="idCheckOk"class="text-secondary d-none ">사용가능한 아이디입니다.</small>
				<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="password" id="password" name="password" class="form-control" maxlength='24' placeholder="비밀번호 입력">
			</div>	
				<small id="passwordRegText" class="text-danger d-none ">영문대소문자와 숫자 또는 특수문자 8~24자로 입력하세요.</small>
			<small class="text-danger">&nbsp</small>
			
			<div class="form-group m-0">
				<input type="password" id="passwordCheck" class="form-control" placeholder="비밀번호 확인">
			</div>	
				<small id="passChecktext" class="text-danger d-none ">패스워드가 일치하지 않습니다.</small>
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="name" name="name" class="form-control" maxlength='10' placeholder="이름 입력">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control" maxlength='16' placeholder="전화번호">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="email" name="email" class="form-control" placeholder="이메일">
			</div>	
			<small id="emailCheckText" class="text-danger d-none">유효한 이메일을 입력해 주세요.</small>
			<small class="text-danger">&nbsp</small>
			<button type="submit" id="signUpBtn" class="btn btn-block text-secondary">회원가입</button>
	</form>

</div>

<script>
$(document).ready(function(){
	
	let idCheck = RegExp(/^[a-z0-9]{4,12}$/);   // 영문소문자+숫자 4~12
	let passCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/);	// 대소문자+숫자+특수문자 8~24 
	// let nameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);	// 한글+영어+숫자 2~10
	let phoneCheck = RegExp(/^(0[2-8][0-5]?|01[01346-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/);	// 전화번호 정규식 
	let emailCheck = RegExp(/^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/); // 이메일 정규식
	
	let idSubmit = true; // true-틀림  false-승인
	
	$('#loginId').blur(function(){
		
		let loginId = $('#loginId').val().trim();
		if (idCheck.test(loginId) == false ) {
			$('#idValidation').removeClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			idSubmit = true;
			return;
		} 	
		
		$.ajax({
			url:"/user/is_duplicated_id"
			, data:{"loginId":loginId}
			
			, success:function(data){
				if (data.result){ //true > 중복 o
					$('#idValidation').addClass('d-none');
					$('#idCheckDuplicated').removeClass('d-none');
					$('#idCheckOk').addClass('d-none');
					idSubmit = true;
				} else { //중복 x
					$('#idValidation').addClass('d-none');
					$('#idCheckDuplicated').addClass('d-none');
					$('#idCheckOk').removeClass('d-none');
					idSubmit = false;
				}
			}
			, error:function(e){
				alert("아이디 중복확인에 실패했습니다.");
			}
		});//ajax
	}); // 중복확인버튼 blur
	
	$('#password').blur(function() {
		let password = $("#password").val().trim();
		let passwordCheck = $("#passwordCheck").val().trim();
		if (passCheck.test(password) == false ){ // 유효성 실패 
			$('#passwordRegText').removeClass('d-none'); // 경고
			passwordSubmit = true;  // submit 막힘
		} else { // 유효성 성공
			$('#passwordRegText').addClass('d-none'); // 경고 삭제
			if (passwordCheck != password )	{ // 패스워드 체크 실패
				$('#passChecktext').removeClass('d-none'); //경고 추가
				passwordSubmit = true; // submit 막힘
			} else { // 패스워드 체크 성공
				$('#passChecktext').addClass('d-none'); // 경고 삭제
				passwordSubmit = false; // 비밀번호 유효성 통과 > 체크 통과 > submit OK
			}
		}
	}); // 패스워드 유효성
	
	$('#passwordCheck').blur(function() {
		let passwordCheck = $("#passwordCheck").val().trim();
		let password = $("#password").val().trim();
		if (passwordCheck != password )	{ // 중복체크 실패
			$('#passChecktext').removeClass('d-none');
			passwordSubmit = true; // submit 막음
		}else {
			$('#passChecktext').addClass('d-none');
			if (passCheck.test(password) ){
			passwordSubmit = false;}
		}
	}); // 패스워드 체크
	
	$('#email').blur(function(){
		let email = $('#email').val().trim();
		if (emailCheck.test(email) == false){
			$('#emailCheckText').removeClass('d-none');
		} else {
			$('#emailCheckText').addClass('d-none');
		}
	}); // 이메일 체크

	
	$("#signUpForm").on('submit', function(e){   // 가입 버튼 클릭 
		e.preventDefault();
		

		if (idSubmit == true) {
			alert('아이디를 확인해주세요');
			return false;
		}

		let loginId = $("#loginId").val().trim();
		let password = $("#password").val().trim();
		let passwordCheck = $("#passwordCheck").val().trim();
		let name = $("#name").val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		let email = $("#email").val().trim();
		
		if (loginId.length < 1)	{
			alert("아이디를 입력하세요");	
			return false;
		}
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 다시 해주세요")	
			return false;
		}
		
		if (passCheck.test(password) == false ){ 
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
		
		if (phoneCheck.test(phoneNumber) == false ){
			alert("전화번호를 확인해주세요");
			return false;
		} 
		
		if (emailCheck.test(email) == false){
			alert("이메일이 유효하지 않습니다.");
			return false;
		}	
		
		
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url, params).done(function(data){
			if (data.code == 100){
				alert("가입을 환영합니다! 로그인 해주세요");
				location.href="/user/sign_in_view";
			} else {
				alrer("가입에 실패했습니다");
			}
			
		});//done
		
			
	}); // 회원가입 버튼 클릭
	
});//ready
</script>
