package com.kami.kami.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		String userId=(String)session.getAttribute("loginId");
		
		if(userId!=null) {
			return true;
		}else {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		
	}
}
