package com.project.cart;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.cart.bo.CartBO;

@RequestMapping("/cart")
@RestController
public class CartRestController {

	@Autowired
	private CartBO cartBO;
	
	@RequestMapping("/add_cart")
	public Map<String, Object> addCart(
			@RequestParam("userId") int userId,
			@RequestParam("productId") int productId,
			@RequestParam("stockId") int stockId,
			@RequestParam("count") int count){
		
		Map<String, Object> result = new HashMap<>();
		int row = cartBO.addCart(userId, productId, stockId, count);
		
		if (row > 0) {
			result.put("code", 100);
		}else {
			result.put("errorMessage", "장바구니 넣기에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	
	@DeleteMapping("/delete")
	public Map<String, Object> deleteCart(@RequestParam("cartId") int cartId){
		
		Map<String, Object> result = new HashMap<>();
		cartBO.deleteCart(cartId);
		result.put("code", 100);
		return result;
	}
	
}
