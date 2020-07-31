package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.team.domain.QnaPagingDto;
import com.kh.team.domain.QnaVo;
import com.kh.team.service.QnaService;

@Controller
@RequestMapping("/sjw/admin")
public class AdminQnaController {
	
	@Inject
	private QnaService qnaService;

	// QnA 목록 (페이징) - 관리자
	@RequestMapping(value = "/admin_qnaList", method = RequestMethod.GET)
	public void qnaList(QnaPagingDto qnaPagingDto, Model model) throws Exception {
		qnaPagingDto.setPageInfo();
		int totalCount = qnaService.getCount(qnaPagingDto);
		qnaPagingDto.setTotalCount(totalCount);
		List<QnaVo> list = qnaService.qnaList(qnaPagingDto);
		model.addAttribute("list", list);
		System.out.println("list" + list);
		model.addAttribute("qnaPagingDto", qnaPagingDto);  
	}
	
	// QnA 내용보기 - 관리자
	@RequestMapping(value = "/admin_qnaRead", method = RequestMethod.GET)
	public void qnaRead(@RequestParam("qno") int qno, QnaPagingDto qnaPagingDto, Model model) throws Exception {
		QnaVo qnaVo = qnaService.qnaRead(qno);
		model.addAttribute("qnaVo", qnaVo);
		model.addAttribute("qnaPagingDto", qnaPagingDto);
	}
	
	// QnA 답변 입력 - 관리자
	@RequestMapping(value = "/replyInsert", method=RequestMethod.POST)
	public String replyInsert(QnaVo qnaVo) throws Exception {
//		System.out.println("qnaVo:" + qnaVo);
		qnaService.replyInsert(qnaVo);
		return "redirect:/sjw/admin/admin_qnaList";
	}
}
