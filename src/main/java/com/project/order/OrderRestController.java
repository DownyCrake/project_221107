package com.project.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		return result;
	}
}
