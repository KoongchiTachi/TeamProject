package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.AdminMemberListPagingDto;
import com.kh.team.domain.MemberVo;
import com.kh.team.persistence.BidDao;
import com.kh.team.persistence.MemberDao;

@Service
public class MemberServcieImple implements MemberService {

	@Inject
	private MemberDao memberDao;
	@Inject
	private BidDao bidDao;
	
	// 로그인 아이디, 비밀번호 체크
	@Override
	public boolean login(String m_id, String m_pw) throws Exception {
		MemberVo memberVo = memberDao.selectMemberByIdAndPw(m_id, m_pw);
		if (memberVo != null) {
			return true;
		}
		return false;
	}

	// 관리자 - 전체 멤버 목록
	@Override
	public List<MemberVo> memberList(AdminMemberListPagingDto adminMemberListPagingDto) throws Exception {
		return memberDao.memberList(adminMemberListPagingDto);
	}

	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		memberDao.insertMember(memberVo);
	}

	// 회원 정보
	@Transactional
	@Override
	public MemberVo selectMember(String m_id) throws Exception {
		int proCount = bidDao.successBidProGrade(m_id);
		bidDao.successBidUpdateGrade(proCount, m_id);
		return memberDao.selectMember(m_id);
	}

	// 회원정보 수정
	@Override
	public void updateMember(MemberVo memberVo) throws Exception {
		memberDao.updateMember(memberVo);
	}

	// 회원 탈퇴
	@Override
	public void deleteMember(String m_id, String m_pw) throws Exception {
		memberDao.deleteMember(m_id, m_pw); 
	}

	// 관리자 - 회원 삭제
	@Override
	public void deleteMember(String m_id) throws Exception {
		memberDao.deleteMember(m_id);
	}

	// 관리자 - 회원 전체 수
	@Override
	public int getCount(AdminMemberListPagingDto adminMemberListPagingDto) throws Exception {
		return memberDao.getCount(adminMemberListPagingDto);
	}

	// 관리자 - 경매 진행 중인 회원 삭제 불가
	@Override
	public boolean auctioningMember(String m_id) throws Exception {
		return memberDao.auctioningMember(m_id);
	}

	// 회원 거래 횟수 가져오기
	@Override
	public int getTrade(String m_id) throws Exception {
		return memberDao.getTrade(m_id);
	}
	
	// 회원 등급 수정
	@Override
	public void modifyGrade(int m_trade, String m_id) throws Exception {
		memberDao.modifyGrade(m_trade, m_id);
	}


}
