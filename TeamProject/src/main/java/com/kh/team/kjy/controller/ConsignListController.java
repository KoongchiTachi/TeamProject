package com.kh.team.kjy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.ConsignListPagingDto;
import com.kh.team.domain.ConsignVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.WishlistVo;
import com.kh.team.service.ConsignListService;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/member")
public class ConsignListController {

	@Inject
	private ConsignListService consignListService;
	@Inject
	private MemberService memberService;
	
	// 위탁 추가
	@RequestMapping(value = "/addConsign", method = RequestMethod.GET)
	public void insertConsign(ConsignVo consignListVo) throws Exception {
		
	}
	
	// 위탁 목록
	@RequestMapping(value = "/consignList", method = RequestMethod.GET)
	public void consignList(HttpServletRequest request, ConsignListPagingDto consignListPagingDto, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		consignListPagingDto.setPageInfo();
		int totalCount = consignListService.getCount(consignListPagingDto, m_id);
		consignListPagingDto.setTotalCount(totalCount);
		int startRow = consignListPagingDto.getStartRow();
		int endRow = consignListPagingDto.getEndRow();
		List<ConsignVo> list = consignListService.consignList(m_id, startRow, endRow);
		MemberVo memberVo = memberService.selectMember(m_id);
		String m_name = memberVo.getM_name();
		
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());
		model.addAttribute("consignListPagingDto", consignListPagingDto);
		model.addAttribute("m_name", m_name);
	}
	
}
