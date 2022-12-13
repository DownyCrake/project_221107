package com.project.qna;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.qna.bo.QnABO;

@RestController
@RequestMapping("/admin")
public class AdminQnARestController {

	@Autowired
	private QnABO qnaBO;
	
	@RequestMapping("/update_relpy")
	public Map<String, Object> updateReplyByPostId(int postId, String reply){
		
		Map<String, Object> result = new HashMap<>();
		int row = qnaBO.updateReplyByPostId(postId, reply);
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "답변 등록에 실패했습니다");
		}
		return result;
	}
}
