package com.project.address.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.address.dao.AddressDAO;
import com.project.address.model.Address;

@Service
public class AddressBO {
	
	@Autowired
	private AddressDAO addressDAO;
	
	public List<Address> getAddressListByUserId(int userId){
		return addressDAO.selectAddressListByUserId(userId);
	}
	
	public int addAddress(int userId, String recipient,String shippingAddress, String zipcode, 
			String address1, String address2, String phoneNumber) {
		int row = countAddressByUserId(userId);
		if (row > 4) {
			return 333;
		} else {
		return addressDAO.insertAddress(userId, recipient, shippingAddress, zipcode, address1, address2, phoneNumber); }
	}

	public void deleteAddressByAddressId(int addressId) {
		addressDAO.deleteAddressByAddressId(addressId); 
	}
	
	public int countAddressByUserId(int userId) {
		int row = addressDAO.selectAddressCountByUserId(userId);
		return row;
	}
}
