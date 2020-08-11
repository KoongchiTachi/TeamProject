package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.ConsignListPagingDto;
import com.kh.team.domain.ConsignVo;
import com.kh.team.domain.MemberVo;

@Repository
public class ConsignDaoImpl implements ConsignDao {

	private static final String NAMESPACE = "mappers.consign-mapper.";
	private static final String MEMBER = "mappers.member-mapper.";
	
	 
	@Inject 
	private SqlSession sqlSession;

	// 위탁 신청 폼
	@Override
	public MemberVo selectMemberByConsign(String m_id) throws Exception {
		return sqlSession.selectOne(MEMBER + "selectMemberByConsign", m_id);
	} 
 
	@Override
	public List<ConsignVo> consignList(String m_id, int startRow, int endRow) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("m_id", m_id);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "consignList", param);
	}

	@Override
	public int getCount(ConsignListPagingDto consignListPagingDto, String m_id) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("consignListPagingDto", consignListPagingDto);
		param.put("m_id", m_id);
		return sqlSession.selectOne(NAMESPACE + "getCount", param);
	}

}
