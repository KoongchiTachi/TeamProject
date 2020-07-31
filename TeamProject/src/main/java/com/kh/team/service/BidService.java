package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.BidListPagingDto;
import com.kh.team.domain.BidVo;
import com.kh.team.domain.SuccessBidPagingDto;

public interface BidService {

	// 응찰 입력
	public void insertBid(BidVo bidVo, String pno, int b_price) throws Exception;
	
	// 응찰 내역
	public List<BidVo> bidList(String m_id, int startRow, int endRow) throws Exception;
	
	// 게시글 수
	public int getCount(BidListPagingDto bidListPagingDto, String m_id) throws Exception;
	
	// 낙찰 내역
	public List<BidVo> successBidList(String m_id, int startRow, int endRow) throws Exception;
	
	// 낙찰 게시글 수
	public int successBidCount(SuccessBidPagingDto successBidPagingDto, String m_id) throws Exception;
	
}
