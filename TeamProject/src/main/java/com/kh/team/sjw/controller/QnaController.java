package com.kh.team.sjw.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.team.domain.QnaVo;
import com.kh.team.service.QnaService;

@Controller
@RequestMapping("/sjw/contact")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	
	// QnA 입력 폼
	@RequestMapping(value = "/qnaForm", method = RequestMethod.GET)
	public void qnaRegisterGet(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		model.addAttribute("m_id", m_id);
	}
	
	// QnA 입력 처리
	@RequestMapping(value = "/qnaForm", method = RequestMethod.POST)
	public String qnaRegisterPost(QnaVo qnaVo, RedirectAttributes rttr) throws Exception {
		System.out.println("qnaVo" + qnaVo);
		qnaService.qnaInsert(qnaVo);
		rttr.addFlashAttribute("msg", "insertSuccess");
		return "redirect:/sjw/member/myQna";
	}
	
	/*
	
	// QnA 목록 (페이징) - 관리자
	@RequestMapping(value = "/admin_qnaList", method = RequestMethod.GET)
	public void qnaList(QnaPagingDto qnaPagingDto, Model model) throws Exception {
		qnaPagingDto.setPageInfo();
		int totalCount = qnaService.getCount(qnaPagingDto);
		qnaPagingDto.setTotalCount(totalCount);
		List<QnaVo> list = qnaService.qnaList(qnaPagingDto);
		model.addAttribute("list", list);
		model.addAttribute("qnaPagingDto", qnaPagingDto);  
	}
	
	// QnA 내용보기
	@RequestMapping(value = "/qnaRead", method = RequestMethod.GET)
	public void qnaRead(@RequestParam("qno") int qno, Model model) throws Exception {
		QnaVo qnaVo = qnaService.qnaRead(qno);
		model.addAttribute("qnaVo", qnaVo);
	}
	
	// QnA 수정 폼
	@RequestMapping(value = "/admin_qnaUpdate", method = RequestMethod.GET)
	public void qnaUpdateGet(int qno, Model model) throws Exception {
		QnaVo qnaVo = qnaService.qnaRead(qno);
		model.addAttribute("qnaVo", qnaVo);
	}
	
	// QnA 수정 처리
	@RequestMapping(value = "/admin_qnaUpdate", method = RequestMethod.POST)
	public void qnaUpdatePost(QnaVo qnaVo) throws Exception {
		qnaService.updateQna(qnaVo);
	}
	
	@RequestMapping(value = "/deleteQna", method = RequestMethod.GET)
	public String qnaDelete(int bno) throws Exception {
		qnaService.deleteQna(qno);
	}
	
	*/

}
