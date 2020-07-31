package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.BidListPagingDto;
import com.kh.team.domain.BidVo;
import com.kh.team.domain.SuccessBidPagingDto;

@Repository
public class BidDaoImpl implements BidDao {

	private static final String NAMESPACE = "mappers.bid-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertBid(BidVo bidVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertBid", bidVo);
	}

	@Override
	public List<BidVo> bidList(String m_id, int startRow, int endRow) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("m_id", m_id);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "bidList", param);
	}

	@Override
	public int getCount(BidListPagingDto bidListPagingDto, String m_id) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("bidListPagingDto", bidListPagingDto);
		param.put("m_id", m_id);
		return sqlSession.selectOne(NAMESPACE + "getCount", param);
	}

	@Override
	public List<BidVo> successBidList(String m_id, int startRow, int endRow) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("m_id", m_id);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "successBidList", param);
	}

	@Override
	public int successBidCount(SuccessBidPagingDto successBidPagingDto, String m_id) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("successBidPagingDto", successBidPagingDto);
		param.put("m_id", m_id);
		return sqlSession.selectOne(NAMESPACE + "successBidCount", param);
	}

}