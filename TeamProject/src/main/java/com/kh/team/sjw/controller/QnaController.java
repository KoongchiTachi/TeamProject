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
	
}
