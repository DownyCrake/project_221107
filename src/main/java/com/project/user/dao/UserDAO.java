package com.project.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.user.model.User;

@Repository
public interface UserDAO {
	
	public boolean existLoginId(String loginId);
	
	public int insertUser(@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email,
			@Param("address") String address);

	public User selectUserByLoginIdAndPassword(			
			@Param("loginId") String loginId,
			@Param("password") String password);

}
