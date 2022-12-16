package com.project.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.notice.bo.NoticeBO;
import com.project.notice.model.Notice;
import com.project.notice.model.NoticeViewData;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeBO noticeBO;
	/*
	@RequestMapping("/list_view")
	public String noticeListView(HttpSession session, Model model) {
		
		List<Notice> noticeList = new ArrayList<>(); 
		noticeList = noticeBO.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		model.addAttribute("viewName","/board/noticeList");
		return "/template/layout";
	}
	*/
	@RequestMapping("/detail_view")
	public String NoticeDetailView(Model model, int noticeId,
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		Notice notice = noticeBO.getNoticeByNoticeId(noticeId);
		
		if (page != null ) {
			model.addAttribute("page",page);
		}
		model.addAttribute("notice",notice);
		model.addAttribute("viewName","/board/noticeDetail");
		return "/template/layout";
	} 
	
	
	@RequestMapping("/list_view")
	public String NoticeListViewByPage(Model model, 
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) { 
		
		NoticeViewData noticeData = new NoticeViewData();
		
		Integer totalPostNum = noticeBO.getCurrentNoticeId();
		Integer totalPageNum = noticeBO.calculateTotalPageNum(totalPostNum);
		if (page > totalPageNum ) {
			return "redirect:/admin/notice/list_view?page="+totalPageNum;
		};
		if (page < 1) {
			return "redirect:/admin/notice/list_view?page="+1;
		}
			
		noticeData = noticeBO.getNoticeListByPage(page, totalPostNum, totalPageNum);
		
		model.addAttribute("noticeData",noticeData);
		model.addAttribute("viewName","/board/noticeList");
		return "/template/layout";
	}
	
}
