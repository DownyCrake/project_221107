package com.project.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.qna.model.QnA;

@Repository
public interface QnADAO {
	
	public int insertQuestion(
			@Param("userId") int userId, 
			@Param("userName") String userName, 
			@Param("subject") String subject,
			@Param("content") String content, 
			@Param("secret") boolean secret);

	public QnA selectQnAbyPostId(int postId); 
	
	public List<QnA> selectQnAList();
	
	public int updateReplyByPostId(
			@Param("postId") int postId,
			@Param("reply") String reply);
}
