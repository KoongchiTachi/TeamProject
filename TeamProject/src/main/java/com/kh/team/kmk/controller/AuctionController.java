package com.kh.team.kmk.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.service.ProductService;

@Controller
@RequestMapping(value = "/kmk/auction")  
public class AuctionController {
	
	@Inject
	private ProductService productService;
	
	// 프리미엄 상품 목록
	@RequestMapping(value = "/premium", method = RequestMethod.GET)
	public String premiumAuction(Model model) throws Exception {
		int p_value = 700000;
		List<ProductVo> list = productService.premiumProduct(p_value);
		model.addAttribute("list", list);
		return "/kmk/auction/premium";  
	}
	
	// 일반 상품 목록
	@RequestMapping(value="/normal", method = RequestMethod.GET) 
	public String latestAuction() throws Exception {
		return "/kmk/auction/normal";
	} 
	 
	// 상품 상세 페이지
	@RequestMapping(value="/product", method = RequestMethod.GET)
	public void bidPage(String pno, Model model) throws Exception {
		ProductVo productVo = productService.selectByPno(pno);
		System.out.println("pno : " + pno);
		model.addAttribute(productVo);
	} 
	
	// 상품 응찰 내역
	@ResponseBody
	@RequestMapping(value="/bidList/{pno}", method = RequestMethod.POST)
	public List<BidVo> bidList(@PathVariable("pno") String pno, Model model) throws Exception {
		System.out.println("pno" + pno);
//		List<BidVo> bidList = productService.bidList(pno);
//		model.addAttribute("bidList", bidList);
//		System.out.println(bidList);
		return productService.bidList(pno);
	}
	
	// 경매 종료 상품 페이지
	@RequestMapping(value="/finished", method = RequestMethod.GET) 
	public String finishedAuction(Model model) throws Exception {
		String p_state = "s01"; 
		List<ProductVo> list = productService.endProduct(p_state);
		model.addAttribute("list", list);
		return "/kmk/auction/finished";
	}
	
	// 응찰 방법 안내
	@RequestMapping(value="/howBid", method = RequestMethod.GET)
	public String howBid() throws Exception {
		return "/kmk/auction/howBid";
	}
	
	// 카운트 테스트
	@RequestMapping(value="/count", method = RequestMethod.GET)
	public String count(Model model, String pno) throws Exception {
		ProductVo productVo = new ProductVo();
		productVo = productService.selectByPno(pno);
		Timestamp date = productVo.getP_until();
		model.addAttribute("productVo", productVo);
		model.addAttribute("date", date);
		return "/kmk/auction/count"; 
	}
	
	// 최근 등록 상품 ( 메인화면 노출 )
	
}
 