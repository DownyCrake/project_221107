<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 QnA 관리</title>

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
	<div class="board-qna-detail-div col-10">
		<div class="board-qna-detail-subject-div mt-5 p-2">
			<div><b class="mr-3">[제목]</b>	${notice.subject }</div>
			<div>	<fmt:formatDate value="${qna.createdAt}" pattern="yyyy-MM-dd HH:mm"/></div>
		</div>
		<div class="p-3">
	${notice.content }
		</div>
		<div class="border-top mt-5 p-3">
			
			<a href="/admin/notice/update_view?noticeId=${notice.id}"><button class="btn qna-detail-button form-control">수정</button></a>
			<button class="delete-notice-btn form-control mt-2 bg-danger" data-notice-id="${notice.id }">삭제</button>
			<a href="/admin/notice/list_view"><button class="btn qna-detail-button form-control mt-2">목록</button></a>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {

	$('.delete-notice-btn').on('click', function() {
		let noticeId = $(this).data('notice-id');
		$.ajax({
			type:'delete'
			, data:{'noticeId':noticeId}
			, url:'/admin/notice/delete_notice'
			
			, success:function(data){
				if (data.code == 100){
					alert('공지가 삭제되었습니다.');
					location.href='/admin/notice/list_view';
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(){
				alert('error');
			}
		});
	});
	
});// ready - end
</script>
</body>
</html>