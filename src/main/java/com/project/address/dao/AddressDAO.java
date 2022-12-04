package com.project.address.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.address.model.Address;

@Repository
public interface AddressDAO {

	public List<Address> selectAddressListByUserId(int userId);
	
	public int insertAddress(
			@Param("userId") int userId, 
			@Param("recipient") String recipient,
			@Param("shippingAddress")String shippingAddress, 
			@Param("zipcode")String zipcode, 
			@Param("address1")String address1, 
			@Param("address2")String address2, 
			@Param("phoneNumber")String phoneNumber);
	
	public void deleteAddressByAddressId(int addressId);
	
	public int selectAddressCountByUserId(int userId);
}
