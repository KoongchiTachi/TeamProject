package com.kh.team.kjy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/member")
public class KjyController {

	@Inject
	private MemberService memberService;
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() throws Exception {

	}
	
	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(String m_id, String m_pw, HttpSession session) throws Exception {
		System.out.println("m_id:" + m_id);
		System.out.println("m_pw:" + m_pw);
		boolean result = memberService.login(m_id, m_pw);
		System.out.println("result:" + result);
		if (result == true) {
			session.setAttribute("m_id", m_id);
			// TODO 로그인 안하면 다른 페이지 접근 불가능은 나중에
			return "redirect:/kjy/member/myPage";
		}
		return "redirect:/kjy/member/login";
	}
	
	// 회원가입폼 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() throws Exception {
		
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/joinRun", method = RequestMethod.POST)
	public String joinRun(MemberVo memberVo) throws Exception {
		System.out.println("memberVo:" + memberVo);
		memberService.insertMember(memberVo);
		return "redirect:/kjy/member/login";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/checkDupId", method = RequestMethod.GET)
	public String checkDupId(String m_id) throws Exception {
		MemberVo memberVo = memberService.selectMember(m_id);
		if (memberVo != null) {
			return "unavailable";
		}
		return "available";
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPage() throws Exception {
		
	}
	
	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public void wishList() throws Exception {
		
	}
}
