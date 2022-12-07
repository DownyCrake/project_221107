package com.project.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.address.model.Address;
import com.project.order.bo.OrderBO;
import com.project.order.model.Order;
import com.project.order.model.OrderViewList;
import com.project.order.model.orderResultData;
import com.project.orderItem.bo.OrderItemBO;
import com.project.product.bo.ProductBO;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderBO orderBO;
	
	@RequestMapping("/order_view")
	public String orderView( HttpSession session, Model model,
			OrderViewList orderViewList) {
		
		Integer userId = (Integer)session.getAttribute("userId"); 
		
		OrderViewList orders = orderBO.generateOrderView(orderViewList);
		List<Address> addrList = orderBO.getAddressListByUserId(userId);
		
		model.addAttribute("orders",orders);
		model.addAttribute("addrList",addrList);
		model.addAttribute("viewName","order/orderView");
		return "/template/layout";
	}
	
	@RequestMapping("/order_result_view")
	public String orderResultView(HttpSession session, Model model,
			String orderNumber) {
		
		Integer userId = (Integer)session.getAttribute("userId"); 
		Order order = orderBO.getOrderByOrderNumber(orderNumber,userId);
		int orderId = order.getId();
		List<orderResultData> orvdl = orderBO.generateOrderResultViewData(orderId);
		
		model.addAttribute("order",order);
		model.addAttribute("orvdl",orvdl);
		model.addAttribute("viewName","order/orderResultView");
		return "/template/layout";
	}
	
	@RequestMapping("/order_history_view")
	public String orderHistoryView(HttpSession session, Model model) {
		Integer userId = (Integer)session.getAttribute("userId"); 
		List<orderResultData> orvdl = orderBO.generateUserOrderHistory(userId);
		
		model.addAttribute("orvdl",orvdl);
		model.addAttribute("viewName","order/myPageOrder");
		return "/template/layout";
	}
}
