package com.project.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.product.model.Product;
import com.project.review.bo.ReviewBO;
import com.project.store.bo.StoreBO;
import com.project.store.model.StoreView;

@RequestMapping("/store")
@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private ReviewBO reviewBO;

	@RequestMapping("/product_list_view")
	public String productListView(HttpSession session, Model model,
			@RequestParam(value = "category", required = false) Integer category) {

		List<Product> productList = new ArrayList<>();
		productList = storeBO.getProductByCategory(category);
		model.addAttribute("productList", productList);
		model.addAttribute("viewName", "store/storeListView");
		return "/template/layout";
	}

	@RequestMapping("/product_view")
	public String productDetailView(int productId, HttpSession session, Model model
			,@RequestParam(value="reviewPage", required=false, defaultValue="1")int reviewPage) {
		StoreView storeView = storeBO.getStoreViewByProductId(productId, reviewPage);

		model.addAttribute("storeView", storeView);
		model.addAttribute("viewName", "store/productView");
		return "/template/layout";

	}

	
	  
	 @RequestMapping("/search_list_view") 
	 public String productListView(HttpSession session, 
			 Model model, String keyword ) {
		 List<Product> productList = new ArrayList<>(); 
		 productList = storeBO.getProductBykeyword(keyword);
	  
		 model.addAttribute("productList",productList);
		 model.addAttribute("viewName","store/searchListView"); 
		 return "/template/layout"; 
	}
	 
		@RequestMapping("/change")
		public String changeStoreReview(Model model, int productId, int page){
			StoreView storeData = new StoreView();
			storeData = storeBO.changeReviewListByPageAndProductId(productId, page);
			model.addAttribute("storeView",storeData);
			return "/review/storeReviewView";
		}
	 
}
