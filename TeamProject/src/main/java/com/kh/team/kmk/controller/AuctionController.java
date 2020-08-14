package com.kh.team.kmk.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WishVo;
import com.kh.team.service.ProductService;
import com.kh.team.service.WishlistService;

@Controller
@RequestMapping(value = "/kmk/auction")  
public class AuctionController {
	
	private final int p_value = 1000000;
	 
	@Inject
	private ProductService productService;
	
	@Inject
	private WishlistService wishlistService;
	
	// 프리미엄 상품 목록
	@RequestMapping(value = "/premium", method = RequestMethod.GET)
	public String premiumAuction(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<ProductVo> list = productService.premiumProduct(p_value);
		model.addAttribute("list", list); 
		if (m_id != null) {
			List<WishVo> wish = productService.attentionItems(m_id);
			model.addAttribute("wish", wish);  
		}
		return "/kmk/auction/premium";  
	}
	
	// 일반 상품 목록
	@RequestMapping(value="/normal", method = RequestMethod.GET) 
	public String latestAuction(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		List<ProductVo> list = productService.normalProduct(p_value);
		model.addAttribute("list", list);
		if (m_id != null) {
			List<WishVo> wish = productService.attentionItems(m_id);
			model.addAttribute("wish", wish);  
		}
		return "/kmk/auction/normal";
	}
	 
	// 상품 상세 페이지
	@RequestMapping(value="/product", method = RequestMethod.GET)
	public void bidPage(HttpServletRequest request, /*HttpServletResponse response,*/ String pno, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		ProductVo productVo = productService.selectByPno(pno);
		/*if (productVo.getP_state() == "s02") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 마감된 상품입니다.');</script>");
			out.flush();
			return;
		}*/
		int cnt = productService.bidCountByPno(pno);
		int s_price = productVo.getS_price();
		int unit = 50000;
		if (s_price >= p_value) unit = unit * 2;
		model.addAttribute("cnt", cnt); 
		model.addAttribute("unit", unit);
		model.addAttribute(productVo);
		session.setAttribute("m_id", m_id);
		session.setAttribute("s_price", s_price); 
	}
	
	// 상품 응찰 내역
	@ResponseBody
	@RequestMapping(value="/bidList/{pno}", method = RequestMethod.POST)
	public List<BidVo> bidList(@PathVariable("pno") String pno) throws Exception {
		List<BidVo> bidList = productService.bidList(pno);
		return bidList;
	}
	
	// 경매 종료 상품 페이지
	@RequestMapping(value="/finished", method = RequestMethod.GET) 
	public String finishedAuction(Model model) throws Exception {
		String p_state = "s02"; 
		List<ProductVo> list = productService.endProduct(p_state);
		model.addAttribute("list", list);
		return "/kmk/auction/finished";
	}
	
	// 경매 종료 확인
	@ResponseBody
	@RequestMapping(value="/checkstate/{pno}", method = RequestMethod.POST)
	public String checkstate(@PathVariable("pno") String pno) throws Exception {
		String state = productService.checkstate(pno);
		System.out.println("state : " + state);
		if (state.equals("s02")) {
			return "no";
		} else {
			return "pass";
		}
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
	
	
	// 관심상품 등록 및 해제 
	@ResponseBody
	@RequestMapping(value="/check/{pno}/{m_id}", method = RequestMethod.POST)
	public String attentionProduct(@PathVariable("pno") String pno, @PathVariable("m_id") String m_id) throws Exception {
		WishVo wishVo = new WishVo();
		wishVo = wishlistService.getAttentionCheck(pno, m_id);
		if (wishVo != null) {
			int wno = wishVo.getWno(); 
			wishlistService.deleteWishlist(wno);
			return "not"; 
		}  else {
			wishlistService.insertWishlist(pno, m_id);
			return "ok";
		}
	}
	
	// 최근 등록 상품 ( 메인화면 노출 )
	
}
 