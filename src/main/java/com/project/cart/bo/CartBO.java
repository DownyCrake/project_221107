package com.project.cart.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cart.dao.CartDAO;
import com.project.cart.model.Cart;
import com.project.cart.model.CartView;
import com.project.product.bo.ProductBO;
import com.project.stock.bo.StockBO;

@Service
public class CartBO {

	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private StockBO stockBO;
	
	public int addCart(int userId, int productId, int stockId, int count) {
		return cartDAO.insertCart(userId, productId, stockId, count);
	}
	
	public List<Cart> getCart(int userId) {
		return cartDAO.selectCart(userId);
	}
	
	public int updateCart(int cartId, int count) {
		return cartDAO.updateCart(cartId, count);
	}
	
	public void deleteCart(int cartId) {
		cartDAO.deleteCart(cartId);
	}
	
	public List<CartView> generateCartView(int userId){
		
		List<CartView> cartViewList = new ArrayList<>();
		
		List<Cart> cartList = new ArrayList<>(); 
		cartList = getCart(userId);
		for (int i = 0; i < cartList.size(); i++) {
			CartView cartView = new CartView();
			Cart cart =  cartList.get(i);
	
			int productId = cart.getProductId();
			int stockId = cart.getStockId();
			
			cartView.setUserId(userId);
			cartView.setCartId(cart.getId());
			cartView.setProductId(productId);
			cartView.setStockId(stockId);
			cartView.setCount(cart.getCount());
			cartView.setProductName(productBO.getProductNameByProductId(productId));
			cartView.setPrice(productBO.getPriceByProductId(productId));
			cartView.setImagePath(productBO.getImagePathByProductId(productId));
			cartView.setSize(stockBO.getSizeByStockId(stockId));
			cartView.setQuantity(stockBO.getQuantityByByStockId(stockId));
			
			cartViewList.add(cartView);
		}
		
		return cartViewList;
	}
	
}
