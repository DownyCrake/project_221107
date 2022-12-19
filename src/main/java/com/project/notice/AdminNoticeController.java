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
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	private NoticeBO noticeBO;
	
	@RequestMapping("/create_notice_view")
	public String CreateNoticeView() {
		
		return "/admin/notice/adminCreateNotice";
	}
	
/*	@RequestMapping("/list_view")
	public String NoticeListView(Model model) {
		List<Notice> noticeList = new ArrayList<>();
		noticeList = noticeBO.getNoticeList();
		
		model.addAttribute("noticeList",noticeList);
		return "/admin/notice/adminNoticeList";
	}    */
	
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
	
	@RequestMapping("/list_view")
	public String NoticeListViewByPage(Model model, 
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) { 
		
		NoticeViewData noticeData = new NoticeViewData();
		
		Integer totalPostNum = noticeBO.getCurrentNoticeId();
		if (totalPostNum != null) {
		Integer totalPageNum = noticeBO.calculateTotalPageNum(totalPostNum);
		if (page > totalPageNum ) {
			return "redirect:/admin/notice/list_view?page="+totalPageNum;
		};
		if (page < 1) {
			return "redirect:/admin/notice/list_view?page="+1;
		}
			
		noticeData = noticeBO.getNoticeListByPage(page, totalPostNum, totalPageNum);
		}
		model.addAttribute("noticeData",noticeData);
		return "/admin/notice/adminNoticeList";
	}
}
