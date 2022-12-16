<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex justify-content-center">
	<div class="board-qna-detail-div col-10">
		<div class="board-qna-detail-subject-div d-flex justify-content-between mt-5 p-2">
			<div><b class="mr-3">[답변]</b>	${qna.subject }</div>
			<div>	<fmt:formatDate value="${qna.updatedAt}" pattern="yyyy-MM-dd HH:mm"/></div>
		</div>
		<div class="p-3">
			<pre>${qna.reply }</pre>
		</div>
		<div class="border-top mt-5 p-3">
			<a href="javascript:history.back();"><button class="btn qna-detail-button">뒤로</button></a>
		</div>
	</div>
</div>