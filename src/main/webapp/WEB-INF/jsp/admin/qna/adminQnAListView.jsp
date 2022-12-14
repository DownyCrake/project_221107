<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 QnA 리스트</title>

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
			<h3 class="text-dark m-3">Q&A</h3>
			<div class="board-qna-list-div pt-3">

				<c:forEach items="${qnaData.qnaList}" var="qna">
					<div class="d-flex justify-content-between border-bottom mt-3">
						<div>
							<span class="col-1">${qna.id}</span>
							<span class="col-1"> id>${qna.userId} / name>${qna.userName} </span> 
							<a href="/admin/qna/question_view?postId=${qna.id}" class="qna-post col-8">
								<c:set value="${qna.subject}" var="subject" />
								${fn:substring(subject,0,25)}
							</a>
							<c:if test="${qna.secret }">
								<img src="/static/img/lock.png"
									alt="https://www.flaticon.com/kr/free-icons/- title=맹꽁이 자물쇠 아이콘 맹꽁이 자물쇠 아이콘  제작자: Pixel perfect - Flaticon">
							</c:if>
						</div>
						<div>
							<fmt:formatDate value="${qna.createdAt }" pattern="yyyy-MM-dd" />
						</div>
					</div>
					<c:if test="${not empty qna.reply }">
						<div class="d-flex mt-3 border-bottom">
							<div class="col-2"></div>
							<div>
								<span class="">답변] </span>
								<a href="/admin/qna/answer_view?postId=${qna.id}" class="qna-post col-8">
								${fn:substring(subject,0,23)}
								</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<div class="d-flex justify-content-center mt-5 align-items-center">
				
				<c:if test="${! qnaData.firstSection }">
					<a href="/admin/qna/list_view?page=${qnaData.prePage}" class="prev-page-link m-2"><b>이전 </b> </a>
				</c:if>
				<c:forEach items="${qnaData.pageNumberList }" var="pages">
					<a href="/admin/qna/list_view?page=${pages}" class="text-dark m-2"><b>${pages}</b></a>
				</c:forEach>
				<c:if test="${! qnaData.lastSection }">
					<a href="/admin/qna/list_view?page=${qnaData.nextPage}" class="next-page-link m-2"> <b>다음</b> </a>
				</c:if>
				</div>
				<a href="/admin/main_view"><button type="button" class="mt-5 qna-detail-button">뒤로</button></a>
			</div>

		</div>
	</div>

</body>
</html>