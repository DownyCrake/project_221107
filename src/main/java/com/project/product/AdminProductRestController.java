package com.project.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.product.bo.ProductBO;

@RequestMapping("/admin/product")
@RestController
public class AdminProductRestController {
	
	@Autowired
	private ProductBO productBO;
	
	@PostMapping("/create")
	public Map<String, Object> create (
			@RequestParam("productName") String productName
			, @RequestParam("price") int price
			, @RequestParam("category") int category
			, @RequestParam("file") MultipartFile file){
		
		int row = productBO.addProduct(productName, price, category, file);  
		Map<String, Object> result = new HashMap<>();
		
		if (row >0 ) {
			result.put("code", 100);
		}else {
			result.put("errorMessamge", "업로드에 실패했습니다. 관리자에세 문의해주세요.");
		}
		
		return result;
	}

	@PutMapping("/update")
	public Map<String, Object> update (
			@RequestParam("productName") String productName
			, @RequestParam("price") int price
			, @RequestParam("category") int category
			, @RequestParam("file") MultipartFile file){
		
		int row =       
		Map<String, Object> result = new HashMap<>();
		
		if (row >0 ) {
			result.put("code", 100);
		}else {
			result.put("errorMessamge", "업로드에 실패했습니다. 관리자에세 문의해주세요.");
		}
		
		return result;
	}
	
}
