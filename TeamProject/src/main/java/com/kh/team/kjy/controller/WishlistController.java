package com.kh.team.kjy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.WishlistPagingDto;
import com.kh.team.domain.WishlistVo;
import com.kh.team.service.WishlistService;

@Controller
@RequestMapping("/kjy/member")
public class WishlistController {

	@Inject
	private WishlistService wishlistSertvice;
	
	// 위시리스트 추가
	
	// 위시리스트 목록(페이징)
	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public void wishList(HttpServletRequest request, WishlistPagingDto wishlistPagingDto, Model model) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		wishlistPagingDto.setPageInfo();
		int totalCount = wishlistSertvice.getCount(wishlistPagingDto, m_id);
		wishlistPagingDto.setTotalCount(totalCount);
		int startRow = wishlistPagingDto.getStartRow();
		int endRow = wishlistPagingDto.getEndRow();
		List<WishlistVo> list = wishlistSertvice.wishList(m_id, startRow, endRow);
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());
		model.addAttribute("wishlistPagingDto", wishlistPagingDto);
	}
	
	// 위시리스트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteWishlist", method = RequestMethod.POST)
	public String deleteWishlist(int wno) throws Exception {
		System.out.println("wno:" + wno);
		wishlistSertvice.deleteWishlist(wno);
		return "success";
	}
	
	// 다중선택된 위시리스트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteWishMulti", method = RequestMethod.POST)
	public String deleteWishMulti(@RequestParam(value = "chbox[]") List<String> chArr, WishlistVo wnos) throws Exception {
		int wno = 0;
		
		for (String check : chArr) {
			wno = Integer.parseInt(check);
			wnos.setWno(wno);
			wishlistSertvice.deleteWishMulti(wnos);
		}
		return "success";
	}
	
}
