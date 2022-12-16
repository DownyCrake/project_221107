<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex justify-content-center">
	<div class="board-div col-8 mt-5">
		<h3 class="text-dark m-3">Q&A</h3>
		<c:if test="${not empty userId}">
		<a href="/board/write_question_view" class="form-control mt-4 mb-4 text-center write-qna-btn" type="button">글쓰기</a>
		</c:if>
		<div class="board-qna-list-div pt-3">

			<c:forEach items="${qnaData.qnaList}" var="qna">
				<div class="d-flex justify-content-between border-bottom mt-4">
					<div>
					<span class="col-1">${qna.id}</span>
					<c:set value="${qna.userName}" var="name"/> 
					<span class="col-1">
					${fn:substring(name,0,1)} **
					</span>	
					<a href="/board/qna_view?postId=${qna.id}" class="qna-post col-8 text-dark"
					data-post-id="${qna.id}" data-secret="${qna.secret }"
					data-login-user-id="${userId}" data-post-user-id="${qna.userId }"> 
					<c:set value="${qna.subject}" var="subject"/>
					${fn:substring(subject,0,25)}
					</a>
					<c:if test="${qna.secret }"><img src="/static/img/lock.png" alt="https://www.flaticon.com/kr/free-icons/- title=맹꽁이 자물쇠 아이콘 맹꽁이 자물쇠 아이콘  제작자: Pixel perfect - Flaticon"></c:if>
				</div>
				<div>
					<fmt:formatDate value="${qna.createdAt }" pattern="yyyy-MM-dd"/>
				</div>
				</div>
				<c:if test="${not empty qna.reply }">
					<div class="d-flex mt-3 border-bottom justify-content-between">
						<div class="d-flex col-10">
							<div class="col-1"></div>
							<div>
								<span class="">Re]</span>
								<a href="#" class="answer-post col-8 text-dark"
								data-post-id="${qna.id}" data-secret="${qna.secret }"
								data-login-user-id="${userId}" data-post-user-id="${qna.userId }"> 
									${fn:substring(subject,0,23)} </a>
								<c:if test="${qna.secret }"><img src="/static/img/lock.png" alt="https://www.flaticon.com/kr/free-icons/- title=맹꽁이 자물쇠 아이콘 맹꽁이 자물쇠 아이콘  제작자: Pixel perfect - Flaticon"></c:if>
								
							</div>
						</div>
						<div>
							<fmt:formatDate value="${qna.updatedAt }" pattern="yyyy-MM-dd"/>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="d-flex justify-content-center mt-5 align-items-center">
		
			<c:if test="${! qnaData.firstSection }">
				<a href="/board/list_view?page=${qnaData.prePage}" class="prev-page-link m-2 text-dark"><b>이전 </b> </a>
			</c:if>
			<c:forEach items="${qnaData.pageNumberList }" var="pages">
				<a href="/board/list_view?page=${pages}" class="text-dark m-2"><b>${pages}</b></a>
			</c:forEach>
			<c:if test="${! qnaData.lastSection }">
				<a href="/board/list_view?page=${qnaData.nextPage}" class="next-page-link m-2 text-dark"> <b>다음</b> </a>
			</c:if>
		</div>
		
	</div>
</div>

<script>
$(document).ready(function() {
	
	$('.qna-post').on('click', function(){
		let postId = $(this).data('post-id');
		let secret = $(this).data('secret');
		if (secret){
			let postUserId = $(this).data('post-user-id');
			let loginUserId = $(this).data('login-user-id');
			if (postUserId != loginUserId ){
				alert('비밀글입니다.');
				return false;
			}
		}
		location.href='/board/qna_view?postId='+postId;
	});// qna-post - end
	
	$('.answer-post').on('click', function(){
		let postId = $(this).data('post-id');
		let secret = $(this).data('secret');
		if (secret){
			let postUserId = $(this).data('post-user-id');
			let loginUserId = $(this).data('login-user-id');
			if (postUserId != loginUserId ){
				alert('비밀글입니다.');
				return false;
			}
		}
		location.href='/board/reply_view?postId='+postId;
	});// answer-post - end
	
	
}); // ready

</script>