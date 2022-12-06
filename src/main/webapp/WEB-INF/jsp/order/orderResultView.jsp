<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="d-flex justify-content-center">
	<div class="mt-5 text-center col-6 ">
		<h3>주문이 완료되었습니다.</h3>
		<div class="d-flex mt-4">
			<div class="col-3">배송지</div>
			<div>
					${order.recipient} |
					${order.zipcode} |
					${order.address1} |
					${order.address2} 
			</div>
		</div>			
		<div class="d-flex mt-3">
			<c:set var="sum" value="0"/>
			<div class="col-3">상품정보</div>
			
			<div>
				<c:forEach items="${orvdl}" var="orv">
			<div>
				${orv.productName } |
				${orv.size } |
				${orv.count } 개|
				<fmt:formatNumber value="${orv.totalPrice }" type="number"/> 원
				
			<c:set var="price" value="${orv.totalPrice }"/>
			<c:set var="sum" value="${sum + price }"/>
			</div>
				</c:forEach>
			</div>
		</div>			
		<div class="d-flex mt-3">
			<div class="col-3">결제금액</div>
			<div>
			<fmt:formatNumber value="${sum }" type="number"/> 원
			</div>
		</div>			
	<div class="d-flex mt-3 ">
		<a type="button" href="/order/order_history_view" class="btn form-control border m-5 bg-secondary text-white">주문 상세 페이지로</a>
		<a type="button" href="/main_view" class="btn form-control border m-5 bg-light text-dark">메인 페이지로 </a>
	</div>
	</div>
	
</div>

