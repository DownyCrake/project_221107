package com.project.qna.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.qna.dao.QnADAO;
import com.project.qna.model.QnA;

@Service
public class QnABO {

	@Autowired
	private QnADAO qnaDAO;
	
	public int addQuestion(int userId, String userName, String subject,
			String content, boolean secret ) {
		return qnaDAO.insertQuestion(userId, userName, subject, content, secret);
	}

	public QnA getQnAbyPostId(int postId) {
		return qnaDAO.selectQnAbyPostId(postId);
	}
	
	public List<QnA> getQnAList(){
		return qnaDAO.selectQnAList();
	}
	
	public int updateReplyByPostId(int postId, String reply){
		return qnaDAO.updateReplyByPostId(postId, reply);
	}
	
	public List<QnA> getQnAListByUserId(int userId){
		return qnaDAO.selectQnAListByUserId(userId);
	}

}
