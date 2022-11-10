package com.project.stock.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stock.dao.StockDAO;
import com.project.stock.model.Stock;

@Service
public class StockBO {

	@Autowired
	private StockDAO stockDAO;
	
	public List<Stock> getStockListByProductId(int productId) {
		List<Stock> stockList = stockDAO.selectStockListByProductId(productId);
		return stockList;
	}
}
