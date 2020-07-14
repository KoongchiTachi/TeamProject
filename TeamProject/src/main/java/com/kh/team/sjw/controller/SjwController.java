package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;
import com.kh.team.service.NoticeService;

@Controller
@RequestMapping("/sjw/auction")
public class SjwController {
	
	@Inject
	private NoticeService noticeService;

	@RequestMapping("/qnaForm")
	public void qna() throws Exception {
		
	}
	
	@RequestMapping("/faqList")
	public void faqList() throws Exception {
		
	}
	
	@RequestMapping("/info")
	public void info() throws Exception {
		
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public void notice(@RequestParam("nno") int nno, Model model) throws Exception {
		System.out.println("nno:" + nno);
		NoticeVo noticeVo = noticeService.notice(nno);
		model.addAttribute("noticeVo", noticeVo);
	}
	
	// 글목록 - 페이징
	@RequestMapping(value = "/noticeList", method=RequestMethod.GET)
	public void noticeList(NoticePagingDto noticePagingDto, Model model) throws Exception {
		noticePagingDto.setPageInfo();
		int totalCount = noticeService.getCount(noticePagingDto);
		noticePagingDto.setTotalCount(totalCount);
		List<NoticeVo> list = noticeService.noticeList(noticePagingDto);
		model.addAttribute("list", list);
		model.addAttribute("noticePagingDto", noticePagingDto);  
	}
	
	@RequestMapping("/map")
	public void map() throws Exception {
		
	}
}
