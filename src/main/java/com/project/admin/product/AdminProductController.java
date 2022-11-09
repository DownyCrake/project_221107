package com.project.admin.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminProductController {

	@RequestMapping("/admin/product_list_view")
	public String productListView(Model model) {
		
		return "admin/product/productList";
	}
}
