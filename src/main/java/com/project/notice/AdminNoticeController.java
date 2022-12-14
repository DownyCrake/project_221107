package com.project.notice;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.notice.bo.NoticeBO;
import com.project.notice.model.Notice;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	private NoticeBO noticeBO;
	
	@RequestMapping("/create_notice_view")
	public String CreateNoticeView() {
		
		return "/admin/notice/adminCreateNotice";
	}
	
	@RequestMapping("/list_view")
	public String NoticeListView(Model model) {
		List<Notice> noticeList = new ArrayList<>();
		noticeList = noticeBO.getNoticeList();
		
		model.addAttribute("noticeList",noticeList);
		return "/admin/notice/adminNoticeList";
	}
	
	@RequestMapping("/datail_view")
	public String NoticeDetailView(Model model, int noticeId) {
		Notice notice = noticeBO.getNoticeByNoticeId(noticeId);
		
		model.addAttribute("notice",notice);
		return "/admin/notice/adminNoticeDetail";
	} 
	
	@RequestMapping("/update_view")
	public String NoticeUpdateView(Model model, int noticeId) {
		Notice notice = noticeBO.getNoticeByNoticeId(noticeId);
		
		model.addAttribute("notice",notice);
		return "/admin/notice/adminUpdateNotice";
	} 
}
