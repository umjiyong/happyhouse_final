package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class User implements Serializable {
	private String id;
	private String password;
	private String email;
	private String name;
	private int age;
	public User() {}
	public User(String id, String name, String email) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
	}
	public User(String id, String password, String email, String name, int age) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.name = name;
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [id=").append(id)
				.append(", password=").append(password)
				.append(", name=").append(name)
				.append(", email=").append(email)
				.append("]");
		return builder.toString();
	}
}
