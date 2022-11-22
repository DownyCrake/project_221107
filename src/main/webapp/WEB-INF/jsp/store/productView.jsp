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
				<option selected disabled>옵션 선택</option>
					<c:forEach items="${storeView.stockList}" var="stock">	
				<option value="${stock.quantity}">${stock.size}</option>
				</c:forEach>
			</select>
			</div>
			<c:if test="${not empty userId}">
				<div class="d-flex justify-content-end">
					<input type="number" min="1" max="9">개
				</div>
				<div>	<!-- 장바구니 버튼 로그인시에만 활성화 -->
					<button type="button"  id="addCartBtn">add to cart</button>
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
	};
	
	 $('#stockSelect').on('change',function() {
		 let quantity = $('#stockSelect option:selected').val();
		 
	 });

}); // ready
</script>