package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String mainPage() {
		return "index";
	}
	
	@GetMapping("/house/deal")
	public String houseDealPage() {
		return "house/houseDealPage";
	}
	@GetMapping("/house/news")
	public String houseNewsPage() {
		return "house/newsPage";
	}
	@GetMapping("/house/notice")
	public String houseNoticePage() {
		return "house/noticePage";
	}
	
	@GetMapping("/error/error")
	public String ErrorPage() {
		return "error/error";
	}
	
	@GetMapping("/test")
	public String testPage() {
		return "house/testknapsack";
	}
	
}
