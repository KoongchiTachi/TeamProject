package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqVo;
import com.kh.team.service.FaqService;
import com.kh.team.util.SjwUrlUtil;

@Controller
@RequestMapping("/sjw/admin")
public class AdminFaqController {
	
	@Inject
	private FaqService faqService;
	
	// faq 목록 (페이징)
	@RequestMapping(value = "/admin_faqList", method = RequestMethod.GET)
	public void faqList(FaqPagingDto faqPagingDto, Model model) throws Exception {
		faqPagingDto.setPageInfo();
		int totalCount = faqService.getCount(faqPagingDto);
		faqPagingDto.setTotalCount(totalCount);
		List<FaqVo> list = faqService.faqList(faqPagingDto);
		model.addAttribute("list", list);
		model.addAttribute("faqPagingDto", faqPagingDto);  
	}
	
	// faq 내용보기
	@RequestMapping(value = "/admin_faqRead", method = RequestMethod.GET)
	public void faqRead(@RequestParam("fno") int fno, FaqPagingDto faqPagingDto, Model model) throws Exception {
		FaqVo faqVo = faqService.faqRead(fno);
		model.addAttribute("faqVo", faqVo);
		model.addAttribute("faqPagingDto", faqPagingDto);
	}
	
	// faq 입력 폼 - 관리자
	@RequestMapping(value = "/admin_faqForm", method = RequestMethod.GET)
	public void faqRegisterGet() throws Exception {
	} 
	
	// faq 입력 처리 - 관리자
	@RequestMapping(value = "/admin_faqForm", method = RequestMethod.POST)
	public String faqRegisterPost(FaqVo faqVo, RedirectAttributes rttr) throws Exception {
		faqService.faqInsert(faqVo);
		rttr.addFlashAttribute("msg", "insertSuccess");
		return "redirect:/sjw/admin/admin_faqList";
	}
	
	// faq 수정 폼 - 관리자
	@RequestMapping(value = "/admin_faqUpdate", method = RequestMethod.GET)
	public void faqUpdateGet(int fno, FaqPagingDto faqPagingDto, Model model) throws Exception {
		FaqVo faqVo = faqService.faqRead(fno);
		model.addAttribute("faqVo", faqVo);
	}
	
	// faq 수정 처리 - 관리자
	@RequestMapping(value = "/admin_faqUpdate", method = RequestMethod.POST)
	public String faqUpdatePost(FaqVo faqVo, FaqPagingDto faqPagingDto, RedirectAttributes rttr) throws Exception {
		faqService.faqUpdate(faqVo);
		String url = SjwUrlUtil.makePagingUrlF("/sjw/admin/admin_faqRead", faqPagingDto, faqVo.getFno());
		rttr.addFlashAttribute("msg", "updateSuccess");
		return "redirect:" + url;
	}
	
	// faq 삭제 - 관리자
	@RequestMapping(value = "/admin_faqDelete", method = RequestMethod.GET)
	public String faqDelete(int fno, FaqPagingDto faqPagingDto, RedirectAttributes rttr) throws Exception {
		faqService.faqDelete(fno);
		String url = SjwUrlUtil.makePagingUrlF("/sjw/admin/admin_faqList", faqPagingDto);
		rttr.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:" + url;
	}
	
	// faq 삭제 (체크박스) - 관리자
	@ResponseBody
	@RequestMapping(value = "/admin_faqDeleteChk", method = RequestMethod.POST)
	public String faqDeleteChk(@RequestParam(value = "chbox[]") List<String> chArr, FaqVo fnos) throws Exception {
		int fno = 0;
		for (String check : chArr) {
			fno = Integer.parseInt(check);
			fnos.setFno(fno);
			faqService.faqDeleteChk(fnos);
		}
		return "success";
	}
	
}
