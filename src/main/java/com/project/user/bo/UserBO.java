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
			String email) {
		return userDAO.insertUser(loginId, password, name, phoneNumber, email);
	}
	
	public User getUserByLoginIdAndPassword(			
			String loginId
			,String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
	
	public User getUserByuserId(int userId) {
		return userDAO.selectUserByuserId(userId);
	}
	
	public int updateUserByUserId(
			int userId,
			String password,
			String name,
			String phoneNumber,
			String email) {
		return userDAO.updateUser(userId, password, name, phoneNumber, email);
	}
}
