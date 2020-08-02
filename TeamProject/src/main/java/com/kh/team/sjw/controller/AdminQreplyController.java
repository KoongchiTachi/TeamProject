package com.kh.team.sjw.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kh.team.domain.QreplyVo;
import com.kh.team.service.QnaService;

@RestController
@RequestMapping("/qreply")
public class AdminQreplyController {

	@Inject
	private QnaService qnaService;
	
	// QnA 1:1문의 답변 목록 - 관리자
	@RequestMapping(value = "/qReplyList", method = RequestMethod.POST)
	public List<QreplyVo> qReplyList(@RequestParam("qno") int qno) throws Exception {
		return qnaService.qReplyList(qno);
	}
	
	// QnA 1:1문의 답변 수정 - 관리자
	@RequestMapping(value = "/qReplyUpdate", method=RequestMethod.PUT)
	public String qReplyUpdate(@RequestBody QreplyVo qreplyVo) throws Exception {
		qnaService.qReplyUpdate(qreplyVo);
		return "success";
	}
}
