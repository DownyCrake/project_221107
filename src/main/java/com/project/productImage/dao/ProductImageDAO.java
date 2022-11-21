package com.project.productImage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.productImage.model.ProductImage;

@Repository
public interface ProductImageDAO {
	
	public List<ProductImage> getProductImageByProductId(int productId);
	
	public void insertProductImageByProductId(
			@Param("productId") int productId
			, @Param("imagePathList") List<String> imagePathList);
	
	public void deleteProductImageByProductId(int productId);

}
