<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지 수정</title>

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
	<div class="mt-5 write-question-div col-8">
		<h3 class="text-dark">공지 수정</h3>
		<input type="text" class="form-control mt-5 " id="noticeSubject" value="${notice.subject }" maxlength=30>
		<textarea class="form-control  mt-4" id="noticeContent" rows=6 cols=20 maxlength=1000 wrap="hard">${notice.content }</textarea>
		<button type="button" class="form-control  mt-3 board-button bg-secondary text-light" id="updateNotice" data-notice-id="${notice.id}">등록</button>
		<a href="javascript:window.history.back();" type="button" class="form-control  mt-2 text-center text-dark board-button">뒤로</a>
	</div>
</div>
<script>
$(document).ready(function() {
	$('#updateNotice').on('click', function() {
		let noticeId = $(this).data('notice-id');
		let subject = $('#noticeSubject').val();
		let content = $('#noticeContent').val();
		if (subject == ''){
			alert('제목을 입력해 주세요.');
			return;
		}
		if (content == ''){
			alert('본문을 작성해 주세요.');
			return;
		}
		
		$.ajax({
			type:'put'
			, data: {'noticeId':noticeId, 'subject':subject, 'content':content}
			, url: '/admin/notice/update_notice'
			, success:function(data){
				if (data.code == 100){
					alert('수정되었습니다.');
					location.href='/admin/notice/list_view';
				}
				else {
					alert(data.errorMessage);
					return;
				}
			}
			, error:function(){
				alert('error');
				return;
			}
		});
	});
	
}); // ready -end
</script>
</body>
</html>