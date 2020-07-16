package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.MemberVo;

public interface MemberDao {
	
	// 로그인 확인 
	public MemberVo selectMemberByIdAndPw(String user_id, String user_pw) throws Exception;
	
	// 멤버 목록
	public List<MemberVo> memberList() throws Exception;
	
	// 멤버 등록
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// 멤버 선택
	public MemberVo selectMember(String m_id) throws Exception;
	
	// 아이디 찾기
	public MemberVo findId(String m_name, String m_email) throws Exception;
		
	// 비밀번호 찾기
	public void findPwNew(String m_id, String m_email, String newPw) throws Exception;
	
	// 멤버 수정
	public void updateMember(MemberVo memberVo) throws Exception;
	
	// 멤버 삭제
	public void deleteMember(MemberVo memberVo) throws Exception;
	
}
