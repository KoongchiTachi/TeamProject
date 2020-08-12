package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.team.domain.FaqPagingDto2;
import com.kh.team.domain.FaqVo;
import com.kh.team.service.FaqService;

@Controller
@RequestMapping("/sjw/contact")
public class FaqController {
	
	@Inject
	private FaqService faqService;
	
	// faq 목록 - 페이징
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public void faqList(FaqPagingDto2 faqPagingDto2, Model model) throws Exception {
		faqPagingDto2.setPageInfo();
		int totalCount = faqService.getCount2(faqPagingDto2);
		faqPagingDto2.setTotalCount(totalCount);
		List<FaqVo> list = faqService.faqList(faqPagingDto2);
		model.addAttribute("list", list);
		model.addAttribute("faqPagingDto2", faqPagingDto2);  
	}
	
	// faq f_cate = f1001 회원 관련 목록
	@RequestMapping(value = "/faq1", method = RequestMethod.GET)
	public void faq1(Model model) throws Exception {
		List<FaqVo> list = faqService.faq1();
		model.addAttribute("list", list);
	}
	// faq f_cate = f1002 경매 관련 목록
	@RequestMapping(value = "/faq2", method = RequestMethod.GET)
	public void faq2(Model model) throws Exception {
		List<FaqVo> list = faqService.faq2();
		model.addAttribute("list", list);
	}
	// faq f_cate = f1003 낙찰 관련 목록
	@RequestMapping(value = "/faq3", method = RequestMethod.GET)
	public void faq3(Model model) throws Exception {
		List<FaqVo> list = faqService.faq3();
		model.addAttribute("list", list);
	}
	// faq f_cate = f1004 위탁 관련 목록
	@RequestMapping(value = "/faq4", method = RequestMethod.GET)
	public void faq4(Model model) throws Exception {
		List<FaqVo> list = faqService.faq4();
		model.addAttribute("list", list);
	}
	// faq f_cate = f1005 기타 관련 목록
	@RequestMapping(value = "/faq5", method = RequestMethod.GET)
	public void faq5(Model model) throws Exception {
		List<FaqVo> list = faqService.faq5();
		model.addAttribute("list", list);
	}

}
