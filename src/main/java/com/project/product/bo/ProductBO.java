package com.project.product.bo;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.FileManagerService;
import com.project.product.dao.ProductDAO;
import com.project.product.model.Product;

@Service
public class ProductBO {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	private static final int POST_MAX_SIZE = 10;

	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired 
	private ProductDAO productDAO;
	
	public int addProduct(String productName, int price, int category, MultipartFile file) {
		String imagePath = fileManagerService.saveFileAdmin(file);	
		
		return productDAO.insertProduct(productName, price, category, imagePath);
	}
	
	public List<Product> getProductList(Integer prevId, Integer nextId ){
		
		Integer standardId = null;
		String direction = null;
		
		if (prevId != null) { // 이전 클릭 
			standardId = prevId;
			direction = "prev";
			List<Product> productList = productDAO.selectProductList(standardId, direction, POST_MAX_SIZE);
			Collections.reverse(productList);
			return productList;
		} else if (nextId != null) { // 다음 클릭
			standardId = nextId;
			direction = "next";
		}
		return productDAO.selectProductList(standardId, direction, POST_MAX_SIZE);
	}
	
	public boolean isLastPage(Integer nextId) { //next 방향의 끝인가
		int productId = productDAO.selectProductIdBySort("ASC");
		return productId == nextId;
	}

	public boolean isFirstPage(Integer prevId) { //next 방향의 끝인가
		int productId = productDAO.selectProductIdBySort("DESC");
		return productId == prevId;
	}
	
	public Product getProductByProductId(int productId) {
		return productDAO.selectProductByProductId(productId);
	}
	
	public int updateProductById(int productId, String productName, int price, int category, MultipartFile file) {
		Product product = getProductByProductId(productId);
		if (product == null) {
			log.warn("[update post] 수정할 메모가 존재하지 않습니다.");
			return 0;
		}
		
		String imagePath = null;
		if (file != null) {
			imagePath = fileManagerService.saveFileAdmin(file);
			// 업로드 성공하면 기존 이미지 있었다면 제거
			if (imagePath != null && product.getImagePath() != null) {
				// 업로드가 실패할 수 있으므로 업로드 성공시에 제거
				fileManagerService.deleteFile(product.getImagePath());
			}
		}
		
		return productDAO.updateProductById(productId, productName, price, category, imagePath);
	}
	
	public String getProductNameByProductId(int productId) {
		return productDAO.selectProductNameByProductId(productId);
	}
	
	public List<Product> getProductByCategory(Integer category) {
		return productDAO.selectProductByCategory(category);
	}
	
	public List<Product> getProductNameAndId(){
		return productDAO.selectProductNameAndId();
	}
	
	public int addProductContentByProductId(int productId, String content) {
		return productDAO.updateProductContentByProductId(productId, content);
	}
	
	public int updateProductContencByProductId(int productId, String content) {
		Product product = getProductByProductId(productId);
		if (product == null) {
			log.warn("[update post] 수정할 메모가 존재하지 않습니다.");
			return 0;
		}
		
		return productDAO.updateProductContentByProductId(productId, content);
	}
	
	
	public int getPriceByProductId(int productId) {
		return productDAO.selectPriceByProductId(productId); 
	}
	
	public String getImagePathByProductId(int productId) {
		return productDAO.selectImagePathByProductId(productId); 
	}
	
	public int updateExposureByProductId(int productId, boolean exposure) {
		return productDAO.updateExposureByProductId(productId, exposure);
	}
}
