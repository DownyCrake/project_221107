package com.project.store.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.product.bo.ProductBO;
import com.project.product.model.Product;
import com.project.productImage.bo.ProductImageBO;
import com.project.productImage.model.ProductImage;
import com.project.review.bo.ReviewBO;
import com.project.review.model.Review;
import com.project.stock.bo.StockBO;
import com.project.stock.model.Stock;
import com.project.store.model.StoreView;

@Service
public class StoreBO {

	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private StockBO stockBO;
	
	@Autowired
	private ProductImageBO productImageBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	public void updateStoreByProductId(int productId, String content, List<MultipartFile> files) {
		productBO.updateProductContencByProductId(productId, content);
		
		if (files != null) {
			productImageBO.addProductImageByProductId(productId, files);
		}
	}
	
	public StoreView getStoreViewByProductId(int productId) {
		StoreView storeView = new StoreView();
		
		Product product = productBO.getProductByProductId(productId);
		storeView.setProduct(product);
		
		List<Stock> stockList = stockBO.getStockListByProductId(productId);
		storeView.setStockList(stockList);
		
		List<ProductImage> productimageList = productImageBO.getProductImageByProductId(productId);
		storeView.setImageList(productimageList);
		
		List<Review> reviewList = reviewBO.getReviewByProductId(productId);
		
		storeView.setReviewList(reviewList);
		
		storeView.setTotalPoint(reviewList);
		
		return storeView;
	}
}
