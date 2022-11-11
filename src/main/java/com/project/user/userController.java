package com.project.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class userController {

	@RequestMapping("/sign_up_view")
	public String signUpView(
		HttpSession session
		, Model model) {
	
	model.addAttribute("viewName","user/signUp");
	return "template/layout";
}
}
