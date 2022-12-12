<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="mt-5 write-question-div col-8">
		<h3 class="text-dark">Q & A</h3>
		<input type="text" class="form-control mt-5 col-10" placeholder="제목" maxlength=100>
		<textarea class="form-control col-10 mt-4"	rows=6></textarea>
		<div class="d-flex align-items-center mt-2">
			<span class="text-secondary font-weight-bold">비밀글 설정</span>
			<input type="radio" name="secret" class="ml-5" value="false">&nbsp;공개
			<input type="radio" name="secret" class="ml-3" value="true">&nbsp;비공개
		</div>
		<button type="button" class="form-control col-10 mt-3 board-button" id="uploadQeustion">등록</button>
		<a href="#" type="button" class="form-control col-10 mt-2 text-center text-dark board-button">목록</a>
	</div>
</div>