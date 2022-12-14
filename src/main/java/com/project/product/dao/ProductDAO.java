package com.project.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.project.product.model.Product;

@Repository
public interface ProductDAO {

	public int insertProduct(@Param("productName")String productName, 
			@Param("price")int price, 
			@Param("category") int category, 
			@Param("imagePath") String imagePath);
	
	public List<Product> selectProductList(@Param("standardId") Integer standardId
			, @Param("direction") String direction
			, @Param("limit") int limit);
	
	public Product selectProductByProductId(int id);
	
	public int selectProductIdBySort(String sort);
	
	public int updateProductById(
			@Param("productId") int productId
			, @Param("productName") String productName
			, @Param("price") int price
			, @Param("category") int category
			, @Param("imagePath")  String imagePath);
	
	public String selectProductNameByProductId(int productId);
		
	public List<Product> selectProductByCategory(Integer category);
	
	public List<Product> selectProductBykeyword(String keyword);
	
	public List<Product> selectProductNameAndId();
	
	public int updateProductContentByProductId(
			@Param("productId")int productId
			, @Param("content") String content);
	
	public int selectPriceByProductId(int productId);
	
	public String selectImagePathByProductId(int productId);
	
	public int updateExposureByProductId(
			@Param("productId") int productId, 
			@Param("exposure") boolean exposure);
	
}
