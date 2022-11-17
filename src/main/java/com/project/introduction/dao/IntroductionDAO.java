package com.project.introduction.dao;

import org.springframework.stereotype.Repository;

import com.project.introduction.model.Introduction;

@Repository
public interface IntroductionDAO {
	
	public Introduction selectStoreByProductId(int productId);
}
