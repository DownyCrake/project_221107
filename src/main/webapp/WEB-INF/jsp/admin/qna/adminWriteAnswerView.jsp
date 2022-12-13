<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 답변 작성</title>

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
		<h3 class="text-dark">답변 작성</h3>
		<input type="hidden" class="qna-id-hidden-input" value="${qna.id }">
		<input type="text" class="form-control mt-5 " id="questionSubject" value="${qna.subject }" maxlength=100>
		<textarea class="form-control  mt-4" id="qnaReply" rows=6 maxlength=1000></textarea>
		<button type="button" class="form-control  mt-3 board-button bg-secondary text-light" id="uploadAnswer">등록</button>
		<a href="javascript:window.history.back();" type="button" class="form-control  mt-2 text-center text-dark board-button">뒤로</a>
	</div>
</div>
<script>
$(document).ready(function() {
	$('#uploadAnswer').on('click', function() {
		let reply = $('#qnaReply').val();
		let postId = $('.qna-id-hidden-input').val();
		$.ajax({
			type:'put'
			, data: {'postId':postId, 'reply':reply}
			, url: '/admin/update_relpy'
			, success:function(data){
				if (data.code == 100){
					alert('등록되었습니다.');
					location.href='/admin/qna/list_view';
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