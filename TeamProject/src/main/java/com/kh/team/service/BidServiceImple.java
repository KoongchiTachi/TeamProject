package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.BidVo;
import com.kh.team.persistence.BidDao;

@Service
public class BidServiceImple implements BidService {

	@Inject
	private BidDao bidDao;
	
	@Override
	public void insertBid(BidVo bidVo) throws Exception {
		bidDao.insertBid(bidVo);
	}

	@Override
	public List<BidVo> bidList(String m_id) throws Exception {
		return bidDao.bidList(m_id);
	}

}
