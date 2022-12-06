package com.project.orderItem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.orderItem.model.OrderItem;

@Repository
public interface OrderItemDAO {

	public int addOrderItem(OrderItem oi);

	public List<OrderItem> selectOrderItemByOrderId(int orderId);
}
