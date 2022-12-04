package com.project.address;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.address.bo.AddressBO;
import com.project.address.model.Address;


@Controller
@RequestMapping("/account")
public class AddressController {

	@Autowired
	private AddressBO addressBO;
	
	@RequestMapping("/address_list_view")
	public String addressListView(HttpSession session, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		List<Address> addressList = addressBO.getAddressListByUserId(userId);
		
		model.addAttribute("addressList",addressList);
		model.addAttribute("viewName","/address/adrlistView");
		return "/template/layout";
	}
	
	
	@RequestMapping("/address_create_view")
	public String addAddressView(HttpSession session, Model model) {
		
		model.addAttribute("viewName","/address/addAdrView");
		return "/template/layout";
	}
}
