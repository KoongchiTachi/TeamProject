package com.kh.team.kjy.controller;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.MemberVo;
import com.kh.team.domain.WishlistVo;
import com.kh.team.service.MemberService;
import com.kh.team.service.WishlistService;
import com.kh.team.util.MailHandler;

@Controller
@RequestMapping("/kjy/member")
public class KjyController {

	@Inject
	private MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	
	// 이메일 인증
	@ResponseBody
	@RequestMapping(value = "/emailAuth", method = RequestMethod.GET)
	public String emailAuth(@RequestParam String m_email) throws Exception {
		int ran = new Random().nextInt(900000) + 100000;
		String authCode = String.valueOf(ran);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[회원가입 인증 코드 발급 안내]");
		sendMail.setText(new StringBuffer().append("<h1>이메일인증</h1><br/>")
				.append("Luxtion에 가입해주셔서 감사합니다. 귀하의 인증 코드는 "+ authCode +" 입니다.").toString());
		sendMail.setFrom("whitebritz@gmail.com", "Luxtion");
		sendMail.setTo(m_email);
		sendMail.send();
		return authCode;
	}
	
	// 회원가입폼 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() throws Exception {
		
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/joinRun", method = RequestMethod.POST)
	public String joinRun(MemberVo memberVo) throws Exception {
		System.out.println("memberVo:" + memberVo);
		memberService.insertMember(memberVo);
		return "redirect:/kjy/member/login";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/checkDupId", method = RequestMethod.GET)
	public String checkDupId(String m_id) throws Exception {
		MemberVo memberVo = memberService.selectMember(m_id);
		if (memberVo != null) {
			return "unavailable";
		}
		return "available";
	}
	
	// 회원 탈퇴 폼
	@RequestMapping(value = "/deleteMemberForm", method = RequestMethod.GET)
	public void deleteMemberForm(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		model.addAttribute("m_id", m_id);
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value = "/deleteMemberRun", method = RequestMethod.POST)
	public String deleteMemberRun(HttpSession session, String m_id, String m_pw) throws Exception {
		memberService.deleteMember(m_id, m_pw);
		session.invalidate();
		return "redirect:/";
	}
	
}
