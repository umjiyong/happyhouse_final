package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class News implements Serializable { 

	private int idx;
	private String title;
	private String articleUrl;
	private String imgUrl;
	
	public News(int idx, String title, String articelUrl, String imgUrl) {
		super();
		this.idx = idx;
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
	
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getArticleUrl() {
		return articleUrl;
	}

	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}

	@Override
	public String toString() {
		return "News [idx=" + idx + ", title=" + title + ", articleUrl=" + articleUrl + ", imgUrl=" + imgUrl + "]";
	}

	
}
