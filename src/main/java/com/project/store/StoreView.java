package com.project.store;

import java.util.List;

import com.project.product.model.Product;
import com.project.productImage.model.ProductImage;
import com.project.stock.model.Stock;

public class StoreView {
	
	private Product product;
	
	private List<Stock> stockList;

	private List<ProductImage> imageList;
	
	public List<ProductImage> getImageList() {
		return imageList;
	}

	public void setImageList(List<ProductImage> imageList) {
		this.imageList = imageList;
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
