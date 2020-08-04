package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.ConsignListPagingDto;
import com.kh.team.domain.ConsignListVo;
import com.kh.team.persistence.ConsignListDao;

@Service
public class ConsignListServiceImple implements ConsignListService {

	@Inject
	private ConsignListDao consignListDao;
	
	@Override
	public void insertConsign(ConsignListVo consignListVo) throws Exception {
		consignListDao.insertConsign(consignListVo);
	}

	@Override
	public List<ConsignListVo> consignList(String m_id, int startRow, int endRow) throws Exception {
		return consignListDao.consignList(m_id, startRow, endRow);
	}

	@Override
	public int getCount(ConsignListPagingDto consignListPagingDto, String m_id) throws Exception {
		return consignListDao.getCount(consignListPagingDto, m_id);
	}

}
