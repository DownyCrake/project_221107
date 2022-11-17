package com.project.introduction.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.introduction.dao.IntroductionDAO;
import com.project.introduction.model.Introduction;

@Service
public class IntroductionBO {

	@Autowired
	private IntroductionDAO storeDAO;
	
	public Introduction getStoreByProductId(int productId) {
		return storeDAO.selectStoreByProductId(productId);
	}
}
