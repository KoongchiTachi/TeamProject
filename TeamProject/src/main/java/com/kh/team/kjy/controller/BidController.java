package com.kh.team.kjy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.BidListPagingDto;
import com.kh.team.domain.BidVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.service.BidService;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/member")
public class BidController {

	@Inject
	private BidService bidService;
	@Inject
	private MemberService memberService;
	
	// 응찰 입력
	
	
	// 응찰 내역(페이징)
	@RequestMapping(value = "/myBidList", method = RequestMethod.GET)
	public void myBidList(HttpServletRequest request, BidListPagingDto bidListPagingDto, Model model) throws Exception {
		bidListPagingDto.setPageInfo();
		int totalCount = bidService.getCount(bidListPagingDto);
		bidListPagingDto.setTotalCount(totalCount);
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		int startRow = bidListPagingDto.getStartRow();
		int endRow = bidListPagingDto.getEndRow();
		List<BidVo> list = bidService.bidList(m_id, startRow, endRow);
		MemberVo memberVo = memberService.selectMember(m_id);
		String m_name = memberVo.getM_name();
		
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());
		model.addAttribute("bidListPagingDto", bidListPagingDto);
		model.addAttribute("m_name", m_name);
	}
	
}
