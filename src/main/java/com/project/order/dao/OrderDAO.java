package com.project.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.order.model.Order;

@Repository
public interface OrderDAO {

	public int addOrder(Order order);
	
	public Order selectOrderByOrderNumber(
			@Param("orderNumber") String orderNumber
			, @Param("userId") int userId);
	
	public List<Integer> selectOrderIdListByUserId(int uerId);
	
	public String selectOrderNumberByOrderId(int orderId);
	
	public List<Order> selectOrderList(@Param("standardId") Integer standardId
			, @Param("direction") String direction
			, @Param("limit") int limit);
	
	public int selectOrderIdBySort(String sort);
}
