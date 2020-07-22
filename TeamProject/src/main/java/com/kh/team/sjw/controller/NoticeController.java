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
import com.kh.team.util.NoticeUrlUtil;

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
	*/
	
	// 공지사항 수정 폼 - 관리자
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	public void noticeUpdateGet(int nno, NoticePagingDto noticePagingDto, Model model) throws Exception {
		NoticeVo noticeVo = noticeService.noticeRead(nno);
		model.addAttribute("noticeVo", noticeVo);
	}
	
	// 공지사항 수정 처리 - 관리자
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdatePost(NoticeVo noticeVo, NoticePagingDto noticePagingDto) throws Exception {
		noticeService.noticeUpdate(noticeVo);
		String url = NoticeUrlUtil.makePagingUrl("/sjw/about/noticeRead", noticePagingDto, noticeVo.getNno());
		return "redirect:" + url;
	} 
	
	// 공지사항 삭제 - 관리자
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public String deleteNotice(int nno, NoticePagingDto noticePagingDto)throws Exception {
		noticeService.noticeDelete(nno);
		String url = NoticeUrlUtil.makePagingUrl("/sjw/about/noticeList", noticePagingDto);
		return "redirect:" + url;
	}
	
	
	
	///////////////////////////////////////////////////map, info는 따로 controller 만들지 않음
	
	@RequestMapping("/map")
	public void map() throws Exception {
	}
	
	@RequestMapping("/info")
	public void info() throws Exception {
	}
}
