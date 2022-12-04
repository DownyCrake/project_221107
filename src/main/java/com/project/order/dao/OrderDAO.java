package com.project.order.dao;

import org.springframework.stereotype.Repository;

import com.project.order.model.Order;

@Repository
public interface OrderDAO {

	public int addOrder(Order order);
}
