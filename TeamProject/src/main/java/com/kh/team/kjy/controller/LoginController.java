package com.kh.team.kjy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/member")
public class LoginController {

	@Inject
	private MemberService memberService;
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() throws Exception {

	}
	
	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(String m_id, String m_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("m_id:" + m_id);
		System.out.println("m_pw:" + m_pw);
		boolean result = memberService.login(m_id, m_pw);
		System.out.println("result:" + result);
		if (result == true) {
			session.setAttribute("m_id", m_id);
			// TODO 로그인 안하면 다른 페이지 접근 불가능은 나중에
			return "redirect:/";
		}
		rttr.addFlashAttribute("msg", "fail");
		return "redirect:/kjy/member/login";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/kjy/member/login";
	}
	
}
