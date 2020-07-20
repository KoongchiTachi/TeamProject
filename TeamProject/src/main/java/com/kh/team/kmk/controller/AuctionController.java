package com.kh.team.kmk.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.service.ProductService;

@Controller
@RequestMapping(value = "/kmk/auction")  
public class AuctionController {
	
	@Inject
	private ProductService productService;
	
	// 프리미엄 상품 페이지
	@RequestMapping(value = "/premium", method = RequestMethod.GET)
	public String premiumAuction(Model model) throws Exception {
		int p_value = 700000;
		List<ProductVo> list = productService.premiumProduct(p_value); 
		model.addAttribute("list", list);
		return "/kmk/auction/premium";  
	}
	
	// 일반 상품 페이지
	@RequestMapping(value="/latest", method = RequestMethod.GET) 
	public String latestAuction() throws Exception {
		return "/kmk/auction/latest";
	} 
	 
	// 상품 응찰 페이지
	@RequestMapping(value="/bids", method = RequestMethod.GET)
	public String bidPage() throws Exception {
		return "/kmk/auction/bids";
	}
	
	// 상품 응찰 내역
	@RequestMapping(value="/bidList", method = RequestMethod.GET)
	public List<BidVo> bidList(String pno) throws Exception {
		pno = "22";
		return productService.bidList(pno);
	}
	
	// 경매 종료 상품 페이지
	@RequestMapping(value="/finished", method = RequestMethod.GET) 
	public String finishedAuction(Model model) throws Exception {
		String p_state = "s02";
		List<ProductVo> list = productService.endProduct(p_state);
		model.addAttribute("list", list);
		return "/kmk/auction/finished";
	}
	
	// 응찰 방법 안내
	@RequestMapping(value="/howBid", method = RequestMethod.GET)
	public String howBid() throws Exception {
		return "/kmk/auction/howBid";
	}
	
}
 