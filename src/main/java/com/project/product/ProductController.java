package com.project.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.product.bo.ProductBO;
import com.project.product.model.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductBO productBO;
	
	@RequestMapping("/store/product_list_view")
	public String productListView(HttpSession session,
			Model model,
			@RequestParam(value="category", required=false) Integer category ) {
		
		List<Product> productList = productBO.getProductByCategory(category);
		
		model.addAttribute("productList",productList);
		model.addAttribute("viewName","store/listView");
		return "/template/layout";
	}
}
