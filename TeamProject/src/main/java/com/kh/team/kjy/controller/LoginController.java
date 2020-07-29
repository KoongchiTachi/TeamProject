package com.kh.team.kjy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.MemberVo;
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
	public String loginPost(String m_id, String m_pw, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		boolean result = memberService.login(m_id, m_pw);
		if (result == true) {
			// 로그인 성공 시 세션에 저장
			session.setAttribute("m_id", m_id);
			// 요청 주소 가져오기
			Object targetLocation = session.getAttribute("targetLocation");
			if (targetLocation == null || targetLocation.equals("")) {
				return "redirect:/";
			} else {
				return "redirect:/" + targetLocation.toString();
			}
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
