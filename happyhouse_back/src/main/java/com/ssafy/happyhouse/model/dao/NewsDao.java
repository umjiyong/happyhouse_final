package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.News;

@Repository

public interface NewsDao {
	
	public List<News> getNews() throws SQLException;

}
