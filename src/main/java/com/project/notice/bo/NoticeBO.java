package com.project.notice.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.notice.dao.NoticeDAO;
import com.project.notice.model.Notice;

@Service
public class NoticeBO {

	@Autowired
	private NoticeDAO noticeDAO;
	
	public int addNotice(String subject, String content) {
		return noticeDAO.insertNotice(subject, content);
	}
	
	public List<Notice> getNoticeList(){
		return noticeDAO.selectNoticeList();
	}
	
	public Notice getNoticeByNoticeId(int noticeId) {
		return noticeDAO.selectNoticeByNoticeId(noticeId);
	}
	
	public int updateNotice(int noticeId, String subject, String content) {
		return noticeDAO.updateNotice(noticeId, subject, content);
	}
	
	public int deleteNoticeById(int noticeId) {
		return noticeDAO.deleteNoticeById(noticeId);
	}
	
	/*
	 * public List<Notice> getNoticeListByCategoryId(int CategoryId){
	 * 
	 * }
	 */
}
