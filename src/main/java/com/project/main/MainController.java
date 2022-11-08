package com.project.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main_view")
	public String mainView(
			HttpSession session
			, Model model) {
		
		model.addAttribute("viewName","main/mainView");
		return "template/layout";
	}
}
