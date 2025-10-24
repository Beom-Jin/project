package com.ict.project.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LogInCheckInterceptor implements HandlerInterceptor{
	//DispatcherServlet -> preHandle -> Controller
	//DispatcherServlet <- postHandle <- Controller
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// boolean ::  true : Controller, false : back
		//return HandlerInterceptor.super.preHandle(request, response, handler);
		
		System.out.println("Interceptor 진입 (servlet-context.xml 수정필요) ");
		HttpSession session = request.getSession(false);  // 기존세션 유지, 없으면 null
		if(session == null || session.getAttribute("loginchk") == null) {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().write(""
					+ "<script>"	
					+ "alert('로그인이 필요합니다.'); "
					+ "location.href = '/membersLoginForm'; "
					+ "</script>"
					);
			
			response.getWriter().flush();
			return false;
		}
		
		return true; 
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
