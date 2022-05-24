package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Category;
import com.ssafy.happyhouse.model.dto.Question;
import com.ssafy.happyhouse.model.dto.Reply;

@Repository
public interface QnADao {

	// Category 
	public List<Category> searchAllCategory() throws SQLException;
	
	// Question
	public List<Question> searchAllQuestion() throws SQLException;
	public List<Question> searchQuestionByTitle(String title) throws SQLException;
	public Question searchQuestionById(int id) throws SQLException;
	public int getNewQuestionId() throws SQLException;
	public int addQuestion(Question question) throws SQLException;
	public int updateQuestion(Question question) throws SQLException;
	public int removeQuestion(int id) throws SQLException;
	
	
	// Reply
	public List<Reply> searchAllReply(int qId) throws SQLException;
	public int getNewReplyId() throws SQLException;
	public int addReply(Reply reply) throws SQLException;
	public int updateReply(Reply reply) throws SQLException;
	public int removeReply(int id) throws SQLException;
	
}
