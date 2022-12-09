package com.project.review;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.review.bo.ReviewBO;

@RestController
@RequestMapping("/review")
public class ReviewRestController {

	@Autowired
	private ReviewBO reviewBO;
	
	public Map<String, Object> writeReview(
			int orderItemId, int userId, int productId, String content, int point){
		Map<String, Object> result = new HashMap<>();
		
		return result;
	}
}
