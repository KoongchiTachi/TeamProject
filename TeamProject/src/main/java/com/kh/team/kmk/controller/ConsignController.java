package com.kh.team.kmk.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod; 

import com.kh.team.service.ConsignService;

@Controller
@RequestMapping(value = "/kmk/consign")
public class ConsignController { 
	 
	@Inject 
	private ConsignService consignService; 
	
	// 위탁 신청
	@RequestMapping(value = "/consign_form", method = RequestMethod.GET)
	public String consignForm() throws Exception {
		String test = "testtesttest";
		return "/kmk/consign/consign_form"; 
	}
	
	// 위탁 신청 안내
	
}
