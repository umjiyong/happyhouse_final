package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.UserDao;
import com.ssafy.happyhouse.model.dto.User;

@Service
public class UserServiceImp implements UserService{
	
	@Autowired
	private UserDao dao;
	
	@Override
	public int add(User user) {
		
		try {
			int res = dao.add(user);
			if(res > 0) return res;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public User search(String id) {
		try {
			return dao.search(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<User> searchAll() {
		try {
			return dao.searchAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int update(User user) {
		try {
			return dao.update(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int remove(String id) {
		try {
			return dao.remove(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public User login(User user) throws SQLException {
		try {
			Map<String,String> map = new HashMap<String, String>();
			map.put("id", user.getId());
			map.put("password", user.getPassword());
			return dao.login(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User userInfo(String userid) throws Exception {
		return dao.userInfo(userid);
	}

}