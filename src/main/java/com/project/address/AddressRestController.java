package com.project.address;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.address.bo.AddressBO;

@RestController
@RequestMapping("/address")
public class AddressRestController {

	@Autowired
	private AddressBO addressBO;
	
	@RequestMapping("/create")
	public Map<String, Object> createAddress(
			@RequestParam("userId") int userId,
			@RequestParam("recipient") String recipient,
			@RequestParam("shippingAddress") String shippingAddress,
			@RequestParam("zipcode") String zipcode,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam("phoneNumber") String phoneNumber
			){
		Map<String, Object> result = new HashMap<>();
		int row = addressBO.addAddress(userId, recipient, shippingAddress, zipcode, address1, address2, phoneNumber);
		
		if (row == 333 ) {
			result.put("code", 200 );
		} else if (row > 0) {
			result.put("code", 100);
		}else {
			result.put("errorMessage", "주소 등록에 실패했습니다. 관리자에게 문의해주세요.");
		}
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> deleteAddressByAddressId(int addressId){
		Map<String, Object> result = new HashMap<>();

		addressBO.deleteAddressByAddressId(addressId);
		return result;
	}
	
	@RequestMapping("/count")
	public Map<String, Object> countAddressByUserId(int userId){
		Map<String, Object> result = new HashMap<>();
		
		int row = addressBO.countAddressByUserId(userId);
		if (row > 4) {
			result.put("code", 200);
		} else {
			result.put("code", 100);
		}
		return result;
	}
}
