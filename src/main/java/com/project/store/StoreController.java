package com.project.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.product.bo.ProductBO;
import com.project.product.model.Product;
import com.project.store.bo.StoreBO;

@RequestMapping("/store")
@Controller
public class StoreController {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/product_list_view")
	public String productListView(HttpSession session,
			Model model,
			@RequestParam(value="category", required=false) Integer category ) {
		
		List<Product> productList = productBO.getProductByCategory(category);
		
		model.addAttribute("productList",productList);
		model.addAttribute("viewName","store/listView");
		return "/template/layout";
	}
	
	@RequestMapping("/product_view")
	public String productDetailView(int productId,
			HttpSession session,
			Model model) {
		StoreView storeView = storeBO.getStoreViewByProductId(productId);
		
		model.addAttribute("storeView",storeView);
		model.addAttribute("viewName","store/productView");
		return "/template/layout";

	}

	
}
