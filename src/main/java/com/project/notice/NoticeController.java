package com.project.notice;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.notice.bo.NoticeBO;
import com.project.notice.model.Notice;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeBO noticeBO;
	
	@RequestMapping("/list_view")
	public String noticeListView(HttpSession session, Model model) {
		
		List<Notice> noticeList = new ArrayList<>(); 
		noticeList = noticeBO.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		model.addAttribute("viewName","/board/noticeList");
		return "/template/layout";
	}
	
	@RequestMapping("/detail_view")
	public String NoticeDetailView(Model model, int noticeId) {
		Notice notice = noticeBO.getNoticeByNoticeId(noticeId);
		
		model.addAttribute("notice",notice);
		model.addAttribute("viewName","/board/noticeDetail");
		return "/template/layout";
	} 
	
}
