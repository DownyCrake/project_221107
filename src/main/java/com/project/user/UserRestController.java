package com.project.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.common.EncryptUtils;
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
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email,
			@RequestParam(value="address", required=false) String address){
		
		String encryptPassword = EncryptUtils.SHA256(password); // 암호화
		
		Map<String, Object> result = new HashMap<>();
		int row = userBO.addUser(loginId, encryptPassword, name, phoneNumber, email, address);
		if (row > 0) {
			result.put("code", 100); 
		} else {
			result.put("errorMessage", "회원가입에 실패했습니다. 관리자이게 문의해 주세요.");
		}

		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session){
		String encryptPassword = EncryptUtils.SHA256(password); // 암호화

		Map<String, Object> result = new HashMap<>();
		
		
		return result;
	}
	
	
}
