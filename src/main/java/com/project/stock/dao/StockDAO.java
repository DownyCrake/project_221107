package com.project.stock.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.stock.model.Stock;

@Repository
public interface StockDAO {

	public List<Stock> selectStockListByProductId(int productId);
}
