package com.kh.team.kjy.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;
import com.kh.team.util.MailHandler;

@Controller
@RequestMapping("/kjy/member")
public class KjyController {

	@Inject
	private MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() throws Exception {

	}
	
	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(String m_id, String m_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("m_id:" + m_id);
		System.out.println("m_pw:" + m_pw);
		boolean result = memberService.login(m_id, m_pw);
		System.out.println("result:" + result);
		if (result == true) {
			session.setAttribute("m_id", m_id);
			// TODO 로그인 안하면 다른 페이지 접근 불가능은 나중에
			return "redirect:/";
		}
		rttr.addFlashAttribute("msg", "fail");
		return "redirect:/kjy/member/login";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/kjy/member/login";
	}
	
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
	
	// 아이디, 패스워드 찾기 폼
	@RequestMapping(value = "/idPwFind", method = RequestMethod.GET)
	public void idPwFind() throws Exception {
		
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(String m_name, String m_email) throws Exception {
		MemberVo memberVo = memberService.findId(m_name, m_email);
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
		sendMail.setText(new StringBuffer().append("<h1>이메일인증</h1><br/>")
				.append("안녕하세요.Luxtion입니다. 회원님의 임시 비밀번호는 " + newPw + " 입니다.<br/>임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.").toString());
		sendMail.setFrom("whitebritz@gmail.com", "Luxtion");
		sendMail.setTo(m_email);
		sendMail.send();
		
		memberService.findPwNew(m_id, m_email, newPw);
		return "success";
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPage() throws Exception {
		
	}
	
	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public void wishList() throws Exception {
		
	}
}
