package com.kh.team.kmk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/kmk/auction")  
public class KmkController {
	
	@RequestMapping(value = "/premium", method = RequestMethod.GET)
	public String premiumAuction() throws Exception {
		return "kmk/auction/premium";
	}
}
 