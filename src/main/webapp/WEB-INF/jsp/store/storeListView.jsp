<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div >
	
	<div class="d-flex flex-wrap">
		<c:forEach items="${productList}" var="product">
			<div class="product-list-items-div w-25 p-1 text-center d-flex flex-column-reverse">
				<div class="items-description-div ">
					<a href="/store/product_view?productId=${product.id}">
					<span>${product.productName}</span><br></a>
					<span> <fmt:formatNumber value="${product.price}" type="number"/> KRW</span>
				</div>
				<div>
					<a href="/store/product_view?productId=${product.id}">
						<img src="${product.imagePath }" alt="제품 썸네일" width="100%">
					</a>
				</div>

			</div>
		</c:forEach>	
	</div>
</div>

<script>

$(document).ready(function() {
	
	
	window.onresize = function(event){ // 화면 크기 조절 반응
		let innerWidth = window.innerWidth;
		if (innerWidth <= "1000")  {
			$('.product-list-items-div').removeClass('w-25'); 
			$('.product-list-items-div').addClass('w-50'); 
		} else {
			$('.product-list-items-div').addClass('w-25');
			$('.product-list-items-div').removeClass('w-50'); 
		}
	};
	

}); // ready
</script>