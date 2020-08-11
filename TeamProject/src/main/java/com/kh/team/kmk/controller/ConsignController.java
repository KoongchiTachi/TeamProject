package com.kh.team.kmk.controller;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.MemberVo;
import com.kh.team.service.ConsignService;

@Controller
@RequestMapping(value = "/kmk/consign")
public class ConsignController { 
	 
	@Inject 
	private ConsignService consignService;
	
	// 위탁 신청
	@RequestMapping(value = "/consign_form", method = RequestMethod.GET)
	public String consignForm(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberVo memberVo = consignService.selectMemberByConsign(m_id);
		System.out.println("m_id : " + m_id);
		System.out.println("memberVo : " + memberVo);
		model.addAttribute("memberVo", memberVo);
		return "/kmk/consign/consign_form"; 
	}
	
	// 위탁 신청 안내
	
}
