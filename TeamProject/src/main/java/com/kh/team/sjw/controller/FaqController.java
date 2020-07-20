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
	
	
	
	////////////////////////////////////////////////////////////관리자 페이지에서...
	
	/*

	// faq 내용보기 - 관리자 페이지
	@RequestMapping(value = "/faqRead", method = RequestMethod.GET)
	public void faqRead(@RequestParam("fno") int fno, Model model) throws Exception {
		System.out.println("fno:" + fno);
		FaqVo faqVo = faqService.faqRead(fno);
		model.addAttribute("faqVo", faqVo);
	}
	
	// faq 입력 폼 - 관리자 페이지
	// faqRegister 만들어야 함 ... 아직 관리자 페이지는 X
	@RequestMapping(value = "faqRegisterGet", method = RequestMethod.GET)
	public void faqRegisterGet() throws Exception {
	} 
	
	// faq 입력 처리 - 관리자 페이지
	@RequestMapping(value = "faqRegister", method = RequestMethod.POST)
	public String faqRegisterPost(FaqVo faqVo, RedirectAttributes rttr) throws Exception {
		faqService.insertFaq(faqVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/sjw/auction/faqList";
	}
	
	// faq 수정 폼 - 관리자 페이지
	@RequestMapping(value = "#", method = RequestMethod.GET)
	public void updateFaqGet(int fno, FaqPagingDto FaqPagingDto, Model model) throws Exception {
		FaqVo faqVo = faqService.updateFaq(fno);
		model.addAttribute("faqVo", faqVo);
	}
	
	// faq 수정 처리 - 관리자 페이지
	@RequestMapping(value = "#", method = RequestMethod.POST)
	public String updateFaqPost(FaqVo faqVo, NoticePagingDto noticePagingDto) throws Exception {
		faqService.updateFaq(faqVo);
		String url = QnaUrlUtil.makePagingUrl("/sjw/auction/notice", faqPagingDto, faqVo.getFno());
		return "redirect:" + url;
	} 
	
	// faq 삭제 - 관리자 페이지
	@RequestMapping(value = "#", method = RequestMethod.GET)
	public String deleteFaq(int fno, FaqPagingDto faqPagingDto)throws Exception {
		faqService.deleteFaq(fno);
		String url = QnaUrlUtil.makePagingUrl("/sjw/auction/notice", faqPagingDto);
		return "redirect:" + url;
	}
	*/

}
