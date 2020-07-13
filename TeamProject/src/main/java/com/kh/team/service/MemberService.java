package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.MemberVo;

public interface MemberService {

	// 로그인
	public boolean login(String m_id, String m_pw) throws Exception;
	
	// 멤버 목록
	public List<MemberVo> memberList() throws Exception;
	
	// 멤버 등록
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// 멤버 선택
	public MemberVo selectMember(String m_id) throws Exception;
	
	// 멤버 수정
	public void updateMember(MemberVo memberVo) throws Exception;
	
	// 멤버 삭제
	public void deleteMember(MemberVo memberVo) throws Exception;
	
}
