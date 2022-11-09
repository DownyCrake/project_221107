package com.project.product.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.FileManagerService;
import com.project.product.dao.ProductDAO;

@Service
public class ProductBO {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired 
	private ProductDAO productDAO;
	
	public int addProduct(String productName, int price, int category, MultipartFile file) {
		String imagePath = fileManagerService.saveFileAdmin(file);	
		
		return productDAO.insertProduct(productName, price, category, imagePath);
	}
}
