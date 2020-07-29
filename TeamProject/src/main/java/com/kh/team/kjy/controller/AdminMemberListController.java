package com.kh.team.kjy.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/admin")
public class AdminMemberListController {

	@Inject
	private MemberService memberService;
	
	// 관리자 - 회원 리스트
	@RequestMapping(value = "/adminMemberList", method = RequestMethod.GET)
	public void adminMemberList(Model model) throws Exception {
		List<MemberVo> list = memberService.memberList();
		model.addAttribute("list", list);
	}
	
}
