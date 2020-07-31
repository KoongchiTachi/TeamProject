package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;
import com.kh.team.service.QnaService;
 
@Controller
@RequestMapping("/sjw/member")
public class MyQnaController {
	 
	@Inject
	private QnaService qnaService;
	
	// 1:1문의(qna) 목록 - 회원
	@RequestMapping(value = "/myQna", method = RequestMethod.GET)
	public void myQna(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<QnaVo> list = qnaService.myQna(m_id);
		System.out.println("list" + list);
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());
	}
	
	// 1:1문의(qna) 삭제 - 회원
	@ResponseBody
	@RequestMapping(value = "/qnaDelete", method = RequestMethod.POST)
	public String qnaDelete(int qno)throws Exception {
		System.out.println("qno:" + qno);
		qnaService.qnaDelete(qno);
		return "success";
	}
	
	// 1:1문의 답변
//	@RequestMapping(value = "/qReplyList/{qno}", method=RequestMethod.GET)
//	public List<QreplyVo> qReplyList(@PathVariable("qno") int qno) throws Exception {
//		return qnaService.qReplyList(qno);
//	}
	
	@RequestMapping(value = "/qReplyList", method=RequestMethod.GET)
	public void qReplyList(int qno, Model model) throws Exception {
		List<QreplyVo> list2 = qnaService.qReplyList(qno);
		System.out.println("list2" + list2);
		model.addAttribute("list2", list2);
	}

}
