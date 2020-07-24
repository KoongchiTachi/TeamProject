package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.BidListPagingDto;
import com.kh.team.domain.BidVo;

@Repository
public class BidDaoImple implements BidDao {

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
	public int getCount(BidListPagingDto bidListPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", bidListPagingDto);
	}

	@Override
	public List<BidVo> successBidList(String m_id) throws Exception {
		System.out.println("m_id:" + m_id);
//		return sqlSession.selectList(NAMESPACE + "successBidList", m_id);
		List<BidVo> list = sqlSession.selectList(NAMESPACE + "successBidList", m_id);
		System.out.println("list:" + list);
		return null;
	}

}
