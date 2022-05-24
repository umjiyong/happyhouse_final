package com.ssafy.happyhouse.model.dto;

public class Reply {
	private Integer id;
	private Integer qId;
	private Integer prId;
	private String content;
	private String userId;
	private String regTime;
	
	public Reply(Integer id, Integer qId, Integer prId, String content, String userId, String regTime) {
		super();
		this.id = id;
		this.qId = qId;
		this.prId = prId;
		this.content = content;
		this.userId = userId;
		this.regTime = regTime;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getqId() {
		return qId;
	}
	public void setqId(Integer qId) {
		this.qId = qId;
	}
	public Integer getPrId() {
		return prId;
	}
	public void setPrId(Integer prId) {
		this.prId = prId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
		return "Reply [id=" + id + ", qId=" + qId + ", prId=" + prId + ", content=" + content + ", userId=" + userId
				+ ", regTime=" + regTime + "]";
	}
	
	
}
