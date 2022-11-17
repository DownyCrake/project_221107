package com.project.store;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.introduction.bo.IntroductionBO;
import com.project.introduction.model.Introduction;

@RequestMapping("/store")
@Controller
public class StoreController {
	
	@Autowired
	private IntroductionBO storeBO;
	
	@RequestMapping("/product_detail")
	public String StoreDetailView(int productId,
			HttpSession session,
			Model model) {
		
		Introduction store = storeBO.getStoreByProductId(productId);
		
		model.addAttribute("store",store);
		model.addAttribute("viewName", "/store/detailView");
		return "/template/layout";
	}
	

	
}
