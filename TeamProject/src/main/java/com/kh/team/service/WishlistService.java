package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.WishlistPagingDto;
import com.kh.team.domain.WishlistVo;

public interface WishlistService {

	// 위시리스트 추가
	public void insertWishlist(WishlistVo wishlistVo) throws Exception;
	
	// 위시리스트 목록 가져오기
	public List<WishlistVo> wishList(String m_id, int startRow, int endRow) throws Exception;
	
	// 위시리스트 삭제
	public void deleteWishlist(int wno) throws Exception;
	
	// 다중선택된 위시리스트 삭제
	public void deleteWishMulti(WishlistVo wnos) throws Exception;
	
	// 위시리스트 페이징
	public List<WishlistVo> listPage(WishlistPagingDto wishlistPagingDto) throws Exception;
	
	// 게시글 수
	public int getCount(WishlistPagingDto wishlistPagingDto) throws Exception;
}
