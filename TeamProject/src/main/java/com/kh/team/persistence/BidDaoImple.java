package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<BidVo> bidList(String m_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "bidList", m_id);
	}

}
