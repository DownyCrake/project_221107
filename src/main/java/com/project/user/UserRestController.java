package com.project.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.user.bo.UserBO;

@RestController

@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId){
		
		
		// id 중복 체크
		Map<String, Object> result = new HashMap<>();
		boolean isDuplicatedId = userBO.existLoginId(loginId);
		if (isDuplicatedId == true ) { // 중복값 있음 > 중복임 
			result.put("code", 100);
			result.put("result", true);
		} else {
			result.put("code", 100);  // 중복 아님 
			result.put("result", false);
		}
		return result;
	}
	
	
}
