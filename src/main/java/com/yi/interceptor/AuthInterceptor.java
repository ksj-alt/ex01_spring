package com.yi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("Auth");
		if(object == null) { //login안한경우
			// /ex01/member/login
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false; //기존 controller 진입을 막게 됨
		}
		return true;
	}

}
