package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.QnADao;
import com.ssafy.happyhouse.model.dto.Category;
import com.ssafy.happyhouse.model.dto.Question;
import com.ssafy.happyhouse.model.dto.Reply;

@Service
public class QnAServiceImp implements QnAService {

	private QnADao qnaDao;
	
	@Autowired
	public QnAServiceImp(QnADao qnaDao) {
		this.qnaDao = qnaDao;
	}
	
	
	@Override
	public List<Category> searchAllCategory() {
		
		try {
			return qnaDao.searchAllCategory();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	public List<Question> searchAllQuestion() {
		
		try {
			return qnaDao.searchAllQuestion();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<Question> searchQuestionByTitle(String title) {
		try {
			return qnaDao.searchQuestionByTitle(title);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Question searchQuestionById(int id) {
		try {
			System.out.println("QnA Service searchQuestionById : "+id);
			return qnaDao.searchQuestionById(id);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int addQuestion(Question question) {
		System.out.println("Add Question... "+question);
		try {
			int newId = qnaDao.getNewQuestionId();
			question.setId(newId);
			return qnaDao.addQuestion(question);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateQuestion(Question question) {
		try {
			return qnaDao.updateQuestion(question);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int removeQuestion(int id) {
		try {
			return qnaDao.removeQuestion(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Reply> searchAllReply(int qId) {
		try {
			return qnaDao.searchAllReply(qId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int addReply(Reply reply) {
		try {
			int newId = qnaDao.getNewReplyId();
			reply.setId(newId);
			// prId가 0으로 요청이 들어오면 자기 자신을 부모 댓글로 지정
			if(reply.getPrId()==0) {
				reply.setPrId(newId);
			}
			return qnaDao.addReply(reply);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateReply(Reply reply) {
		try {
			return qnaDao.updateReply(reply);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int removeReply(int id) {
		try {
			return qnaDao.removeReply(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}





}
