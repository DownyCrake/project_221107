package com.project.introduction.model;

public class IntroductionImage {

	private int id;
	private int IntroductionId;
	private String ImagePath;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIntroductionId() {
		return IntroductionId;
	}
	public void setIntroductionId(int introductionId) {
		IntroductionId = introductionId;
	}
	public String getImagePath() {
		return ImagePath;
	}
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
}
