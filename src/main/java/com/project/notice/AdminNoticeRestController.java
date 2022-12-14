package com.project.notice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.notice.bo.NoticeBO;

@RestController
@RequestMapping("/admin/notice")
public class AdminNoticeRestController {

	@Autowired
	private NoticeBO noticeBO;
	
	@RequestMapping("/create_notice")
	public Map<String, Object> CreateNotice(String subject, String content) {
		Map<String, Object> result = new HashMap<>();
		int row = noticeBO.addNotice(subject, content);
		if (row > 0) {
			result.put("code", 100);
		}else {
			result.put("errorMessage", "공지 등록에 실패했습니다.");
		}
		return result;
	}
	
	@RequestMapping("/update_notice")
	public Map<String, Object> UpdateNotice(int noticeId, String subject, String content) {
		Map<String, Object> result = new HashMap<>();
		int row = noticeBO.updateNotice(noticeId, subject, content);
		if (row > 0) {
			result.put("code", 100);
		}else {
			result.put("errorMessage", "공지 수정에 실패했습니다.");
		}
		return result;
	}
	
	@DeleteMapping("/delete_notice")
	public Map<String, Object> DeleteNoticeByNoticeId(int noticeId) {
		Map<String, Object> result = new HashMap<>();
		int row = noticeBO.deleteNoticeById(noticeId);
		if (row > 0) {
			result.put("code", 100);
		}else {
			result.put("errorMessage", "공지 삭제에 실패했습니다.");
		}
		return result;
	}

}
