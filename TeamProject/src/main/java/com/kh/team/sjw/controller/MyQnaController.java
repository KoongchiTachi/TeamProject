package com.kh.team.sjw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sjw/member")
public class MyQnaController {
	
	@RequestMapping(value = "/myQna", method = RequestMethod.GET)
	public void myQnaList() throws Exception{
		
	}

}
