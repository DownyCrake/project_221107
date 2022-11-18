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
	
	@RequestMapping("/list_view")
	public String IntroductionListView() {
		
		return "/admin/store/storeList";
	}
	
	@RequestMapping("/create_view")
	public String CreateIntroductionView(Model model) {
		
		List<Product> productList = productBO.getProductNameAndId();
		model.addAttribute("productList",productList);
		
		return "/admin/store/createStore";
	}
}
