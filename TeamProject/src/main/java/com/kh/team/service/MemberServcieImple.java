package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.MemberVo;

import persistence.MemberDao;

@Service
public class MemberServcieImple implements MemberService {

	@Inject
	private MemberDao memberDao;
	
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

	@Override
	public MemberVo selectMember(String m_id) throws Exception {
		return memberDao.selectMember(m_id);
	}

	@Override
	public void updateMember(MemberVo memberVo) throws Exception {
		memberDao.updateMember(memberVo);
	}

	@Override
	public void deleteMember(MemberVo memberVo) throws Exception {
		memberDao.deleteMember(memberVo); 
	}

}
