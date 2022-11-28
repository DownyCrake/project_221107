package com.project.stock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.stock.model.Stock;

@Repository
public interface StockDAO {

	public List<Stock> selectStockListByProductId(int productId);
	
	public int insertStockByProductId(
			@Param("productId")int productId
			, @Param("size") String size
			, @Param("quantity") int quantity);
	
	
	public int updateStockByStockId(
			@Param("stockId") int stockId
			, @Param("quantity") int quantity);
	
	public int deleteStockByStockId(int stockId);
	
	public String selectSizeByStockId(int stockId);
	
	public int selectQuantityByStockId(int stockId);
	
}
