package com.project.qna.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.notice.model.Notice;
import com.project.notice.model.NoticeViewData;
import com.project.qna.dao.QnADAO;
import com.project.qna.model.QnA;
import com.project.qna.model.QnAViewData;

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
	
	private static final int pageSize = 3;
	private static final int sectionSize = 4;
	
	public Integer getCurrentQnAId() {
		return qnaDAO.selectCurrentQnAId();
	}
	
	public int calculateTotalPageNum(int totalPostNum) {
		int totalPageNum = (totalPostNum / pageSize);
		if ((totalPostNum % pageSize) > 0) {
			totalPageNum ++;  
			}
		return totalPageNum;
	}
	
	public List<QnA> getQnAListByNoticeIdAndPageSize(int postId, int pageSize){
		return qnaDAO.selectQnAListByQnAIdAndPageSize(postId, pageSize);
	}
	
	public QnAViewData getQnAListByPage(int page, int totalPostNum, int totalPageNum){
		QnAViewData qnaData = new QnAViewData();
		
		int totalSectionNum = (totalPageNum / sectionSize);
		if ((totalPageNum % sectionSize) > 0) {
			totalSectionNum ++;
		}
		int firstPostId = totalPostNum - ( (page - 1 ) * pageSize);
		List<QnA> qnaList = getQnAListByNoticeIdAndPageSize(firstPostId, pageSize);

		// 계산
		int presentSection = (page/ sectionSize);
		if ((page % sectionSize) > 0) {
			presentSection ++;
		}
		if (presentSection == 1) {
			qnaData.setFirstSection(true);
		} 
		if (presentSection == totalSectionNum) {
			qnaData.setLastSection(true);
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
		
		qnaData.setQnaList(qnaList);
		qnaData.setPageNumber(page);
		qnaData.setPageNumberList(pageNum);
		qnaData.setPrePage(prevPage);
		qnaData.setNextPage(nextPage);
		return qnaData;
	}
	
	
}
