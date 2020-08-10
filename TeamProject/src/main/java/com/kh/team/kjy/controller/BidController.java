package com.kh.team.kjy.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.BidListPagingDto;
import com.kh.team.domain.BidVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.SuccessBidPagingDto;
import com.kh.team.persistence.BidDao;
import com.kh.team.service.BidService;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/kjy/member")
public class BidController {

	@Inject
	private BidService bidService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private BidDao bidDao;
	 
	// 응찰 신청
	@ResponseBody
	@RequestMapping(value ="/bidSubscription", method= RequestMethod.POST)
	public String bidSubscription(BidVo bidVo, String pno, int b_price) throws Exception {
		bidVo.setB_price(b_price);
		int check_topBidding = bidDao.checkExpectedSuccess(pno);
		System.out.println("check_topBidding : " + check_topBidding);
		if (check_topBidding > 0) bidDao.changeExpectedSuccess(pno);
		bidService.insertBid(bidVo, pno, b_price);
		return "success";
	}
	
	// 응찰 내역(페이징)
	@RequestMapping(value = "/myBidList", method = RequestMethod.GET)
	public void myBidList(HttpServletRequest request, BidListPagingDto bidListPagingDto, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		bidListPagingDto.setPageInfo();
		int totalCount = bidService.getCount(bidListPagingDto, m_id);
		bidListPagingDto.setTotalCount(totalCount);
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
	
	// 낙찰 내역(페이징)
	@RequestMapping(value = "/successBidList", method = RequestMethod.GET)
	public void successBidList(HttpServletRequest request, SuccessBidPagingDto successBidPagingDto, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		successBidPagingDto.setPageInfo();
		int totalCount = bidService.successBidCount(successBidPagingDto, m_id);
		successBidPagingDto.setTotalCount(totalCount);
		int startRow = successBidPagingDto.getStartRow();
		int endRow = successBidPagingDto.getEndRow();
		List<BidVo> list = bidService.successBidList(m_id, startRow, endRow);
		MemberVo memberVo = memberService.selectMember(m_id);
		String m_name = memberVo.getM_name();
		
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());
		model.addAttribute("successBidPagingDto", successBidPagingDto);
		model.addAttribute("m_name", m_name);
	}
	
}
