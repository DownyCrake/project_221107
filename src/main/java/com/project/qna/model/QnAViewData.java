package com.project.qna.model;

import java.util.List;

public class QnAViewData {
	
	private List<QnA> qnaList;
	
	private int pageNumber;
	
	private List<Integer> pageNumberList;
	
	private boolean firstSection = false;	// false - not first section
	
	private boolean lastSection = false;	// false - not last section

	private int prePage;
	
	private int nextPage;

	public List<QnA> getQnaList() {
		return qnaList;
	}

	public void setQnaList(List<QnA> qnaList) {
		this.qnaList = qnaList;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public List<Integer> getPageNumberList() {
		return pageNumberList;
	}

	public void setPageNumberList(List<Integer> pageNumberList) {
		this.pageNumberList = pageNumberList;
	}

	public boolean isFirstSection() {
		return firstSection;
	}

	public void setFirstSection(boolean firstSection) {
		this.firstSection = firstSection;
	}

	public boolean isLastSection() {
		return lastSection;
	}

	public void setLastSection(boolean lastSection) {
		this.lastSection = lastSection;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
}
