package com.project.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.store.bo.StoreBO;

@RestController
@RequestMapping("/store")
public class StoreRestController {

	@Autowired
	private StoreBO storeBO;
	
}
