package com.project.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.dao.UserDAO;
import com.project.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public int addUser(
			String loginId,
			String password,
			String name,
			String phoneNumber,
			String email,
			String address) {
		return userDAO.insertUser(loginId, password, name, phoneNumber, email, address);
	}
	
	public User getUserByLoginIdAndPassword(			
			String loginId
			,String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
}
