package com.project.product.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductDAO {

	public int insertProduct(@Param("productName")String productName, 
			@Param("price")int price, 
			@Param("category") int category, 
			@Param("imagePath") String imagePath);
}
