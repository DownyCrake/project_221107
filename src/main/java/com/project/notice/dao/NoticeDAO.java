package com.project.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.notice.model.Notice;

@Repository
public interface NoticeDAO {
	
	public int insertNotice(
			@Param("subject") String subject, 
			@Param("content") String content);

	public List<Notice> selectNoticeList();
	
	public Notice selectNoticeByNoticeId(int noticeId);
	
	public int updateNotice(
			@Param("noticeId") int noticeId, 
			@Param("subject") String subject, 
			@Param("content") String content);
	
	public int deleteNoticeById(int noticeId);
	
	public Integer selectCurrentNoticeId();
	
	public List<Notice> selectNoticeListByNoticeIdAndPageSize(
			@Param("noticeId") int postId, 
			@Param("pageSize") int pageSize);
}
