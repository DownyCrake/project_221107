package com.project.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.product.bo.ProductBO;
import com.project.product.model.Product;

@RequestMapping("/admin/product")
@Controller
public class AdminProductController {

	@Autowired
	private ProductBO productBO;
	
	@RequestMapping("list_view")
	public String productListView(
			@RequestParam(value="prevId", required=false) Integer prevIdParam
			, @RequestParam(value="nextId", required=false) Integer nextIdParam
			, Model model) {
		
		List<Product> productList = productBO.getProductList(prevIdParam, nextIdParam);
		int prevId = 0;
		int nextId = 0;
		if (productList.isEmpty() == false) {  //postList가 비어있을떄 에러 방지
			prevId = productList.get(0).getId();
			nextId = productList.get(productList.size() - 1).getId();
			
			// 가장 작은 숫자를 가져와서 nextId와 같으면 마지막 페이지
			if (productBO.isLastPage(nextId)) {
				nextId = 0;
			}
			
			// 가장 큰 숫자(postId)와 prevId가 같으면 첫페이지
			if (productBO.isFirstPage(prevId)) {
				prevId = 0;
			}
		}
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		model.addAttribute("productList", productList);
		return "admin/product/adminProductList";
	}
	
	@RequestMapping("create_view")
	public String productCreateView(Model model) {
		
		return "admin/product/adminProductCreate";
	}
	
	@RequestMapping("detail_view")
	public String productDetailView(
			@RequestParam("productId") int productId
			, Model model) {
		
		Product product = productBO.getProductByProductId(productId);
		model.addAttribute("product",product);
		return "admin/product/adminProductDetail";
	}
	
}
