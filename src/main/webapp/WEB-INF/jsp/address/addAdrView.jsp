<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class=" mt-5 pt-5 col-6 input-box">
	 	<h1>배송지 등록</h1>
			<input type="hidden" id="userId" value="${userId}">
			<div>
				<span>수령인</span>
				<input type="text" name="recipient" id="recipient" class="form-control" maxlength='25'>
			</div>
			<div>
				<span>배송지명</span> 
				<input type="text" name="shippingAddress" id="shippingAddress" class="form-control" maxlength='25'>
			</div>
			<div>
				<span>우편번호</span>
				<div class="d-flex">
					<input type="text" id="zipcode" class="form-control col-5 mr-3 bg-white" readonly>
					<button type="button" id="findAdrBtn" class="btn">주소 찾기</button>
				</div>
			</div>
			<div>
				<span>주소</span>		
				<input type="text" id="address1" name="address1" class="form-control bg-white" readonly>	
			</div>			
			<div>
				<span>상세주소</span>		
				<input type="text" id="address2" name="address2" class="form-control" maxlength='200'>	
			</div>			
			<div class=" m-0">
				<span>전화번호</span> 
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control" >
			</div>
			<small>&nbsp</small>
			<div>
				<button type="button" class="add-address-btn btn btn-block mb-5">등록</button>
			</div>
	</div>

</div>

<script>
function findAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open();
}


$(document).ready(function() {
let phoneCheck = RegExp(/^(0[2-8][0-5]?|01[01346-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/);	// 전화번호 정규식 
	
	$('#findAdrBtn').on('click', function() {
		findAddress();
	});
	
	$('.add-address-btn').on('click', function() {
		let userId = $('#userId').val();
		let recipient = $('#recipient').val().trim();
		let shippingAddress = $('#shippingAddress').val().trim();
		let zipcode = $('#zipcode').val();
		let address1 = $('#address1').val();
		let address2 = $('#address2').val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		
		if (recipient == '') {
			alert('수취인명을 입력해주세요.');
			return;
		}
		if (shippingAddress == '') {
			shippingAddress = recipient + '님 배송지';
			}
		if (zipcode == '') {
			alert('우편번호를 선택해주세요.');
			return;
		}
		if (address2 == '') {
			alert('세부주소를 입력해주세요.');
			return;
		}
		
		if (phoneCheck.test(phoneNumber) == false ){
			alert("전화번호를 확인해주세요");
			return;
		} 
		
		$.ajax({
			type:'POST'
			, url:'/address/create'
			, data: {'userId':userId, 'recipient':recipient, 'shippingAddress':shippingAddress,  
					'zipcode':zipcode, 'address1':address1, 'address2':address2, 'phoneNumber':phoneNumber}
			, success:function(data) {
				if (data.code == 100) {
					location.href='/account/address_list_view'
				} else if (data.code == 200) {
					alert('등록 가능 개수를 초과했습니다.');					
				} 
				else {
					alert(data.errorMessage);
				}
			}
			, error:function(){
				alert('error');
			}
		}); // ajax - end
		
	}); // add-address-btn   click  -end
	
}); // ready - end
</script>