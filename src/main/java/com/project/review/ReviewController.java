package com.project.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.review.bo.ReviewBO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewBO reviewBO;
	
	@RequestMapping("/write_view")
	public String writeReviewView(HttpSession session, Model model, 
			int orderId, int orderItemId, int productId, String productName) {
		Integer userId = (Integer)session.getAttribute("userId");
		int orderUserId = reviewBO.getUserIdByOrderId(orderId);
		if (userId == orderUserId) {
			model.addAttribute("userId",userId);
			model.addAttribute("orderItemId",orderItemId);
			model.addAttribute("productId",productId);
			model.addAttribute("productName",productName);
			model.addAttribute("viewName","/review/createReview");
			return "/template/layout";
		}
	    return "/main_view";
	}
}
