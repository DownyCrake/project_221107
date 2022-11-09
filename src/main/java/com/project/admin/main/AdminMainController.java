package com.project.admin.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {
	
	@RequestMapping("/admin/main_view")
	public String mainView() {
		
		return "admin/main/adminMain";
	}
}
