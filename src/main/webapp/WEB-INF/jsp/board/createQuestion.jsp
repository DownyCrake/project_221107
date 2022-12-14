<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="d-flex justify-content-center">
	<div class="mt-5 write-question-div col-8">
		<h3 class="text-dark">Q & A</h3>
		<input type="text" class="form-control mt-5 " id="questionSubject" placeholder="제목" maxlength=100>
		<textarea class="form-control  mt-4" id="questionContent" rows=6 cols=20 maxlength=1000 wrap="hard"></textarea>
		<div class="d-flex align-items-center mt-2">
			<span class="text-secondary font-weight-bold">비밀글 설정</span>
			<input type="radio" name="secret" class="ml-5" value="false" checked>&nbsp;공개
			<input type="radio" name="secret" class="ml-3" value="true">&nbsp;비공개
		</div>
		<button type="button" class="form-control  mt-3 board-button bg-secondary text-light" id="uploadQeustion" data-user-id="${userId }">등록</button>
		<a href="/board/list_view" type="button" class="form-control  mt-2 text-center text-dark board-button">목록</a>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#uploadQeustion').on('click', function() {
		let subject = $('#questionSubject').val().trim();
		let content = $('#questionContent').val();
		let secret = $('input:radio[name = secret]:checked').val();

		if (subject == ''){
			alert('제목을 입력해 주세요.');
			return;
		}
		if (content == ''){
			alert('내용을 입력해 주세요.');
			return;
		}
		
		let userId = $(this).data('user-id');
		if (userId == ''){
			alert('로그인 해주세요.');
			location.href="/user/sign_in_view";
			return;
		}
		
		$.ajax({
			type:'post'
			, data:{'subject':subject, 'content':content, 'secret':secret}
			, url:'/question/create'
			
			, success:function(data){
				if (data.code == 100){
					location.href="/board/list_view";
				}else {
					alert(data.errorMessage);
				}
			}
			, error:function(){
				alert('error');
			}		
			
		}); // ajax - end
		
	}); // uploadQeustion - click - end
	
}); // ready - end
</script>