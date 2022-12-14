<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex justify-content-center">
	<div class="board-div col-8 mt-5">
		<h3 class="text-dark m-3">Notice</h3>
		<div class="board-qna-list-div pt-3">

			<c:forEach items="${noticeList}" var="notice">
				<div class="d-flex justify-content-between border-bottom mt-4">
					<div>
					<span class="col-1">${notice.id}</span>
					<a href="/notice/detail_view?noticeId=${notice.id}" class="text-dark"> 
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
		<div class="mt-5">
		
		</div>
	</div>
</div>

<script>

</script>