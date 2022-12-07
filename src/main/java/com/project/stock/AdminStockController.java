package com.project.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.product.bo.ProductBO;
import com.project.stock.bo.StockBO;
import com.project.stock.model.Stock;

@RequestMapping("/admin/stock")
@Controller
public class AdminStockController {

	@Autowired
	private StockBO stockBO;
	
	@Autowired
	private ProductBO productBO;
	
	@RequestMapping("/detail_view")
	public String stockView(
			@RequestParam("productId") int productId
			, Model model) {
		List<Stock> stockList = stockBO.getStockListByProductId(productId);
		String productName = productBO.getProductNameByProductId(productId);
		model.addAttribute("stockList",stockList);
		model.addAttribute("productName",productName);
		model.addAttribute("productId",productId);
		return "admin/stock/adminStockDetail"; 
	}
	
}
