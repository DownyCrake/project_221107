package com.project.question;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class QuestionController {

	@RequestMapping("/write_question_view")
	public String writeQuestionView(HttpSession session, Model model) {
		
		model.addAttribute("viewName","/board/createQuestion");
		return "/template/layout";
	}
}
