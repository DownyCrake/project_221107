package com.project.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.order.bo.OrderBO;
import com.project.order.model.OrderViewList;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderBO orderBO;
	
	@RequestMapping("order_view")
	public String orderView( HttpSession session, Model model,
			OrderViewList orderViewList) {
		
		OrderViewList orders = orderBO.generateOrderView(orderViewList);
		
		model.addAttribute("orders",orders);
		model.addAttribute("viewName","order/orderView");
		return "/template/layout";
	}
}
