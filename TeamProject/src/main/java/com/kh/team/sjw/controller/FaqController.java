package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqVo;
import com.kh.team.service.FaqService;

@Controller
@RequestMapping("/sjw/contact")
public class FaqController {
	
	@Inject
	private FaqService faqService;
	
	// faq 목록 - 페이징
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public void faqList(FaqPagingDto faqPagingDto, Model model) throws Exception {
		faqPagingDto.setPageInfo();
		int totalCount = faqService.getCount(faqPagingDto);
		faqPagingDto.setTotalCount(totalCount);
		List<FaqVo> list = faqService.faqList(faqPagingDto);
		model.addAttribute("list", list);
		model.addAttribute("faqPagingDto", faqPagingDto);  
	}
	
	// faq f_cate = f1001 회원 관련 목록
	@RequestMapping(value = "/faq1", method = RequestMethod.GET)
	public String faq1(Model model) throws Exception {
		List<FaqVo> list = faqService.faq1();
		model.addAttribute("list", list);
		return "sjw/contact/faq1";
	}
	// faq f_cate = f1002 경매 관련 목록
	@RequestMapping(value = "/faq2", method = RequestMethod.GET)
	public String faq2(Model model) throws Exception {
		List<FaqVo> list = faqService.faq2();
		model.addAttribute("list", list);
		return "sjw/contact/faq2";
	}
	// faq f_cate = f1003 낙찰 관련 목록
	@RequestMapping(value = "/faq3", method = RequestMethod.GET)
	public String faq3(Model model) throws Exception {
		List<FaqVo> list = faqService.faq3();
		model.addAttribute("list", list);
		return "sjw/contact/faq3";
	}
	// faq f_cate = f1004 위탁 관련 목록
	@RequestMapping(value = "/faq4", method = RequestMethod.GET)
	public String faq4(Model model) throws Exception {
		List<FaqVo> list = faqService.faq4();
		model.addAttribute("list", list);
		return "sjw/contact/faq4";
	}
	// faq f_cate = f1005 기타 관련 목록
	@RequestMapping(value = "/faq5", method = RequestMethod.GET)
	public String faq5(Model model) throws Exception {
		List<FaqVo> list = faqService.faq5();
		model.addAttribute("list", list);
		return "sjw/contact/faq5";
	}

}
