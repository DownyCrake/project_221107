package com.project.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.stock.bo.StockBO;
import com.project.stock.model.Stock;

@RequestMapping("/admim/stock")
@Controller
public class AdminStockController {

	@Autowired
	private StockBO stockBO;
	
	@RequestMapping("/detail_view")
	public String stockView(
			@RequestParam("productId") int productId
			, Model model) {
		List<Stock> stockList = stockBO.getStockListByProductId(productId); 
		model.addAttribute("stockList",stockList);
		return "admin/stock/stockDetail"; 
	}
	
}
