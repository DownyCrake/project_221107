<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center">
	<div class=" col-8">
		<div class="m-4">
		<h2>주문내역 조회</h2>	
		</div>	
		<div class="mt-5 d-flex justify-content-center">
			<table class="w-100 text-center order-history-table">
				<thead>			
					<tr>
						<th>상품 정보</th>
						<th>주문 일자</th>
						<th>주문 번호</th>
						<th>주문 금액</th>
						<th>주문 상태</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${orvdl}" var="orderItem">
					<tr>
						 <td>
						 
						 <a href="/store/product_view?productId=${orderItem.productId}">
						 ${orderItem.productName }</a>
							 <br>
							 <small class="text-secondary">${orderItem.size }</small>
						 </td>
						 <td>
						 <fmt:formatDate value="${orderItem.createdAt }" pattern="yyyy년 MM월 dd일"/>
							 
						 </td>
						 <td>
							 ${orderItem.orderNumber }
						 </td>
						 <td>
							${orderItem.totalPrice }<br>
							 <small class="text-secondary">${orderItem.count }개</small>
						 </td>
						 <td>
							 ${orderItem.state }
							 <c:set var="state" value="${orderItem.state }"/>
							 <c:choose>
							 
							 
							 <c:when test="${state eq '상품준비중'}">
							 	<button  type="button" class="btn">주문 취소</button>
							 </c:when>
							 <c:when test="${state eq '배송완료'}">
							 	<button  type="button" class="btn">구매 확정</button>
							 </c:when>
							 <c:when test="${state eq '구매확정'}">
							 	<button  type="button" class="btn">리뷰 작성</button>
							 </c:when>
							 
							 </c:choose>
						 </td>
					</tr>			
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<a href="/account/mypage_view" type="button" class="btn bg-secondary text-white mt-5">뒤로</a>
	</div>
</div>

<script>


</script>