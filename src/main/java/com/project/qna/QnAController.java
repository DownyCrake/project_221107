package com.project.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.qna.bo.QnABO;
import com.project.qna.model.QnA;
import com.project.qna.model.QnAViewData;

@Controller
@RequestMapping("/board")
public class QnAController {
	
	@Autowired
	private QnABO qnaBO;
	
	@RequestMapping("/write_question_view")
	public String writeQuestionView(HttpSession session, Model model) {
		
		model.addAttribute("viewName","/board/createQuestion");
		return "/template/layout";
	}
	
	@RequestMapping("/list_view")
	public String qnaListView(HttpSession session, Model model,
		@RequestParam(value="page", required=false, defaultValue="1") int page) {
			
		QnAViewData qnaData = new QnAViewData();
		
		Integer totalPostNum = qnaBO.getCurrentQnAId();
		Integer totalPageNum = qnaBO.calculateTotalPageNum(totalPostNum);
		if (page > totalPageNum ) {
			return "redirect:/admin/qna/list_view?page="+totalPageNum;
		};
		if (page < 1) {
			return "redirect:/admin/qna/list_view?page="+1;
		}
			
		qnaData = qnaBO.getQnAListByPage(page, totalPostNum, totalPageNum);
		model.addAttribute("qnaData",qnaData);

		model.addAttribute("viewName","/board/qnaListView");
		return "/template/layout";
	}
	
	@RequestMapping("/qna_view")
	public String qnaDetailView(HttpSession session, Model model, int postId) {

		QnA qna = new QnA(); 
		qna = qnaBO.getQnAbyPostId(postId);
		model.addAttribute("qna",qna);
		model.addAttribute("viewName","/board/qnaDetail");
		return "/template/layout";
	}
	
	@RequestMapping("/reply_view")
	public String AnswerDetailView(HttpSession session, Model model, int postId) {

		QnA qna = new QnA(); 
		qna = qnaBO.getQnAbyPostId(postId);
		model.addAttribute("qna",qna);
		model.addAttribute("viewName","/board/answerDetail");
		return "/template/layout";
	}
	
	@RequestMapping("/user_qna_view")
	public String userQnAListView(HttpSession session, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("viewName","/account/mypage_view");
			return "/template/layout";
		}
		List<QnA> qnaList = new ArrayList<>(); 
		qnaList = qnaBO.getQnAListByUserId(userId);
		model.addAttribute("qnaList",qnaList);
		
		model.addAttribute("viewName","/board/userQnAList");
		return "/template/layout";
	}
	
}
