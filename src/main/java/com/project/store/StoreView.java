package com.project.store;

import java.util.List;

import com.project.introduction.model.Introduction;
import com.project.product.model.Product;
import com.project.stock.model.Stock;

public class StoreView {

	private Introduction introduction;
	
	private Product product;
	
	private List<Stock> stockList;

	public Introduction getIntroduction() {
		return introduction;
	}

	public void setIntroduction(Introduction introduction) {
		this.introduction = introduction;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Stock> getStockList() {
		return stockList;
	}

	public void setStockList(List<Stock> stockList) {
		this.stockList = stockList;
	}
}
