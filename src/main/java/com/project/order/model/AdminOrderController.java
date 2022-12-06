package com.project.order.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.order.bo.OrderBO;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

	@Autowired
	private OrderBO orderBO;
	
	@RequestMapping("/order_list_view")
	public String adminOrderListView(Model model) {
		
		List<AdminOrderManagementData> aomdList = orderBO.generateAdminOrderManagementPageData();
		
		model.addAttribute("orderList",aomdList);
		return "/admin/order/orderListView";
	}
}
