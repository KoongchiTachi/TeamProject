package com.kh.team.kjy.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.AdminBannerVo;
import com.kh.team.service.BannerService;

@Controller
@RequestMapping("/kjy/admin")
public class AdminBannerController {
	
	@Inject
	private BannerService bannerService;

	// 관리자 - 배너 목록
	@RequestMapping(value = "/adminBannerList", method=RequestMethod.GET)
	public void bannerList(Model model) throws Exception {
		List<AdminBannerVo> list = bannerService.bannerList();
		model.addAttribute("list", list);
	}
	
	// 관리자 - 배너 등록 폼
	@RequestMapping(value = "/adminBannerForm", method=RequestMethod.GET)
	public void bannerForm() throws Exception {
		
	}
	
	// 관리자 - 배너 등록 처리
	@RequestMapping(value = "/insertBanner", method=RequestMethod.GET)
	public String insertBanner(AdminBannerVo adminBannerVo, RedirectAttributes rttr) throws Exception {
		boolean result = bannerService.getBannerName(adminBannerVo);
		if (result == false) {
			rttr.addFlashAttribute("msg", "failure");
			return "redirect:/kjy/admin/adminBannerForm";
		}
		
		int count = bannerService.getBannerCount();
		if (count == 2) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/kjy/admin/adminBannerForm";
		} else {
			bannerService.insertBanner(adminBannerVo);
			return "redirect:/kjy/admin/adminBannerList";
		}
	}
	
	// 관리자 - 배너 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteBanner", method = RequestMethod.GET)
	public String deleteMember(int bnno) throws Exception {
		bannerService.deleteBanner(bnno);
		return "success";
	}
	
}
