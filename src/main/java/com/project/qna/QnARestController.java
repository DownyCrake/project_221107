package com.project.qna;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.qna.bo.QnABO;

@RestController
public class QnARestController {

	@Autowired
	private QnABO qnaBO;
	
	@RequestMapping("/question/create")
	public Map<String, Object> createQuestion(HttpSession session,
			String subject, String content, boolean secret) {
		Map<String, Object> result = new HashMap<>();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int row = qnaBO.addQuestion(userId, userName, subject, content, secret);
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "qna 작성에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
}
