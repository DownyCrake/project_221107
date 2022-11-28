package com.project.order.model;

import java.util.List;

public class OrderViewList {

	private List<OrderView> orderViewList;

	private List<Integer> cartId;
	
	
	
	public List<Integer> getCartId() {
		return cartId;
	}

	public void setCartId(List<Integer> cartId) {
		this.cartId = cartId;
	}

	public List<OrderView> getOrderViewList() {
		return orderViewList;
	}

	public void setOrderViewList(List<OrderView> orderViewList) {
		this.orderViewList = orderViewList;
	}
	
	
}
