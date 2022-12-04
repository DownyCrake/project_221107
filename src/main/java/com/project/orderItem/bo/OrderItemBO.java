package com.project.orderItem.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.orderItem.dao.OrderItemDAO;
import com.project.orderItem.model.OrderItem;

@Service
public class OrderItemBO {

	@Autowired
	private OrderItemDAO orderItemDAO;
	
	public int addOrderItem(OrderItem oi) {
		return orderItemDAO.addOrderItem(oi); 
	}
}
