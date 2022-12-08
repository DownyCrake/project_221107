package com.project.review.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.order.bo.OrderBO;
import com.project.review.dao.ReviewDAO;

@Service
public class ReviewBO {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private OrderBO orderBO;
	
	public int getUserIdByOrderId(int orderId) {
		return orderBO.getUserIdByOrderId(orderId);
	}
}
