<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex justify-content-center">
	<div class="board-div col-8 mt-5">
		<h3 class="text-dark m-3">Notice</h3>
		<div class="board-qna-list-div pt-3">

			<c:forEach items="${noticeData.noticeList}" var="notice">
				<div class="d-flex justify-content-between border-bottom mt-4">
					<div>
					<span class="col-1">${notice.id}</span>
					<a href="/notice/detail_view?noticeId=${notice.id}&page=${noticeData.pageNumber}" class="text-dark"> 
					<c:set value="${notice.subject}" var="subject"/>
					${fn:substring(subject,0,25)}
					</a>
					</div>
					<div>
					<fmt:formatDate value="${notice.createdAt }" pattern="yyyy-MM-dd"/>
					</div>
				</div>
			</c:forEach>

		</div>
				<div class="d-flex justify-content-center mt-5 align-items-center">
				
					<c:if test="${! noticeData.firstSection }">
						<a href="/notice/list_view?page=${noticeData.prePage}" class="prev-page-link m-2 text-dark"><b>이전 </b> </a>
					</c:if>
					<c:forEach items="${noticeData.pageNumberList }" var="pages">
						<a href="/notice/list_view?page=${pages}" class="text-dark m-2"><b>${pages}</b></a>
					</c:forEach>
					<c:if test="${! noticeData.lastSection }">
						<a href="/notice/list_view?page=${noticeData.nextPage}" class="next-page-link m-2 text-dark"> <b>다음</b> </a>
					</c:if>
				</div>
		<div class="mt-5">
		
		</div>
	</div>
</div>

<script>

</script>