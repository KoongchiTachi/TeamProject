package com.kh.team;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	// 관리자 페이지
	@RequestMapping("/admin")
	public void admin() throws Exception {
		
	}
	
	// 관리자 로그아웃
	@RequestMapping("/admin/logout")
	public String adminLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
}
