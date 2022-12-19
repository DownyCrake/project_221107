package com.project.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.qna.bo.QnABO;
import com.project.qna.model.QnA;
import com.project.qna.model.QnAViewData;

@Controller
@RequestMapping("/admin")
public class AdminQnAController {

	@Autowired
	private QnABO qnaBO;
	
	@RequestMapping("/qna/list_view")
	public String AdminQnAListView(Model model,
			@RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		QnAViewData qnaData = new QnAViewData();
		
		Integer totalPostNum = qnaBO.getCurrentQnAId();
		if (totalPostNum != null) {
		Integer totalPageNum = qnaBO.calculateTotalPageNum(totalPostNum);
		if (page > totalPageNum ) {
			return "redirect:/admin/qna/list_view?page="+totalPageNum;
		};
		if (page < 1) {
			return "redirect:/admin/qna/list_view?page="+1;
		}
		
		qnaData = qnaBO.getQnAListByPage(page, totalPostNum, totalPageNum);
		}
		model.addAttribute("qnaData",qnaData);
		
		
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
