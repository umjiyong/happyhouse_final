package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.News;
import com.ssafy.happyhouse.model.service.NewsService;

@RestController
@RequestMapping("/news")
@CrossOrigin("*")
public class NewsController {
	private NewsService newsService;
	
	@Autowired 
	public NewsController(NewsService newsService) {
		this.newsService = newsService;
	}

	@GetMapping("/list")
	public ResponseEntity<List<News>> NewsList(){
		System.out.println("GET : Newslist");
		
		List<News> res = newsService.getNews();
		return new ResponseEntity<List<News>> (res,HttpStatus.OK);
	}
	
	
}
