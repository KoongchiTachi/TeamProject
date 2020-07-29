package com.kh.team.kjy.controller;

import java.util.Random;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.MemberVo;
import com.kh.team.service.FindIdPwService;
import com.kh.team.util.MailHandler;

@Controller
@RequestMapping("/kjy/member")
public class FindIdPwController {

	@Inject
	private FindIdPwService findIdPwService;
	@Autowired
	private JavaMailSender mailSender;
	
	// 아이디, 패스워드 찾기 폼
	@RequestMapping(value = "/idPwFind", method = RequestMethod.GET)
	public void idPwFind() throws Exception {
		
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(String m_name, String m_email) throws Exception {
		MemberVo memberVo = findIdPwService.findId(m_name, m_email);
		String m_id = memberVo.getM_id();
		return m_id;
	}
	
	
	// 패스워드 찾기
	@ResponseBody
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(String m_id, String m_email) throws Exception {
		int ran = new Random().nextInt(900000) + 100000;
		String newPw = String.valueOf(ran); 
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[임시 비밀번호 안내]");
		sendMail.setText(new StringBuffer().append("<h1>임시 비밀번호</h1><br/>")
				.append("안녕하세요.Luxtion입니다. 회원님의 임시 비밀번호는 " + newPw + " 입니다.<br/>임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.").toString());
		sendMail.setFrom("whitebritz@gmail.com", "Luxtion");
		sendMail.setTo(m_email);
		sendMail.send();
		
		findIdPwService.findPwNew(m_id, m_email, newPw);
		return "success";
	}
	
}
