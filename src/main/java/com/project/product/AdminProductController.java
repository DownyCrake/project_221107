package com.project.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/product")
@Controller
public class AdminProductController {

	
	@RequestMapping("list_view")
	public String productListView(Model model) {
		
		return "admin/product/productList";
	}
	
	@RequestMapping("create_view")
	public String productCreateView(Model model) {
		
		return "admin/product/productCreate";
	}
	
	@RequestMapping("detail_view")
	public String productDetailView(Model model) {
		
		return "admin/product/productDetail";
	}
	
}
