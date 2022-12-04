package com.project.order.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.address.bo.AddressBO;
import com.project.address.model.Address;
import com.project.cart.bo.CartBO;
import com.project.cart.model.Cart;
import com.project.order.model.OrderView;
import com.project.order.model.OrderViewList;
import com.project.product.bo.ProductBO;
import com.project.stock.bo.StockBO;

@Service
public class OrderBO {

	@Autowired
	private ProductBO productBO;
	
	@Autowired 
	private StockBO stockBO;
	
	@Autowired 
	private CartBO cartBO;
	
	@Autowired
	private AddressBO addressBO;
	
	public OrderViewList generateOrderView(OrderViewList orderList) {
		
		OrderViewList orderViewList = new OrderViewList();
		
		List<OrderView> ovl = new ArrayList<>();
		if ( orderList.getCartId() != null){
		List<Integer> cartIdList = orderList.getCartId(); 
			for (int i = 0; i < cartIdList.size(); i++ ) {
				OrderView newOrder = new OrderView();
				Cart cart = cartBO.getProductIdAndStockIdAndCountByCartId(cartIdList.get(i));
				
				int productId = cart.getProductId();
				int stockId = cart.getStockId();
				int count = cart.getCount();
				
				newOrder.setProductId(productId);
				newOrder.setStockId(stockId);
				newOrder.setCount(count);
				
				ovl.add(newOrder);
			}
			orderViewList.setCartId(cartIdList);
		} else {
			ovl = orderList.getOrderViewList();
		}
		
		
		List<OrderView> result = new ArrayList<>();
		
		for (int i = 0; i < ovl.size(); i++) {
			OrderView newOrder =  ovl.get(i);
			
			int productId = newOrder.getProductId();
			String productName = productBO.getProductNameByProductId(productId);
			int price = productBO.getPriceByProductId(productId);
			String ImagePath = productBO.getImagePathByProductId(productId);
			
			int count = newOrder.getCount();
			int totalPrice = (price * count) ;
			
			int stockId = newOrder.getStockId();
			String size = stockBO.getSizeByStockId(stockId);
			
			newOrder.setProductName(productName);
			newOrder.setSize(size);
			newOrder.setTotalprice(totalPrice);
			newOrder.setImagePath(ImagePath);
			
			result.add(newOrder);
		}
		orderViewList.setOrderViewList(result);
		return orderViewList;
	}
	
	public List<Address> getAddressListByUserId(int userId){
		return addressBO.getAddressListByUserId(userId);
	}
}
