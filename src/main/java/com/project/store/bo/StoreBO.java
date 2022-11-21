package com.project.store.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.product.bo.ProductBO;
import com.project.productImage.bo.ProductImageBO;

@Service
public class StoreBO {

	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductImageBO productImageBO;
	
	public void updateStoreByProductId(int productId, String content, List<MultipartFile> files) {
		productBO.updateProductContencByProductId(productId, content);
		
		if (files != null) {
			productImageBO.addProductImageByProductId(productId, files);
		}
	}
}
