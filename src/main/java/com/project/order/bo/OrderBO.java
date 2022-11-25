package com.project.order.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.order.model.OrderViewList;
import com.project.order.model.OrderView;
import com.project.product.bo.ProductBO;
import com.project.stock.bo.StockBO;

@Service
public class OrderBO {

	@Autowired
	private ProductBO productBO;
	
	@Autowired 
	private StockBO stockBO;
	
	public OrderViewList generateOrderView(OrderViewList ovl) {
		for (OrderView ov : ovl.getOrderViewList()) {
			
		}
		
		return ovl;
	}
	
}
