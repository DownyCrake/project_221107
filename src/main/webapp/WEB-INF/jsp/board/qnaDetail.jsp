<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex justify-content-center">
	<div class="board-qna-detail-div col-10">
		<div class="board-qna-detail-subject-div mt-5 p-2">
			<div><b class="mr-3">[제목]</b>	${qna.subject }</div>
			<div class="d-flex justify-content-between">
			<div class="mt-2"> <b class="mr-1">[작성자]</b>	${qna.userName }</div>
			<div>	<fmt:formatDate value="${qna.createdAt}" pattern="yyyy-MM-dd HH:mm"/></div>
			</div>
		</div>
		<div class="p-3">
			<pre>${qna.content }</pre>
		</div>
		<div class="border-top mt-5 p-3">
			<a href="/board/list_view"><button class="btn qna-detail-button">목록</button></a>
		</div>
	</div>
</div>