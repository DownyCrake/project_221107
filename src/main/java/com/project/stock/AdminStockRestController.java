package com.project.stock;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.stock.bo.StockBO;

@RequestMapping("/admin/stock")
@RestController
public class AdminStockRestController {
	
	@Autowired
	private StockBO stockBO;
	
	@PutMapping("/create")
	public Map<String, Object> createStock(
			@RequestParam("productId") int productId
			, @RequestParam("size") String size
			, @RequestParam("quantity") int quantity){
		
		Map<String, Object> result = new HashMap<>();
		
		int row = stockBO.addStockByProductId(productId, size, quantity);
		
		if (row > 0) {
			result.put("code", 100);
		}else {
			result.put("code", 300);
			result.put("errorMessage", "업로드 실패. 관리자에게 문의하세요");
		}
		
		return result;
	}
	
	@PutMapping("/update")
	public Map<String, Object> updateStock(
			 @RequestParam("stockId") int stockId
			, @RequestParam("quantity") int quantity){
		
		Map<String, Object> result = new HashMap<>();
		int row = stockBO.updateStockByStockId(quantity, quantity);
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "업데이트 오류. 관리자에게 문의하세요");
		}
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> deleteStock(int stockId){
		Map<String, Object> result = new HashMap<>();
		int row = stockBO.deleteStockByStockId(stockId);
		if (row > 0) {
			result.put("code", 100);
		} else {				
			result.put("errorMessage", "에러. 관리자에게 문의하세요");
		}
		
		return result;

	}
}
