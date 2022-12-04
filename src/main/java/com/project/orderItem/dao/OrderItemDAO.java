package com.project.orderItem.dao;

import org.springframework.stereotype.Repository;

import com.project.orderItem.model.OrderItem;

@Repository
public interface OrderItemDAO {

	public int addOrderItem(OrderItem oi);
}
