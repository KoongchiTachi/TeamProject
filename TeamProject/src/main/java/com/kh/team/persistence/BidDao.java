package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.BidListPagingDto;
import com.kh.team.domain.BidVo;
import com.kh.team.domain.SuccessBidPagingDto;

public interface BidDao {

	// 응찰 신청(입력)
	public void insertBid(BidVo bidVo) throws Exception;
	
	// 응찰 신청 목록 - 페이징(마이페이지)
	public List<BidVo> bidList(String m_id, int startRow, int endRow) throws Exception;
	
	// 응찰 신청 횟수 - 페이징(마이페이지) 
	public int getCount(BidListPagingDto bidListPagingDto, String m_id) throws Exception;
	
	// 낙찰 상품 목록(마이페이지)
	public List<BidVo> successBidList(String m_id, int startRow, int endRow) throws Exception;
	
	// 낙찰 상품 갯수(마이페이지)
	public int successBidCount(SuccessBidPagingDto successBidPagingDto, String m_id) throws Exception;
		
}
