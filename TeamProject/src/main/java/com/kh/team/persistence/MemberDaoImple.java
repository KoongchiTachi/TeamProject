package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.AdminMemberListPagingDto;
import com.kh.team.domain.MemberVo;

@Repository
public class MemberDaoImple implements MemberDao {

	private static final String NAMESPACE = "mappers.member-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 로그인 아이디, 비밀번호 체크
	@Override
	public MemberVo selectMemberByIdAndPw(String m_id, String m_pw) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("m_id", m_id);
		paramMap.put("m_pw", m_pw);
		return sqlSession.selectOne(NAMESPACE + "selectMemberByIdAndPw", paramMap); 
	}
	
	// 관리자 - 전체 멤버 목록
	@Override
	public List<MemberVo> memberList(AdminMemberListPagingDto adminMemberListPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "memberList", adminMemberListPagingDto);
	}

	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
	}

	// 아이디 체크
	@Override
	public MemberVo selectMember(String m_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectMember", m_id);
	}

	// 회원정보 수정
	@Override
	public void updateMember(MemberVo memberVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateMember", memberVo);
	}

	// 회원 탈퇴
	@Override
	public void deleteMember(String m_id, String m_pw) throws Exception {
		Map<String, String> param = new HashMap<>();
		param.put("m_id", m_id);
		param.put("m_pw", m_pw);
		sqlSession.delete(NAMESPACE + "deleteMember", param);
	}

	// 관리자 - 회원 삭제
	@Override
	public void deleteMember(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteMember", m_id);
	}

	// 관리자 - 전체 멤버 수
	@Override
	public int getCount(AdminMemberListPagingDto adminMemberListPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", adminMemberListPagingDto);
	}

	// 관리자 - 경매 진행 중인 회원 삭제 불가
	@Override
	public boolean auctioningMember(String m_id) throws Exception {
		int pro = sqlSession.selectOne(NAMESPACE + "auctioningMemberPro", m_id);
		int proBid = sqlSession.selectOne(NAMESPACE + "auctioningMemberProBid", m_id);
		System.out.println("pro:" + pro);
		System.out.println("proBid:" + proBid);
		if (pro == 0 && proBid == 0) {
			return true;
		} else {
			return false;
		}
	}

	// 회원 거래 횟수 가져오기
	@Override
	public int getTrade(String m_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTrade", m_id);
	}
	
	// 회원 등급 수정
	@Override
	public void modifyGrade(int m_trade, String m_id) throws Exception {
		Map<String, Object> param = new HashMap<>();
		String gradeCode = null;
		if (m_trade == 10) {
			gradeCode = "g1003";
		} else if (m_trade == 5) {
			gradeCode = "g1002";
		}
		param.put("gradeCode", gradeCode);
		param.put("m_id", m_id);
		sqlSession.update(NAMESPACE + "modifyGrade", param);
	}

}
