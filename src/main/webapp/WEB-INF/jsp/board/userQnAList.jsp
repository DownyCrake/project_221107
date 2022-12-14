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

			<c:forEach items="${qnaList}" var="qna">
				<div class="d-flex justify-content-between border-bottom mt-4">
					<div>
					<span class="col-1">${qna.id}</span>
					<c:set value="${qna.userName}" var="name"/> 
					<span class="col-1">
					${fn:substring(name,0,1)} **
					</span>	
					<a href="#" class="qna-post col-8 text-dark"
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
							</div>
						</div>
						<div>
							<fmt:formatDate value="${qna.updatedAt }" pattern="yyyy-MM-dd"/>
						</div>
					</div>
				</c:if>
			</c:forEach>

		</div>
		
	</div>
</div>

<script>
$(document).ready(function() {
	
}); // ready

</script>