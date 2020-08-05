package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.WishVo;
import com.kh.team.domain.WishlistPagingDto;
import com.kh.team.domain.WishlistVo;

public interface WishlistDao {

	// 위시리스트 추가
	public void insertWishlist(String pno, String m_id) throws Exception;
	
	// 위시리스트 목록 가져오기
	public List<WishlistVo> wishList(String m_id, int startRow, int endRow) throws Exception;
	
	// 위시리스트 삭제
	public void deleteWishlist(int wno) throws Exception;
	
	// 관심상품등록 여부
	public WishVo getAttentionCheck(String pno, String m_id) throws Exception;

	// 다중선택된 위시리스트 삭제
	public void deleteWishMulti(WishlistVo wnos) throws Exception;
	
	// 게시글 수
	public int getCount(WishlistPagingDto wishlistPagingDto, String m_id) throws Exception;
	
}
