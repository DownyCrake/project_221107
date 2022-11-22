package com.project.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.store.bo.StoreBO;

@RestController
@RequestMapping("/admin/store")
public class AdminStoreRestController {
	
	@Autowired
	private StoreBO storeBO;
	
	@PostMapping("/update")
	public Map<String, Object> updateStore(
			@RequestParam("productId") int productId,
			@RequestParam("content") String content,
			@RequestParam(value="images", required=false) List<MultipartFile> files){
		Map<String, Object> result = new HashMap<>();
		
		storeBO.updateStoreByProductId(productId, content, files);
		result.put("code", 100);
		
		return result;
	}
	
}
