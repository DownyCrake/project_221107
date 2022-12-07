package com.project.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.order.bo.OrderBO;
import com.project.order.model.AdminOrderManagementData;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

	@Autowired
	private OrderBO orderBO;
	
	@RequestMapping("/order_list_view")
	public String adminOrderListView(
			@RequestParam(value="prevId", required=false) Integer prevIdParam
			, @RequestParam(value="nextId", required=false) Integer nextIdParam
			, Model model) {
		
		List<AdminOrderManagementData> aomdList = orderBO.generateAdminOrderManagementPageData(prevIdParam, nextIdParam);
		int prevId = 0;
		int nextId = 0;
		if (aomdList.isEmpty() == false) {  //postList가 비어있을떄 에러 방지
			prevId = aomdList.get(0).getOrderId();
			nextId = aomdList.get(aomdList.size() - 1).getOrderId();
			
			// 가장 작은 숫자를 가져와서 nextId와 같으면 마지막 페이지
			if (orderBO.isLastPage(nextId)) {
				nextId = 0;
			}
			
			// 가장 큰 숫자(postId)와 prevId가 같으면 첫페이지
			if (orderBO.isFirstPage(prevId)) {
				prevId = 0;
			}
		}
		
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		model.addAttribute("orderList",aomdList);
		return "/admin/order/adminOrderListView";
	}
}
