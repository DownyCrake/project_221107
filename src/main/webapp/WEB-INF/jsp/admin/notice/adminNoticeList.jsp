<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지 리스트</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">

</head>
<body>

	<div class="d-flex justify-content-center">
		<div class="board-div col-8 mt-5">
			<h3 class="text-dark m-3">Notice</h3>
			<a href="/admin/notice/create_notice_view"
				class="form-control mt-4 mb-4 text-center write-qna-btn"
				type="button">공지작성</a>
			<div class="board-qna-list-div pt-3">

				<c:forEach items="${noticeData.noticeList}" var="notice">
					<div class="d-flex justify-content-between border-bottom mt-3">
						<div>
							<span class="col-1">${notice.id}</span>
							<a href="/admin/notice/datail_view?noticeId=${notice.id}" class="qna-post col-8">
								<c:set value="${notice.subject}" var="subject" />
								${fn:substring(subject,0,25)}
							</a>
						</div>
						<div>
							<fmt:formatDate value="${notice.createdAt }" pattern="yyyy-MM-dd" />
						</div>
					</div>
				</c:forEach>
				<div class="d-flex justify-content-center mt-5 align-items-center">
				<input type="hidden" class="current-page-number" value="${noticeData.pageNumber }">
				<input type="hidden" class="section-size" value="${noticeData.sectionSize }">
				
				<c:if test="${! noticeData.firstSection }">
					<a class="prev-page-link m-2 "><b>이전 </b> </a>
				</c:if>
				<c:forEach items="${noticeData.pageNumberList }" var="pages">
					<a href="/admin/notice/list_view?page=${pages}" class="text-dark m-2"><b>${pages}</b></a>
				</c:forEach>
				<c:if test="${! noticeData.lastSection }">
					<a class="next-page-link m-2"> <b>다음</b> </a>
				</c:if>
				</div>
				<a href="/admin/main_view"><button type="button" class="mt-5 qna-detail-button text-dark">뒤로</button></a>
			</div>

		</div>
	</div>

<script>
$(document).ready(function(){
	
	let currentPage = $('.current-page-number').val();
	let sectionSize = $('.section-size').val();
	let lastPage = $('.last-page').val();
	
	$('.prev-page-link').on('click', function() {
		
		let cp = Number(currentPage);
		let ss = Number(sectionSize);
		let prevPage = cp - (cp % ss);
		location.href='/admin/notice/list_view?page='+ prevPage;
	});
	
	$('.next-page-link').on('click', function() {
		let cp = Number(currentPage);
		let ss = Number(sectionSize);
		let nextPage =  (ss * ( parseInt(  (cp - 1) / ss) + 1) ) + 1 ;
		location.href='/admin/notice/list_view?page='+ nextPage;
	});
	
}); // ready - end
</script>

</body>
</html>