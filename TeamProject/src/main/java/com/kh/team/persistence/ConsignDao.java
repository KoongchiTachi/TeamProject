package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.ConsignListPagingDto;
import com.kh.team.domain.ConsignVo;
import com.kh.team.domain.MemberVo;

public interface ConsignDao {

	// 위탁 신청 폼
	public MemberVo selectMemberByConsign(String m_id) throws Exception;
	
	// 위탁 목록
	public List<ConsignVo> consignList(String m_id, int startRow, int endRow) throws Exception;
	
	// 위탁 게시글 수
	public int getCount(ConsignListPagingDto consignListPagingDto, String m_id) throws Exception;
	
}
