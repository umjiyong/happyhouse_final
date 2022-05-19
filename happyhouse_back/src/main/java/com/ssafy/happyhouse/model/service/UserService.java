package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.User;

@Service
public interface UserService {
	public User search(String id);
	
	public List<User> searchAll();
	
	public int add(User user);
	
	public int update(User user);
	
	public int remove(String id);
	
	public User login(String id, String password) throws SQLException;


}