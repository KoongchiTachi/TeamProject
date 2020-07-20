package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.MemberVo;

public interface ConsignService {
	// 위탁 신청폼
	public List<MemberVo> consignForm() throws Exception;
	// 위탁안내
}
