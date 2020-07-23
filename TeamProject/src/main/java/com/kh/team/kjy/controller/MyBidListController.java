package com.kh.team.kjy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.BidVo;
import com.kh.team.service.BidService;

@Controller
@RequestMapping("/kjy/member")
public class MyBidListController {

	@Inject
	private BidService bidService;
	
	@RequestMapping(value = "/myBidList", method = RequestMethod.GET)
	public void myBidList(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<BidVo> list = bidService.bidList(m_id);
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());
	}
	
}
