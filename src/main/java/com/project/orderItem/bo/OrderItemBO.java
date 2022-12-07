package com.project.orderItem.bo;

import java.util.List;

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
	
	public List<OrderItem> getOrderItemByOrderId(int orderId) {
		return orderItemDAO.selectOrderItemByOrderId(orderId);
	}
	
	public int updateOrderItemStateByOrderItemIdAndChangeValue(int orderItemId, String changeValue) {
		return orderItemDAO.updateOrderItemStateByOrderItemIdAndChangeValue(orderItemId, changeValue);
	}
	
	public int cancleOrderItemByOrderItemIdAndCount(int orderItemId) {
		return orderItemDAO.cancleOrderItemByOrderItemIdAndCount(orderItemId);
	}
}
