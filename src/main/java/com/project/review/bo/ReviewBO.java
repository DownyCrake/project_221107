package com.project.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.order.bo.OrderBO;
import com.project.orderItem.bo.OrderItemBO;
import com.project.review.dao.ReviewDAO;
import com.project.review.model.Review;

@Service
public class ReviewBO {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private OrderBO orderBO;
	
	@Autowired
	private OrderItemBO orderItemBO;
	
	public int getUserIdByOrderId(int orderId) {
		return orderBO.getUserIdByOrderId(orderId);
	}
	
	public int addReview(int orderItemId, int userId, String userName, 
			int productId, String content, int point) {
		 int row = reviewDAO.insertReview(orderItemId, userId, userName, productId, content, point);
		 if (row > 0) {
			 orderItemBO.updateReviewCheckByOrderItemId(orderItemId);
			 return 1;
		 }
		 return 0;
	}
	
	public List<Review> getReviewByProductId(int productId){
		return reviewDAO.selectReviewByProductId(productId);
	}
}
