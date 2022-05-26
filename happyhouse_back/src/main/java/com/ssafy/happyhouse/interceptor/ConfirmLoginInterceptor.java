package com.ssafy.happyhouse.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ssafy.happyhouse.model.dto.User;

public class ConfirmLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ConfirmLogin 인터셉터 실행!!!");
		User user = (User)request.getSession().getAttribute("userInfo");
		
		if(user==null) {
			System.out.println(user);
			response.sendRedirect("/happyhouse/user/login");
			return false;
		}
		
		return true;
	}
	
}
