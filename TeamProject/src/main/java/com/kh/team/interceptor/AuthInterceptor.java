package com.kh.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
//		System.out.println("m_id: " + m_id);
		
		// 로그인 되어 있지 않다면
		if (m_id == null || m_id.equals("")) {
			String requestURI = request.getRequestURI(); // 클라이언트 요청 주소
			String contextPath = request.getContextPath(); // 현재 프로젝트 경로
			String uri = requestURI.substring(contextPath.length() + 1);
			String query = request.getQueryString(); // 주소 뒤 파라미터
			if (query == null || query.equals("")) {
				query = "";
			} else {
				query = "?" + query;
			}
			session.setAttribute("targetLocation", uri + query); // 세션에 주소 저장하기
			response.sendRedirect("/kjy/member/login"); // 로그인 폼으로 이동
			return false; // 요청을 계속 진행하지 않음
		}
		
		return true; // 계속진행
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
