package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.team.domain.QnaVo;
import com.kh.team.service.QnaService;

@Controller
@RequestMapping("/sjw/auction")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	
	// QnA 입력 폼
	@RequestMapping(value = "/qnaForm", method = RequestMethod.GET)
	public void qnaRegisterGet() throws Exception {
	}
	
	// QnA 입력 처리
	@RequestMapping(value = "/qnaForm", method = RequestMethod.POST)
	public String qnaRegisterPost(QnaVo qnaVo, RedirectAttributes rttr) throws Exception {
		qnaService.insertQna(qnaVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/sjw/auction/faqList";
	}
	
	/*
	// QnA 목록
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList(Model model) throws Exception {
		List<QnaVo> list = qnaService.qnaList();
		model.addAttribute("list", list);
		return "/sjw/auction/qnaList";
	}
	
	// QnA 내용보기
	@RequestMapping(value = "/qnaRead", method = RequestMethod.GET)
	public void qnaRead(@RequestParam("qno") int qno, Model model) throws Exception {
		QnaVo qnaVo = qnaService.qnaRead(qno);
		model.addAttribute("qnaVo", qnaVo);
	}
	
	// QnA 수정 폼
	@RequestMapping(value = "/updateQna", method = RequestMethod.GET)
	public void updateQna(int qno, Model model) throws Exception {
		QnaVo qnaVo = qnaService.qnaRead(qno);
		model.addAttribute("qnaVo", qnaVo);
	}
	
	// QnA 수정 처리
	@RequestMapping(value = "/updateQna", method = RequestMethod.POST)
	public void updateQna(QnaVo qnaVo) throws Exception {
		qnaService.updateQna(qnaVo);
	}
	
	@RequestMapping(value = "/deleteQna", method = RequestMethod.GET)
	public String deleteQna(int bno) throws Exception {
		qnaService.deleteQna(qno);
	}
	
	*/

}
