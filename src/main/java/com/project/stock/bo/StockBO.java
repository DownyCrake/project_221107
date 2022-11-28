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
		return stockDAO.selectStockListByProductId(productId);
	}
	
	public int addStockByProductId(int productId, String size, int quantity) {
		return stockDAO.insertStockByProductId(productId, size, quantity);
	}
	
	public int updateStockByStockId(int stockId, int quantity) {
		return stockDAO.updateStockByStockId(stockId, quantity);
	}
	
	public int deleteStockByStockId(int stockId) {
		return stockDAO.deleteStockByStockId(stockId);
	}
	
	public String getSizeByStockId(int stockId) {
		return stockDAO.selectSizeByStockId(stockId);
	}
	
	public int getQuantityByByStockId(int stockId) {
		return stockDAO.selectQuantityByByStockId(stockId); 
	}
	
}
