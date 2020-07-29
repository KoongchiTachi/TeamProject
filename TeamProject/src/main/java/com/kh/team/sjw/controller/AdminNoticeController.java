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
import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;
import com.kh.team.service.NoticeService;
import com.kh.team.util.SjwUrlUtil;

@Controller
@RequestMapping("/sjw/admin")
public class AdminNoticeController {
	
	@Inject
	private NoticeService noticeService;
	
	// 공지사항 목록 (페이징)
	@RequestMapping(value = "/admin_noticeList", method = RequestMethod.GET)
	public void noticeList(NoticePagingDto noticePagingDto, Model model) throws Exception {
		noticePagingDto.setPageInfo();
		int totalCount = noticeService.getCount(noticePagingDto);
		noticePagingDto.setTotalCount(totalCount);
		List<NoticeVo> list = noticeService.noticeList(noticePagingDto);
		model.addAttribute("list", list);
		model.addAttribute("noticePagingDto", noticePagingDto);  
	}
	
	// 공지사항 내용보기
	@RequestMapping(value = "/admin_noticeRead", method = RequestMethod.GET)
	public void noticeRead(@RequestParam("nno") int nno, NoticePagingDto noticePagingDto, Model model) throws Exception {
		System.out.println("nno:" + nno);
		NoticeVo noticeVo = noticeService.noticeRead(nno);
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("noticePagingDto", noticePagingDto);
	}
	
	// 공지사항 입력 폼 - 관리자
	@RequestMapping(value = "/admin_noticeForm", method = RequestMethod.GET)
	public void noticeRegisterGet() throws Exception {
	} 
	
	// 공지사항 입력 처리 - 관리자
	@RequestMapping(value = "/admin_noticeForm", method = RequestMethod.POST)
	public String noticeRegisterPost(NoticeVo noticeVo, RedirectAttributes rttr) throws Exception {
		noticeService.noticeInsert(noticeVo);
		rttr.addFlashAttribute("msg", "insertSuccess");
		return "redirect:/sjw/admin/admin_noticeList";
	}
	
	// 공지사항 수정 폼 - 관리자
	@RequestMapping(value = "/admin_noticeUpdate", method = RequestMethod.GET)
	public void noticeUpdateGet(int nno, NoticePagingDto noticePagingDto, Model model) throws Exception {
		System.out.println("noticePagingDto: " + noticePagingDto);
		NoticeVo noticeVo = noticeService.noticeRead(nno);
		model.addAttribute("noticeVo", noticeVo);
	}
	
	// 공지사항 수정 처리 - 관리자
	@RequestMapping(value = "/admin_noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdatePost(NoticeVo noticeVo, NoticePagingDto noticePagingDto, RedirectAttributes rttr) throws Exception {
		noticeService.noticeUpdate(noticeVo);
		String url = SjwUrlUtil.makePagingUrlN("/sjw/admin/admin_noticeRead", noticePagingDto, noticeVo.getNno());
		rttr.addFlashAttribute("msg", "updateSuccess");
		return "redirect:" + url;
	} 
	
	// 공지사항 삭제 - 관리자
	@RequestMapping(value = "/admin_noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(int nno, NoticePagingDto noticePagingDto, RedirectAttributes rttr)throws Exception {
		noticeService.noticeDelete(nno);
		String url = SjwUrlUtil.makePagingUrlN("/sjw/admin/admin_noticeList", noticePagingDto);
		rttr.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:" + url;
	}
	
	// 공지사항 삭제 (체크박스) - 관리자
	@ResponseBody
	@RequestMapping(value = "/admin_noticeDeleteChk", method = RequestMethod.POST)
	public String noticeDeleteChk(@RequestParam(value = "chbox[]") List<String> chArr, NoticeVo nnos) throws Exception {
		int nno = 0;
		for (String check : chArr) {
			nno = Integer.parseInt(check);
			nnos.setNno(nno);
			noticeService.noticeDeleteChk(nnos);
		}
		return "success";
	}

}
