package com.project.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.qna.bo.QnABO;
import com.project.qna.model.QnA;

@Controller
@RequestMapping("/admin")
public class AdminQnAController {

	@Autowired
	private QnABO qnaBO;
	
	@RequestMapping("/qna/list_view")
	public String AdminQnAListView(Model model) {
		
		List<QnA> qnaList = new ArrayList<>(); 
		qnaList = qnaBO.getQnAList();
		model.addAttribute("qnaList",qnaList);
		
		return "/admin/qna/adminQnAListView";
	}
	
	@RequestMapping("/qna/question_view")
	public String QnaDetailView(Model model, int postId) {

		QnA qna = new QnA(); 
		qna = qnaBO.getQnAbyPostId(postId);
		model.addAttribute("qna",qna);
		
		return "/admin/qna/adminQnADetailView";
	}
	
	@RequestMapping("/qna/write_answer_view")
	public String WriteAnswerView(Model model, int postId) {
		
		QnA qna = new QnA(); 
		qna = qnaBO.getQnAbyPostId(postId);
		model.addAttribute("qna",qna);
		
		return "/admin/qna/adminWriteAnswerView";
	}
	
	@RequestMapping("/qna/answer_view")
	public String QnaAnswerView(Model model, int postId) {

		QnA qna = new QnA(); 
		qna = qnaBO.getQnAbyPostId(postId);
		model.addAttribute("qna",qna);
		
		return "/admin/qna/adminQnAAnswerDetailView";
	}
	
}
