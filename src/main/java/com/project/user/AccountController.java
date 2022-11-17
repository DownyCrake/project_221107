package com.project.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.user.bo.UserBO;
import com.project.user.model.User;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/mypage_view")
	public String accountView( HttpSession session,
			Model model) {
		
		model.addAttribute("viewName","/user/myPage");
		return "/template/layout";
	}
	
	@RequestMapping("/profile_view")
	public String profileView(HttpSession session, Model model) {
		
		int userId = (int)session.getAttribute("userId");
		User user = userBO.getUserByuserId(userId);
		model.addAttribute("user", user);
		model.addAttribute("viewName", "/user/profile");
		return "template/layout";
	}
	

}
