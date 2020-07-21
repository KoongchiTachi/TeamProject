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
	
	// 마이페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPageGet(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberVo memberVo = memberService.selectMember(m_id);
		model.addAttribute("memberVo", memberVo);
	}
	
	// 회원 정보 수정 폼
	@RequestMapping(value = "/modifyInfo", method = RequestMethod.GET)
	public void modifyInfoGet(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberVo memberVo = memberService.selectMember(m_id);
		model.addAttribute("memberVo", memberVo);
	}
	
	// 회원 정보 수정 처리
	@RequestMapping(value = "/modifyInfo", method = RequestMethod.POST)
	public String modifyInfoPost(MemberVo memberVo) throws Exception {
		System.out.println("memberVo:" + memberVo);
		memberService.updateMember(memberVo);
		return "redirect:/kjy/member/myPage";
	}
	
}
