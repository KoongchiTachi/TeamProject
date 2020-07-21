package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.MemberVo;
import com.kh.team.persistence.MemberDao;

@Service
public class MemberServcieImple implements MemberService {

	@Inject
	private MemberDao memberDao;
	
	// 로그인 아이디, 비밀번호 체크
	@Override
	public boolean login(String m_id, String m_pw) throws Exception {
		MemberVo memberVo = memberDao.selectMemberByIdAndPw(m_id, m_pw);
		if (memberVo != null) {
			return true;
		}
		return false;
	}

	@Override
	public List<MemberVo> memberList() throws Exception {
		return memberDao.memberList();
	}

	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		memberDao.insertMember(memberVo);
	}

	// 아이디 체크
	@Override
	public MemberVo selectMember(String m_id) throws Exception {
		return memberDao.selectMember(m_id);
	}

	// 회원정보 수정
	@Override
	public void updateMember(MemberVo memberVo) throws Exception {
		memberDao.updateMember(memberVo);
	}

	@Override
	public void deleteMember(String m_id, String m_pw) throws Exception {
		memberDao.deleteMember(m_id, m_pw); 
	}

}
