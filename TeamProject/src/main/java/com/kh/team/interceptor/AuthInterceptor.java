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
		String user_id = (String)session.getAttribute("user_id");
		System.out.println("login_id: " + user_id);
		
		// 로그인 되어 있지 않다면
		if (user_id == null || user_id.equals("")) {
			String uri = request.getRequestURI(); // /board/selectBybno
			String queryString = request.getQueryString(); // bno=1&page=1&perPage=10
			String targetLocation = uri;
			if (!queryString.equals("")) {
				targetLocation += "?" + queryString;
			}
			// 사용자가 요청했던 경로 정보
			session.setAttribute("targetLocation", targetLocation);
			response.sendRedirect("/member/login"); // 로그인 폼으로 이동
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
