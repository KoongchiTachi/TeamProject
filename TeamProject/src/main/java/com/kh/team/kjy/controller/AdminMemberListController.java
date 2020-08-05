package com.kh.team.kjy.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.AdminMemberListPagingDto;
import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/admin")
public class AdminMemberListController {

	@Inject
	private MemberService memberService;
	
	// 관리자 - 회원 리스트(페이징)
	@RequestMapping(value = "/adminMemberList", method = RequestMethod.GET)
	public void adminMemberList(AdminMemberListPagingDto adminMemberListPagingDto, Model model) throws Exception {
		adminMemberListPagingDto.setPageInfo();
		int totalCount = memberService.getCount(adminMemberListPagingDto);
		adminMemberListPagingDto.setTotalCount(totalCount);
		List<MemberVo> list = memberService.memberList(adminMemberListPagingDto);
		model.addAttribute("list", list);
		model.addAttribute("adminMemberListPagingDto", adminMemberListPagingDto);
	}
	
	// 관리자 - 회원 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(String m_id) throws Exception {
		boolean result = memberService.auctioningMember(m_id);
		if (result == true) {
			memberService.deleteMember(m_id);
			return "success";
		} else {
			return "failure";
		}
	}
	
}
