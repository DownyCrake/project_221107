package com.project.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.cart.model.Cart;

@Repository
public interface CartDAO {

	public int insertCart(@Param("userId") int userId, 
			@Param("productId") int productId, 
			@Param("stockId") int stockId, 
			@Param("count") int count);
	
	public List<Cart> selectCart(int userId);
	
	public int updateCart(@Param("cartId") int cartId, 
			@Param("count") int count);
	
	public void deleteCart(int cartId);
	
	public Cart selectProductIdAndStockIdAndCountByCartId(int cartId);
}
