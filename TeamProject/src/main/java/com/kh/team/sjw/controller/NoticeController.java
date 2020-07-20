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
	
	
	////////////////////////////////////////////////////////////관리자 페이지에서...
	
	/*
	// 공지사항 입력 폼 - 관리자 페이지
	// noticeRegister 만들어야 함 ... 아직 관리자 페이지는 X
	@RequestMapping(value = "noticeRegisterGet", method = RequestMethod.GET)
	public void noticeRegisterGet() throws Exception {
	} 
	
	// 공지사항 입력 처리 - 관리자 페이지
	@RequestMapping(value = "noticeRegister", method = RequestMethod.POST)
	public String noticeRegisterPost(NoticeVo noticeVo, RedirectAttributes rttr) throws Exception {
		noticeService.insertNotice(noticeVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/sjw/auction/noticeList";
	}
	
	// 공지사항 수정 폼 - 관리자 페이지
	@RequestMapping(value = "#", method = RequestMethod.GET)
	public void updateNoticeGet(int nno, NoticePagingDto noticePagingDto, Model model) throws Exception {
		NoticeVo noticeVo = noticeService.notice(nno);
		model.addAttribute("noticeVo", noticeVo);
	}
	
	// 공지사항 수정 처리 - 관리자 페이지
	@RequestMapping(value = "#", method = RequestMethod.POST)
	public String updateNoticePost(NoticeVo noticeVo, NoticePagingDto noticePagingDto) throws Exception {
		noticeService.updateNotice(noticeVo);
		String url = QnaUrlUtil.makePagingUrl("/sjw/auction/notice", noticePagingDto, noticeVo.getNno());
		return "redirect:" + url;
	} 
	
	// 공지사항 삭제 - 관리자 페이지
	@RequestMapping(value = "#", method = RequestMethod.GET)
	public String deleteNotice(int nno, NoticePagingDto noticePagingDto)throws Exception {
		noticeService.deleteNotice(nno);
		String url = QnaUrlUtil.makePagingUrl("/sjw/auction/notice", noticePagingDto);
		return "redirect:" + url;
	}
	*/
	
	
	
	///////////////////////////////////////////////////map, info는 따로 controller 만들지 않음
	
	@RequestMapping("/map")
	public void map() throws Exception {
	}
	
	@RequestMapping("/info")
	public void info() throws Exception {
	}
}
