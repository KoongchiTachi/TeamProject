package com.kh.team.service;

import com.kh.team.domain.MemberVo;

public interface FindIdPwService {

	// 아이디 찾기
	public MemberVo findId(String m_name, String m_email) throws Exception;
	
	// 비밀번호 찾기
	public void findPwNew(String m_id, String m_email, String newPw) throws Exception;
	
}
