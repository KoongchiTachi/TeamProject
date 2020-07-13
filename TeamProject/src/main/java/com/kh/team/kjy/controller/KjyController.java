package com.kh.team.kjy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/kjy/member")
public class KjyController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginForm() throws Exception {

	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() throws Exception {
		
	}
	
	@RequestMapping(value = "/joinRun", method = RequestMethod.POST)
	public String joinRun() throws Exception {
		return "redirect:/kjy/member/login";
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPage() throws Exception {
		
	}
	
	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public void wishList() throws Exception {
		
	}
}
