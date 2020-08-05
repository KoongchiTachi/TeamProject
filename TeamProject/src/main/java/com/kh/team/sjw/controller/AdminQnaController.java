package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.team.domain.QnaPagingDto;
import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;
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
		List<QnaVo> list = qnaService.qnaList(qnaPagingDto); // 첨부파일 목록
		model.addAttribute("list", list);
//		System.out.println("list" + list);
		model.addAttribute("qnaPagingDto", qnaPagingDto);  
	}
	
	// QnA 내용보기 - 관리자
	@RequestMapping(value = "/admin_qnaRead", method = RequestMethod.GET)
	public void qnaRead(@RequestParam("qno") int qno, QnaPagingDto qnaPagingDto, Model model) throws Exception {
		QnaVo qnaVo = qnaService.qnaRead(qno);
		List<QnaVo> list = qnaService.qUploadList(qno);
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		model.addAttribute("qnaVo", qnaVo);
		model.addAttribute("qnaPagingDto", qnaPagingDto);
	}
	
	// QnA 답변 입력 - 관리자
	@RequestMapping(value = "/qReplyInsert", method=RequestMethod.POST)
	public String qReplyInsert(QreplyVo qreplyVo) throws Exception {
//		System.out.println("qreplyVo:" + qreplyVo);
		qnaService.qReplyInsert(qreplyVo);
		return "redirect:/sjw/admin/admin_qnaList";
	}
	
	// QnA 삭제 (체크박스) - 관리자
	@ResponseBody
	@RequestMapping(value = "/admin_qnaDeleteChk", method = RequestMethod.POST)
	public String qnaDeleteChk(@RequestParam(value = "chbox[]") List<String> chArr, QnaVo qnos) throws Exception {
		int qno = 0;
		for (String check : chArr) {
			qno = Integer.parseInt(check);
			qnos.setQno(qno);
			qnaService.qnaDeleteChk(qnos);
		}
		return "success";
	}
	
}
