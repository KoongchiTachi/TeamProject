package com.kh.team.kjy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/member")
public class MyPageController {

	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPageGet(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberVo memberVo = memberService.selectMember(m_id);
		model.addAttribute("memberVo", memberVo);
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public void myPagePost() throws Exception {
		
	}
	
}
