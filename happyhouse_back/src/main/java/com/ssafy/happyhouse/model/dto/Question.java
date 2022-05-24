package com.ssafy.happyhouse.model.dto;

public class Question {
	
	private Integer id;
	private String title;
	private String content;
	private Integer category;
	private String userId;
	private String regTime;
	
	public Question(Integer id, String title, String content, Integer category, String userId, String regTime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.category = category;
		this.userId = userId;
		this.regTime = regTime;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getCategory() {
		return category;
	}
	public void setCategory(Integer category) {
		this.category = category;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	
	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", content=" + content + ", category=" + category
				+ ", userId=" + userId + ", regTime=" + regTime + "]";
	}
	
	
	
	
}
