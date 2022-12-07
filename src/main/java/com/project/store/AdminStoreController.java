package com.project.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.product.bo.ProductBO;
import com.project.product.model.Product;

@RequestMapping("/admin/store")
@Controller
public class AdminStoreController {
	
	@Autowired
	private ProductBO productBO;

	@RequestMapping("/update_view")
	public String UpdateStoreView(Model model) {
		
		List<Product> productList = productBO.getProductNameAndId();
		model.addAttribute("productList",productList);
		return "/admin/store/adminUpdateStore";
	}
	
}
