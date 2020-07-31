package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.BidListPagingDto;
import com.kh.team.domain.BidVo;
import com.kh.team.domain.SuccessBidPagingDto;
import com.kh.team.persistence.BidDao;
import com.kh.team.persistence.ProductDao;

@Service
public class BidServiceImpl implements BidService {

	@Inject
	private BidDao bidDao;
	
	@Inject
	private ProductDao productDao;
	
	@Override
	public void insertBid(BidVo bidVo, String pno, int b_price) throws Exception {
		bidDao.insertBid(bidVo);
		productDao.updateP_price(b_price, pno); 
	}

	@Override
	public List<BidVo> bidList(String m_id, int startRow, int endRow) throws Exception {
		return bidDao.bidList(m_id, startRow, endRow);
	}

	@Override
	public int getCount(BidListPagingDto bidListPagingDto, String m_id) throws Exception {
		return bidDao.getCount(bidListPagingDto, m_id);
	}

	@Override
	public List<BidVo> successBidList(String m_id, int startRow, int endRow) throws Exception {
		return bidDao.successBidList(m_id, startRow, endRow);
	}

	@Override
	public int successBidCount(SuccessBidPagingDto successBidPagingDto, String m_id) throws Exception {
		return bidDao.successBidCount(successBidPagingDto, m_id);
	}

}
