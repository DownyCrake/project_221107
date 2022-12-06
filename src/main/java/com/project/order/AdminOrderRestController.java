package com.project.order;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.order.bo.OrderBO;

@RestController
@RequestMapping("/order")
public class AdminOrderRestController {

	@Autowired
	private OrderBO orderBO;
	
	@PutMapping("/order_item_update")
	public Map<String, Object> changeOrderItemState(
			int orderItemId, String changeValue){
		Map<String, Object> result = new HashMap<>();
		
		int row = orderBO.updateOrderItemStateByOrderItemIdAndChangeValue(orderItemId, changeValue);
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "배송상태 변경 실패. 관리자에게 문의해주세요.");
		}

		return result;
	}
	
}
