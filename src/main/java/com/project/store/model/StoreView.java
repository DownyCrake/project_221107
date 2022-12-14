package com.project.store.model;

import java.util.List;

import com.project.product.model.Product;
import com.project.productImage.model.ProductImage;
import com.project.review.model.Review;
import com.project.review.model.ReviewViewData;
import com.project.stock.model.Stock;

public class StoreView {
	
	private Product product;
	
	private List<Stock> stockList;

	private List<ProductImage> imageList;
	
	private List<Review> reviewList;
	
	private int reviewPages;
	
	private float avgPoint;

	public void setAvgPoint(List<Integer> reviewPoints) {
		int sumPoint = 0; 
		float num = 0;
		for (int i = 0; i < reviewPoints.size(); i++) {
			Integer point = reviewPoints.get(i);
			if (point != null) {
				sumPoint += point;
				num ++; 
			}
		}
		this.avgPoint = (sumPoint / num);
	}
	
	public float getAvgPoint() {
		return avgPoint;
	}
	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}
	
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
	
	public int getReviewPages() {
		return reviewPages;
	}

	public void setReviewPages(int reviewPages) {
		this.reviewPages = reviewPages;
	}
}
