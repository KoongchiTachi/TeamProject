package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.ConsignListPagingDto;
import com.kh.team.domain.ConsignListVo;
import com.kh.team.domain.WishlistPagingDto;

public interface ConsignListService {

	// 위탁 추가
	public void insertConsign(ConsignListVo consignListVo) throws Exception;
	
	// 위탁 목록
	public List<ConsignListVo> consignList(String m_id, int startRow, int endRow) throws Exception;
	
	// 위탁 게시글 수
	public int getCount(ConsignListPagingDto consignListPagingDto, String m_id) throws Exception;
	
}
