package com.project.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

	@RequestMapping("/account_view")
	public String accountView( HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
//		if (userId == null) {
//			return "redirect:/user/sign_in_view";
//		}
		
		model.addAttribute("viewName","main/myPage");
		return "/template/layout";
	}
}
