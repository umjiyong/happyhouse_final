package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class News implements Serializable { 

	private String title;
	private String articleUrl;
	private String imgUrl;
	
	public News(String title, String articelUrl, String imgUrl) {
		super();
		this.title = title;
		this.articleUrl = articelUrl;
		this.imgUrl = imgUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArticelUrl() {
		return articleUrl;
	}

	public void setArticelUrl(String articelUrl) {
		this.articleUrl = articelUrl;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Override
	public String toString() {
		return "News [title=" + title + ", articelUrl=" + articleUrl + ", imgUrl=" + imgUrl + "]";
	}

}
