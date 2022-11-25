package com.project.order;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.order.model.OrderViewList;

@Controller
@RequestMapping("/order")
public class OrderController {

	@RequestMapping("order_view")
	public String orderView( HttpSession session, Model model,
			OrderViewList orderViewList ) {
		
		
		
		
		model.addAttribute("orderModel",orderViewList);
		model.addAttribute("viewName","order/orderView");
		return "/template/layout";
	}
}
