package com.project.review.model;

import java.util.List;

public class ReviewViewData {

	private List<Review> reviewList;
	
	private int pageNumber;
	
	private List<Integer> pageNumberList;
	
	private boolean firstSection = false;	// false - not first section
	
	private boolean lastSection = false;	// false - not last section

	private int prePage;
	
	private int nextPage;
	
	private float avgPoint;
	
	public void setAvgPoint(List<Review> reviewList) {
		int sumPoint = 0; 
		float num = 0;
		for (int i = 0; i < reviewList.size(); i++) {
			Integer point = reviewList.get(i).getPoint();
			if (point != null) {
				sumPoint += point;
				num ++; 
			}
		}
		this.avgPoint = (sumPoint / num);
	}
	
	public float getAvgPoint() {
		return avgPoint;
	}

	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
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
