package com.project.store.dao;

import org.springframework.stereotype.Repository;

import com.project.store.model.Store;

@Repository
public interface StoreDAO {
	
	public Store selectStoreByProductId(int productId);
}
