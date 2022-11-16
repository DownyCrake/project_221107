package com.project.store.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.store.dao.StoreDAO;
import com.project.store.model.Store;

@Service
public class StoreBO {

	@Autowired
	private StoreDAO storeDAO;
	
	public Store getStoreByProductId(int productId) {
		return storeDAO.selectStoreByProductId(productId);
	}
}
