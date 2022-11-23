<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	
	<div class="d-flex" id="topDiv">

		<div class="d-flex justify-content-end col-7" id="topImgDiv" >
			<div id="storeProductTopImgDiv">
				<img src="${storeView.product.imagePath }" width=100% alt="제품 대표 이미지">
			</div>
		</div>
		
		<div >
			<div class="mt-3 "><b>${storeView.product.productName }</b></div>  <!-- 제품명 -->
			<div><span> <fmt:formatNumber value="${storeView.product.price}" type="number"/> KRW</span> </div> <!-- 가격 -->
			<div class="mt-3 mb-3">	<!-- 사이즈 선택 -->
			<select id="stockSelect" class="w-100">
				<option selected disabled value="none">옵션 선택</option>
					<c:forEach items="${storeView.stockList}" var="stock">	
				<option value="${stock.quantity}">${stock.size}</option>
				</c:forEach>
			</select>
			</div>
			
				<div class="d-none count-box">       <!-- 수량 선택 박스 -->
				<div class="d-flex justify-content-between">
					<span  id="totalPrice"></span>
					<div>
						<a href="#" id="minusBtn"><span>-</span></a> 
						<input id="storeCount" type="text" maxlength="1" value=1 class="ml-1"> 
						<a href="#" id="plusBtn"><span>+</span></a> 				
					</div>
				</div>
				</div>
				
				<div>
					<button type="button" class="store-btn" id="addCartBtn">add to cart</button>
				</div>
				<c:if test="${not empty userId}">
				<div>
					<button type="button" class="store-btn mt-2" id="buyNowBtn">buy now</button>
				</div>
				</c:if>
			
			<div>${storeView.product.content }</div>
		</div>
	</div>

	<div class="d-flex justify-content-center">
		<div id="storeProductImgsDiv">
			<c:forEach items="${storeView.imageList}" var="Images">
				<img src="${Images.imagePath }" width=100% class="m-2">
			</c:forEach>
		</div>
	</div>


</div>

<script>

$(document).ready(function() {
	
	window.onresize = function(event){ // 화면 크기 조절 반응
		let innerWidth = window.innerWidth;
		if (innerWidth <= "800")  {
			$('#topDiv').removeClass('d-flex'); 
			$('#topImgDiv').removeClass('col-7'); 
		} else {
			$('#topDiv').addClass('d-flex'); 
			$('#topImgDiv').addClass('col-7'); 
		}
	}; // 화면 조절 -end
	
	let quantity = 0;
	 $('#stockSelect').on('change',function() {  // 사이즈 선택 
		 if ( $(this).val() != "none") {
			 quantity = $('#stockSelect option:selected').val();
			 $('.count-box').removeClass('d-none');  
			return;
		} else {
			 quantity = 0;
			 $('.count-box').addClass('d-none');  
			return;
		}
	 });
	 
	 $('#storeCount').on('input',function() {  
		if ( isNaN($(this).val()) ) {// 수량 조절에 숫자가 아닌 값이 들어왔을때 1로 변경 처리
			$(this).val(1);
			return; }
	 });
	 
	 $('#plusBtn').on('click', function(){ // 플러스 버튼 
		 let value = parseInt($('#storeCount').val());
		 if (value < 9) {
			 $('#storeCount').val(value + 1);
		 }
	 });
	 
	 $('#minusBtn').on('click', function(){ // 마이너스 버튼
		 let value = parseInt($('#storeCount').val());
		 if (value > 1) {
			 $('#storeCount').val(value - 1);
		 }
	 });
	 
	 $('#storeCount').on('propertychange change keyup paste input',function() { 
		alert('숫자변경');		 
		return;
	 });

}); // ready
</script>