package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Category;
import com.ssafy.happyhouse.model.dto.Question;
import com.ssafy.happyhouse.model.dto.Reply;

public interface QnAService {

	// Category
	public List<Category> searchAllCategory();
	
	// Question
	public List<Question> searchAllQuestion();
	public List<Question> searchQuestionByTitle(String title);
	public Question searchQuestionById(int id);
	public int addQuestion(Question question);
	public int updateQuestion(Question question);
	public int removeQuestion(int id);
	
	
	// Reply
	public List<Reply> searchAllReply(int qId);
	public int addReply(Reply reply);
	public int updateReply(Reply reply);
	public int removeReply(int id);
}
