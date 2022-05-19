package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.User;

@Mapper
@Repository

public interface UserDao {
	
	public User search(String id) throws SQLException;      // id에 해당하는 user 반환 
	
	public List<User> searchAll() throws SQLException;      // db에 있는 모든 회원 list 반환

	public int add(User user)	 throws SQLException;   // 회원 가입
	
	public int update(User user) throws SQLException;    // 회원 수정
	
	public int remove(String id)    throws SQLException;   // 회원 삭제
	
	public User login(Map<String, String> map) throws SQLException;   // 로그인
}












