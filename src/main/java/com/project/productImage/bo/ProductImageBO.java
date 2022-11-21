package com.project.productImage.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.FileManagerService;
import com.project.productImage.dao.ProductImageDAO;
import com.project.productImage.model.ProductImage;

@Service
public class ProductImageBO {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ProductImageDAO productImageDAO;

	@Autowired
	private FileManagerService fileManagerService;
	
	public List<ProductImage> getProductImageByProductId(int productId) {
		
		return productImageDAO.getProductImageByProductId(productId);
	}
	
	public void deleteProductImageByProductId(int productId) {
		productImageDAO.deleteProductImageByProductId(productId);
	}

	public void addProductImageByProductId(int productId, List<MultipartFile> files) {
		List<ProductImage> productimageList = getProductImageByProductId(productId);
		if (productimageList == null) {
			log.warn("[update post] 수정할 메모가 존재하지 않습니다.");
		}
		String imagePath = null;
		List<String >imagePathList = new ArrayList<>();
		for (MultipartFile file : files ) {
			imagePath = fileManagerService.saveFileAdmin(file);
			imagePathList.add(imagePath);
			}
		if (imagePathList != null && productimageList != null) {
			for (ProductImage productimage:productimageList ) {
				fileManagerService.deleteFile(productimage.getImagePath());
			}
			deleteProductImageByProductId(productId);
		}
		productImageDAO.insertProductImageByProductId(productId, imagePathList);
	}
	
	
}
