package com.project.notice.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.notice.dao.NoticeDAO;
import com.project.notice.model.Notice;
import com.project.notice.model.NoticeViewData;

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
	
	private static final int pageSize = 3;
	private static final int sectionSize = 4;
	
	public Integer getCurrentNoticeId() {
		return noticeDAO.selectCurrentNoticeId();
	}
	
	public int calculateTotalPageNum(int totalPostNum) {
		int totalPageNum = (totalPostNum / pageSize);
		if ((totalPostNum % pageSize) > 0) {
			totalPageNum ++;  
			}
		return totalPageNum;
	}
	
	public List<Notice> getNoticeListByNoticeIdAndPageSize(int postId, int pageSize){
		return noticeDAO.selectNoticeListByNoticeIdAndPageSize(postId, pageSize);
	}
	
	public NoticeViewData getNoticeListByPage(int page, int totalPostNum, int totalPageNum){
		NoticeViewData noticeData = new NoticeViewData();
		
		int totalSectionNum = (totalPageNum / sectionSize);
		if ((totalPageNum % sectionSize) > 0) {
			totalSectionNum ++;
		}
		int firstPostId = totalPostNum - ( (page - 1 ) * pageSize);
		List<Notice> noticeList = getNoticeListByNoticeIdAndPageSize(firstPostId, pageSize);

		// 계산
		int presentSection = (page/ sectionSize);
		if ((page % sectionSize) > 0) {
			presentSection ++;
		}
		if (presentSection == 1) {
			noticeData.setFirstSection(true);
		} else if (presentSection == totalSectionNum) {
			noticeData.setLastSection(true);
		}
		
		List<Integer> pageNum = new ArrayList<>();
		int firstPageOfSection = ( (presentSection - 1 ) * sectionSize ) + 1;
		if (presentSection == totalSectionNum) {
			for ( int i = firstPageOfSection; i <= totalPageNum; i++) {
				pageNum.add(i);
			}
		} else {
			int lastPageNum = (presentSection * sectionSize ) ;
			for (int i = firstPageOfSection; i <= lastPageNum; i++ ) {
				pageNum.add(i);
			}
		}
		int prevPage = page - ( page % sectionSize);
		int nextPage = (sectionSize * (((page - 1)/sectionSize)+1) ) +1;
		//
		
		
		noticeData.setNoticeList(noticeList);
		noticeData.setPageNumber(page);
		noticeData.setPageNumberList(pageNum);
		noticeData.setSectionSize(sectionSize);
		noticeData.setPrePage(prevPage);
		noticeData.setNextPage(nextPage);
		return noticeData;
	}
	  
	 
}
