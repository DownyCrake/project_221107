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

				<c:forEach items="${noticeList}" var="notice">
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

				<a href="/admin/main_view"><button type="button" class="mt-5 qna-detail-button">뒤로</button></a>
			</div>

		</div>
	</div>

</body>
</html>