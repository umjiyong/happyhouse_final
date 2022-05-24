package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Category;
import com.ssafy.happyhouse.model.dto.Question;
import com.ssafy.happyhouse.model.dto.Reply;
import com.ssafy.happyhouse.model.service.QnAService;

@RestController
@RequestMapping("/qna")
@CrossOrigin("*")
public class QnAController {
	private QnAService qnaService;
	
	@Autowired 
	public QnAController(QnAService qnaService) {
		this.qnaService = qnaService;
	}
	
	@GetMapping("/category")
	public ResponseEntity<?> categoryList(){
		List<Category> categoryList = qnaService.searchAllCategory();
		return new ResponseEntity<List<Category>> (categoryList, HttpStatus.OK);
	}

	@GetMapping("/list")
	public ResponseEntity<?> questionList(){
		System.out.println("GET : question list");
		List<Question> questionList = qnaService.searchAllQuestion();
		return new ResponseEntity<List<Question>> (questionList,HttpStatus.OK);
	}
	
	@GetMapping("/{q_id}") 
	public ResponseEntity<?> searchQnA(@PathVariable String q_id) {
		int qId = Integer.parseInt(q_id);
		Question q = qnaService.searchQuestionById(qId);
		List<Reply> replyList = qnaService.searchAllReply(qId);
		Map<String,Object> resMap = new HashMap<String,Object>();
		System.out.println("GET: QnA");
		System.out.println("question "+qId+" : "+q);
		System.out.println("replyList : "+replyList);
		resMap.put("question",q);
		resMap.put("replyList",replyList);
		return new ResponseEntity<Map<String,Object>> (resMap, HttpStatus.OK);
	}
	
	
	@GetMapping("/question/{q_id}") 
	public ResponseEntity<?> searchQuestion(@PathVariable String q_id) {
		int qId = Integer.parseInt(q_id);
		Question q = qnaService.searchQuestionById(qId);
		return new ResponseEntity<Question> (q, HttpStatus.OK);
	}
	
	
	@PostMapping("/question")
	public ResponseEntity<?> registQuestion(Question question) {
		System.out.println("registQuestion : " + question );
		qnaService.addQuestion(question);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@PutMapping("/question")
	public ResponseEntity<?> updateQuestion(Question question) {
		qnaService.updateQuestion(question);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@DeleteMapping("/question/{q_id}")
	public ResponseEntity<?> removeQuestion(@PathVariable String q_id) {
		int qId = Integer.parseInt(q_id);
		qnaService.removeQuestion(qId);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	
	// Reply 
	
	@PostMapping("/reply")
	public ResponseEntity<?> registReply(Reply reply) {
		System.out.println("regist Reply : "+reply);
		qnaService.addReply(reply);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@PutMapping("/reply")
	public ResponseEntity<?> updateReply(Reply reply) {
		qnaService.updateReply(reply);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
	@DeleteMapping("/reply/{r_id}")
	public ResponseEntity<?> removeReply(@PathVariable String r_id) {
		int rId = Integer.parseInt(r_id);
		qnaService.removeReply(rId);
		return new ResponseEntity<String> ("success", HttpStatus.OK);
	}
	
}
