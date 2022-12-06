package com.project.order.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import com.project.address.bo.AddressBO;
import com.project.address.model.Address;
import com.project.cart.bo.CartBO;
import com.project.cart.model.Cart;
import com.project.order.dao.OrderDAO;
import com.project.order.model.Order;
import com.project.order.model.OrderData;
import com.project.order.model.OrderViewData;
import com.project.order.model.OrderViewList;
import com.project.order.model.orderResultData;
import com.project.orderItem.bo.OrderItemBO;
import com.project.orderItem.model.OrderItem;
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
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderItemBO orderItemBO;
	

	public OrderViewList generateOrderView(OrderViewList orderList) {
		
		OrderViewList orderViewList = new OrderViewList();
		
		List<OrderViewData> ovl = new ArrayList<>();
		if ( orderList.getCartId() != null){
		List<Integer> cartIdList = orderList.getCartId(); 
			for (int i = 0; i < cartIdList.size(); i++ ) {
				OrderViewData newOrder = new OrderViewData();
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
		
		
		List<OrderViewData> result = new ArrayList<>();
		
		for (int i = 0; i < ovl.size(); i++) {
			OrderViewData newOrder =  ovl.get(i);
			
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
	
	
	@Transactional
	public String orderProcess(OrderData data) {		// 결제 과정 구현 - 수량 체크 - 데이터 삽입 - 재고 차감 - 카트 삭제 
		
		int itemCount = data.getOrderItemList().size();		// 수량체크
		for (int i = 0; i < itemCount; i++) {
			int count = data.getOrderItemList().get(i).getCount();
			int stockId = data.getOrderItemList().get(i).getStockId();
			int quantity = stockBO.getQuantityByStockId(stockId);
			if (count > quantity){
				return "over"; // 수량 초과 반환
			}
		}		// 수량체크 - end
		int userId = data.getUserId();
		String orderNumber = ((Integer.toString(userId) + System.currentTimeMillis()));
		
		Order order = new Order();
		
		order.setOrderNumber(orderNumber);
		order.setUserId(userId);
		order.setRecipient(data.getRecipient());
		order.setZipcode(data.getZipcode());
		order.setAddress1(data.getAddress1());
		order.setAddress2(data.getAddress2());
		order.setPhoneNumber(data.getPhoneNumber());
		
		int orderCheck =  orderDAO.addOrder(order);		// 주문서 작성 - orderId 반환
		if (orderCheck < 1) {
	        try {
	            throw new Exception("예외를 강제로 발생시켰습니다.");  
	        } catch (Exception e)    {
	        }
		}
		
		int orderId = order.getId();
		
		
		List<OrderItem> orderItems = new ArrayList<>();
		for (OrderItem oi : data.getOrderItemList()) {
			OrderItem oidata = new OrderItem();
			oidata.setOrderId(orderId);
			oidata.setProductId(oi.getProductId());
			oidata.setStockId(oi.getStockId());
			oidata.setCount(oi.getCount());
			oidata.setTotalPrice(oi.getTotalPrice());
			oidata.setState("상품준비중");
			orderItems.add(oidata);
		}
		
		for (OrderItem oi : orderItems) {
			int check = orderItemBO.addOrderItem(oi);
			if (check < 1) {
		        try {
		            throw new Exception("예외를 강제로 발생시켰습니다.");  
		        } catch (Exception e)    {
		        }
			}
		}
		
		// 재고 차감 
		for (int i = 0; i < itemCount; i++) {
			int count = data.getOrderItemList().get(i).getCount();
			int stockId = data.getOrderItemList().get(i).getStockId();
			
			stockBO.deductQuantityByStockIdAndCount(stockId, count);
			int quantity = stockBO.getQuantityByStockId(stockId);
			if (quantity < 0){
		        try {
		            throw new Exception("예외를 강제로 발생시켰습니다.");  
		        } catch (Exception e)    {
		        }
			}
		}		// 수량체크 - end
		
		// 카트 삭제
		if (ObjectUtils.isEmpty(data.getCartId()) == false) {
			for (int cartId : data.getCartId()) {
				cartBO.deleteCart(cartId);
			}
		}
		return orderNumber;
	}
	
	public Order getOrderByOrderNumber(String orderNumber, int userId) {
		return orderDAO.selectOrderByOrderNumber(orderNumber, userId); 
	}
	
	public List<orderResultData> generateOrderResultViewData(int orderId){
		List<OrderItem> oil = orderItemBO.getOrderItemByOrderId(orderId);
		List<orderResultData> ovdl = new ArrayList<>();
		for (OrderItem oi : oil) {
			orderResultData ovd = new orderResultData(); 
			int productId = oi.getProductId();
			ovd.setProductName(productBO.getProductNameByProductId(productId));
			int stockId = oi.getStockId();
			ovd.setSize(stockBO.getSizeByStockId(stockId));
			
			ovd.setCount(oi.getCount());
			ovd.setTotalPrice(oi.getTotalPrice());
			ovdl.add(ovd);
		}
		return ovdl;
	}
	
	public List<Integer> getOrderIdListByUserId(int uerId){
		return orderDAO.selectOrderIdListByUserId(uerId);
	}
	
	public String getOrderNumberByOrderId(int orderId) {
		return orderDAO.selectOrderNumberByOrderId(orderId);
	}
	
	public List<orderResultData> generateUserOrderHistory(int userId){
		
		List<orderResultData> ovdl = new ArrayList<>();
		List<Integer> oderIdList = getOrderIdListByUserId(userId);
		
		for (int orderId : oderIdList) {
			List<OrderItem> oil = orderItemBO.getOrderItemByOrderId(orderId);
			
			for (OrderItem oi : oil) {
				orderResultData ovd = new orderResultData();
				ovd.setOrderId(orderId);
				String orderNumber = orderDAO.selectOrderNumberByOrderId(orderId);
				ovd.setOrderNumber(orderNumber);
				int productId = oi.getProductId();
				ovd.setProductName(productBO.getProductNameByProductId(productId));
				int stockId = oi.getStockId();
				ovd.setSize(stockBO.getSizeByStockId(stockId));
				ovd.setCount(oi.getCount());
				ovd.setTotalPrice(oi.getTotalPrice());
				ovd.setState(oi.getState());
				ovd.setCreatedAt(oi.getCreatedAt());
				ovdl.add(ovd);
			}
		}
		
		return ovdl;
	}
}
