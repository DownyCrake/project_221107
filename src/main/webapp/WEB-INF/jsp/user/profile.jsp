<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="d-flex justify-content-center  p-5">
	<div class="sign-up-box mt-5">
			<h2 class="mb-5 text-secondary">Profile</h2>
			<div class="form-group m-0">
			<span class="text-secondary">비밀번호</span>
				<input type="password" id="password" name="password" class="form-control" maxlength='24'>
			</div>	
				<small id="passwordRegText" class="text-danger d-none ">영문대소문자와 숫자 또는 특수문자 8~24자로 입력하세요.</small>
			<small class="text-danger">&nbsp</small>
			
			<div class="form-group m-0">
			<span class="text-secondary">비밀번호 확인</span>
				<input type="password" id="passwordCheck" class="form-control" maxlength='24'>
			</div>	
				<small id="passChecktext" class="text-danger d-none ">패스워드가 일치하지 않습니다.</small>
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<span class="text-secondary">이름</span>
				<input type="text" id="name" name="name" class="form-control" maxlength='10' value="${user.name }">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<span class="text-secondary">전화번호</span>
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control"  maxlength='16' value="${user.phoneNumber }">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<span class="text-secondary">이메일</span>
				<input type="text" id="email" name="email" class="form-control" value="${user.email }">
			</div>	
			<small id="emailCheckText" class="text-danger d-none">유효한 이메일을 입력해 주세요.</small>
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<span class="text-secondary">주소</span>
				<input type="text" id="address" name="address" class="form-control" value="${user.address }">
			</div>	
			<small class="text-danger">&nbsp</small>
			<button type="submit" id="save" class="btn btn-block text-secondary" data-user-id="${user.id}">저장</button>
	
	<table border="1">
        <tr>
            <td width="200">우편번호</td>
            <td><input type="text" name="zipcode" id="zipcode" size="7"
                readonly> 
                <input type="button" value="우편번호찾기"
                id="findAddressBtn"></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input type="text" name="address1" id="address1" size="70" readonly>
                </td>
               
        </tr>
        <tr>
        <td>상세주소</td>
        <td><input type="text" name="address2" id="address2" size="70">
        </td>
        </tr>
    </table>
	
	</div>
</div>

<script>
$(document).ready(function() {
	let passCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/);	// 대소문자+숫자+특수문자 8~24 
	let phoneCheck = RegExp(/^(0[2-8][0-5]?|01[01346-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/);	// 전화번호 정규식 
	let emailCheck = RegExp(/^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/); // 이메일 정규식
	
    function findAddress() {
		new daum.Postcode({
        	oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        	 document.querySelector("#zipcode").value = data.zonecode;
	             document.querySelector("#address1").value =  data.address;
        	}
    	}).open();
	};
	
	$('#findAddressBtn').on('click', function() {
		findAddress();
	});
	
	
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
	
	
	$('#save').on('click', function() {
		let userId = $(this).data('user-id');
		let password = $("#password").val().trim();
		let passwordCheck = $("#passwordCheck").val().trim();
		let name = $("#name").val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		let email = $("#email").val().trim();
		let address = $('#address').val().trim();
		
		if (password != ""){
			if (passCheck.test(password) == false ){ 
				alert("비밀번호를 확인하세요");	
				return false;
			}
			if (passwordCheck != password )	{
				alert("비밀번호가 일치하지 않습니다");	
				return false;
			}
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
		
		$.ajax({
			type:'PUT'
			, data:{'userId':userId, 'password':password,'name':name, 'phoneNumber':phoneNumber, 
				'email':email, 'address':address}
			, url:'/user/update'
			
			, success:function(data){
				if (data.code == 100){
					alert('저장에 성공했습니다.');
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(){
				alert('저장 실패');
			}
			
		});//ajax
		
		
	});// save- click - end
	
});//ready

</script>