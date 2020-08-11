package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.MemberVo;

public interface ConsignService {
	
	// 위탁 신청폼
	public MemberVo selectMemberByConsign(String m_id) throws Exception;
	// 위탁 안내
}
