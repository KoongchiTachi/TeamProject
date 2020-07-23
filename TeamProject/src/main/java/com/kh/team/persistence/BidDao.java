package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.BidVo;

public interface BidDao {

	// 응찰 입력
	public void insertBid(BidVo bidVo) throws Exception;
	
	// 응찰 내역
	public List<BidVo> bidList(String m_id) throws Exception;
	
}
