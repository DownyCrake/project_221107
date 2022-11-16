<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center  p-5">
	<form id="signUpForm" method="post" class="sign-up-box mt-5" action="/user/sign_up">
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
			<div class="form-group m-0">
				<input type="text" id="address" name="address" class="form-control" placeholder="주소">
			</div>	
			<small class="text-danger">&nbsp</small>
			<button type="submit" id="signUpBtn" class="btn btn-block text-secondary">회원가입</button>
	</form>

</div>