package com.project.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cart.bo.CartBO;
import com.project.cart.model.CartView;

@RequestMapping("/cart")
@Controller
public class CartController {

	@Autowired
	private CartBO cartBO;
	
	@RequestMapping("/cart_view")
	public String cartView(HttpSession session, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (ObjectUtils.isEmpty(userId) == false) {
		List<CartView> cartList = cartBO.generateCartView(userId); 
		
		model.addAttribute("cartList",cartList); }
		model.addAttribute("viewName","/cart/cartView");
		return "/template/layout";
	}
	
}
