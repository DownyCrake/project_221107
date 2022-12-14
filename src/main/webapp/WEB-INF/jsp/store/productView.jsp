<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div>
	
	<div class="d-flex " id="topDiv">

		<div class="d-flex justify-content-end col-7 " id="topImgDiv" >
			<div id="storeProductTopImgDiv">
				<img src="${storeView.product.imagePath }" width=100% alt="제품 대표 이미지">
			</div>
		</div>
		
		<div class="col-4" id="topContentDiv">
			<div class="mt-3 "><b>${storeView.product.productName }</b></div>  <!-- 제품명 -->
			<div><span> <fmt:formatNumber value="${storeView.product.price}" type="number"/> KRW</span> </div> <!-- 가격 -->
			
			<form id="buyNowForm" method="post" action="/order/order_view" data-user-id="${userId}"> <!--  ///////////FORM 영역///////////// -->
			<input type="hidden" name="orderViewList[0].productId" value="${storeView.product.id}">
			<div class="mt-3 mb-3">	<!-- 사이즈 선택 -->
			<select id="stockSelect" name="orderViewList[0].stockId" class="w-100">
				<option selected disabled value="none">옵션 선택</option>
					<c:forEach items="${storeView.stockList}" var="stock">	
					
					<c:choose>
					<c:when test="${stock.quantity lt 1}" >      
				<option  disabled class="text-secondary"> ${stock.size}  [품절]</option>
					</c:when>
					<c:otherwise>
				<option  data-stock-quantity="${stock.quantity}" value ="${stock.id}">${stock.size}</option>
					</c:otherwise>
					</c:choose>
				
				</c:forEach>
			</select>
			</div>
			
				<div class="d-none count-box mr-2">       <!-- 수량 선택 박스 -->
				<div class="d-flex justify-content-between">
					<span id="totalPrice"> </span> 
					<div>
						<a href="#" id="minusBtn" class="fix"><span>-</span></a> 
						<input id="storeCount" name="orderViewList[0].count" type="text" maxlength="1" value=1 class="ml-1"> 
						<a href="#" id="plusBtn" class="fix"><span>+</span></a> 				
					</div>
				</div>
				</div>
				
				<div>
					<button type="button" class="store-btn mt-2" id="addCartBtn" data-user-id="${userId}" data-product-id="${storeView.product.id}"> add to cart</button>
				</div>
				<%-- <c:if test="${not empty userId}"> --%>
				<div>
					<button type="submit" class="store-btn mt-2" id="buyNowBtn"  >buy now</button>
				</div>
				<%-- </c:if> --%>
			</form>								<!--  ///////////FORM 영역///////////// -->
			
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
	<div id="productReviewDiv" class="w-100 d-flex justify-content-center">
		<div class="col-10 mt-5">
			<div class="text-secondary">
				<h4 >Reivew</h4>
				<hr>
				<h5 class="text-right" >
					<c:if test="${not empty storeView.reviewList}">
					<c:forEach begin="1" end="${storeView.avgPoint}">★ </c:forEach> 
					
					<fmt:formatNumber value="${storeView.avgPoint}" pattern=".0" />
					</c:if>
				<hr>
				</h5>
			</div>			
 			<div class="text-secondary" id="storeReviewDiv">
			<div id="textdivforreview">
				<c:forEach items="${storeView.reviewList }" var="review">
					<c:set value="${review.userName}" var="reviewname"/>
					<div class="d-flex justify-content-between">
						${fn:substring(reviewname,0,1)} ** 님 
						<span>
							<fmt:formatDate value="${review.createdAt}" pattern="yyyy.MM.dd"/>
						</span>						
					</div>
					<br> 
					<div class="d-flex justify-content-between">
						${review.content}
						<span>
							<c:forEach var="star"  begin="1" end="${review.point}">★</c:forEach> 
						</span>
					</div>
					<hr>
				</c:forEach>
			</div>
				<div class="d-flex justify-content-center" id="e">
					<c:set var="reviewPage" value="1"/>
					<form method="post" id="storeReviewChangerTestForm">
					<input type="hidden" name="productId" value="${storeView.product.id}">
					<c:forEach begin="1" end="${storeView.reviewPages }">
					 <b class="m-2"><button type="button" class="review-page-move bg-white" data-page-num="${reviewPage}">${reviewPage}</button></b>
					 <c:set var="reviewPage" value="${reviewPage + 1 }"/>
					</c:forEach>
					</form>
				</div>
			</div> 		
		</div>
	</div>

</div>

<script>

$(document).ready(function() {
	
	$('.review-page-move').on('click', function(e){
		let = productId = $('input[name=productId]').val();
		let page = $(this).data('page-num');
	    $.ajax({
	        url: "/store/change",
	        data: {'productId':productId, 'page':page},
	        type:"POST",
	        cache: false
	    }).done(function (data) {
	         $("#textdivforreview").replaceWith(data);
	    });
			
	});
	
	
	
	
	window.onresize = function(event){ // 화면 크기 조절 반응
		let innerWidth = window.innerWidth;
		if (innerWidth <= "800")  {
			$('#topDiv').removeClass('d-flex'); 
			$('#topImgDiv').removeClass('col-7'); 
			$('#topContentDiv').removeClass('col-4'); 
		} else {
			$('#topDiv').addClass('d-flex'); 
			$('#topImgDiv').addClass('col-7'); 
			$('#topContentDiv').addClass('col-4'); 
		}
	}; // 화면 조절 -end
	
	$(".fix").click(function(e) {	// 스크롤 방지 코드 
			e.preventDefault();
	});
	
	 let productPrice =  parseInt(${storeView.product.price});
	 
	 function countPrice(){
		 let newprice = productPrice * parseInt($('#storeCount').val());
		 $('#totalPrice').text(newprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + ' KRW');
	 };
	
	let quantity = 0;
	 $('#stockSelect').on('change',function() {  // 사이즈 선택 
		 if ( $(this).val() != "none") {
			 quantity = $('#stockSelect option:selected').data('stock-quantity');
			 $('#storeCount').val(1);
			 $('#totalPrice').text(productPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + ' KRW');
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
			countPrice();
			return; }

	 });
	 
	 $('#plusBtn').on('click', function(){ // 플러스 버튼 
		 let value = parseInt($('#storeCount').val());
		 if (value < 9) {
			 $('#storeCount').val(value + 1);
			 countPrice();
			return;
		 }
		 
	 });
	 
	 $('#minusBtn').on('click', function(){ // 마이너스 버튼
		 let value = parseInt($('#storeCount').val());
		 if (value > 1) {
			 $('#storeCount').val(value - 1);
			 countPrice();
			return false;
		 }
	 });
	 
	 $('#storeCount').on('propertychange change keyup paste input',function() {
		countPrice();
		return false;
	 });
	 

	 $('#buyNowForm').on('submit', function(e) {  // 바로 구매 form sub 유효성 검사

		 if ($('#stockSelect option:selected').val() == 'none') {
			 alert("사이즈를 선택해주세요");
			 return false;
		 }
		 
		 let count = $('#storeCount').val();
		 if ( parseInt(count) > parseInt(quantity) || parseInt(count) > 9 ) {
			 //alert('재고:' + quantity);
			//alert('카운트:' + count);
			 alert("구매 가능 개수 초과");
			 return false;
		 } else if (parseInt(count)  < 1) {
			 alert('구매 개수을 확인해주세요');
			 return false;
		 } 

		 let userId = $(this).data('user-id');
		 if (userId == '') {
			 alert("로그인해주세요");
			 return false;
		 }
		
	 }); // buynow - submit - end
	 
	 $('#addCartBtn').on('click', function() {	// 장바구니 넣기 클릭 
		 
		 if ($('#stockSelect option:selected').val() == 'none') {
			 alert("사이즈를 선택해주세요");
			 return false;
		 }
		
	 	let userId = $(this).data('user-id');
	 	let productId = $(this).data('product-id');
	 	let stockId = $('#stockSelect').val();
	 	let count =  $('#storeCount').val();
	 	
		 if ( parseInt(count) > parseInt(quantity) || parseInt(count) > 9 ) {
			 //alert('재고:' + quantity);
			//alert('카운트:' + count);
			 alert("구매 가능 개수 초과");
			 return false;
		 } else if (parseInt(count)  < 1) {
			 alert('구매 개수을 확인해주세요');
			 return false;
		 }
		 

		 if (userId == '') {
			 alert("로그인해주세요");
			 return false;
		 }
		 
		/* alert("유저아이디:" + userId + "프로덕트아이디:" + productId + "스톡아이디:" + stockId + "카운트:" + count);
		return; */
		 
 		 $.ajax({
			 type:'POST'
			 , url:'/cart/add_cart'
			 , data:{ 'userId':userId, 'productId':productId, 'stockId':stockId, 'count':count}
			 
			 , success:function(data){
 				 if (data.code == 100) {
					 if(!confirm("장바구니로 이동하시겠습니까?")){
						    return false;
						}else{
						    location.href="/cart/cart_view";
						}
				 }
				 else {
					 alert(data.errorMessage);
				 } 
			 }
			 ,error:function(){
				 alert('에러');
			 }
			 
		 }); // ajax-end 
		 
	 });	// addCartBtn - click - end

}); // ready
</script>