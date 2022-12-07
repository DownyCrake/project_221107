package com.project.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.order.bo.OrderBO;
import com.project.order.model.OrderData;

@RestController
@RequestMapping("/order")
public class OrderRestController {

	@Autowired
	private OrderBO orderBO;
	
	@PostMapping("/create")
	public Map<String, Object> orderPaymentRequest(
			HttpSession session,
			OrderData orderdata){
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (ObjectUtils.isEmpty(userId) == true) {
			result.put("errorMessage", "로그인이 해제되었습니다.");
			return result;
		}
		orderdata.setUserId(userId);
		
		String row = orderBO.orderProcess(orderdata);
		
		if (row == "over") {
			result.put("code", 111);
			result.put("errorMessage", "구매가능 수량을 초과했습니다.");
		} else {
			result.put("code", 100);
			result.put("orderNumber",row);
		}
		
		return result;
	}
	
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
	
	@PutMapping("/order_item_cancle")
	public Map<String, Object> cancleOrder(
			int orderItemId, int stockId, int count){
		Map<String, Object> result = new HashMap<>();
		
		int row = orderBO.cancleOrderItemByOrderItemIdAndCount(orderItemId, stockId, count);
		
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "주문 취소 실패. 관리자에게 문의해주세요.");
		}

		return result;
	}
}
