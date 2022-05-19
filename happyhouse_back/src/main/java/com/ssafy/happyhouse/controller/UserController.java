package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.User;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userservice;
	
	
	@GetMapping("/login")
	public String userLoginPage() {
		return "/user/login";
	}
	
	@PostMapping("/login")
	public String login(String id, String password, HttpSession session, Model model) {
		System.out.println("id, pw : " + id +", " +password );
		try {
			User user = userservice.login(id, password);
			if (user != null) {
				session.setAttribute("userinfo", user);
				session.setMaxInactiveInterval(60 * 60);
				System.out.println("성공");
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
				return "redirect:/error/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생핬습니다.");
			return "redirect:/error/error";
		}
		
		return "redirect:/";
	}
	
	
	@GetMapping("/register")
	public String registerPage() {
		return "/user/register";
	}
	
	@PostMapping("/register")
	public String register(User user, Model model) {
		System.out.println("id" + user.getId() );
		try {
			int nu = userservice.add(user);
			
			System.out.println("nu : " + nu);
		} catch (Exception e) {
			model.addAttribute("msg", "회원 가입 중 문제가 발생했습니다.");
			return "redirect:/error/error";
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/modify")
	public String modifyPage(HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("userinfo");
		model.addAttribute("user", user);
		return "/user/modify";
	}
	
	@PostMapping("/modify")
	public String modify(User user, HttpSession session) {
		int n = userservice.update(user);
		if(n > 0) {
			session.setAttribute("userinfo", user);
		}
		
		return "/user/modify";
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		
		User user = (User) session.getAttribute("userinfo");
		userservice.remove(user.getId());
		session.removeAttribute("userinfo");
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
