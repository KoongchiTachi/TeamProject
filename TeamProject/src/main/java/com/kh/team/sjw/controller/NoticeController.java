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
@RequestMapping("/sjw/about")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
	
	// 공지사항 목록 - 페이징
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public void noticeList(NoticePagingDto noticePagingDto, Model model) throws Exception {
		noticePagingDto.setPageInfo();
		int totalCount = noticeService.getCount(noticePagingDto);
		noticePagingDto.setTotalCount(totalCount);
		List<NoticeVo> list = noticeService.noticeList(noticePagingDto);
		model.addAttribute("list", list);
		model.addAttribute("noticePagingDto", noticePagingDto);  
	}
	
	// 공지사항 내용보기
	@RequestMapping(value = "/noticeRead", method = RequestMethod.GET)
	public void noticeRead(@RequestParam("nno") int nno, Model model) throws Exception {
		System.out.println("nno:" + nno);
		NoticeVo noticeVo = noticeService.noticeRead(nno);
		model.addAttribute("noticeVo", noticeVo);
	}
	
	
	///////////////////////////////////////////////////map, info는 따로 controller X
	
	@RequestMapping("/map")
	public void map() throws Exception {
	}
	
	@RequestMapping("/info")
	public void info() throws Exception {
	}
	
}
