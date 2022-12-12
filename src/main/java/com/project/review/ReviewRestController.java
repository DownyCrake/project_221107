package com.project.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.review.bo.ReviewBO;

@RestController
@RequestMapping("/review")
public class ReviewRestController {

	@Autowired
	private ReviewBO reviewBO;
	
	@RequestMapping("/create")
	public Map<String, Object> writeReview( HttpSession session,
			int orderItemId, int userId, int productId, String content, int point){
		Map<String, Object> result = new HashMap<>();
		String userName = (String)session.getAttribute("userName");
		int row = reviewBO.addReview(orderItemId, userId, userName, productId, content, point);
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "리뷰작성에 실패했습니다. 관리자에게 문의해주세요.");
		}
		return result;
	}
}
