package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.ConsignListPagingDto;
import com.kh.team.domain.ConsignVo;
import com.kh.team.persistence.ConsignDao;

@Service
public class ConsignListServiceImple implements ConsignListService {

	@Inject
	private ConsignDao consignDao;
	
	@Override
	public List<ConsignVo> consignList(String m_id, int startRow, int endRow) throws Exception {
		return consignDao.consignList(m_id, startRow, endRow);
	}

	@Override
	public int getCount(ConsignListPagingDto consignListPagingDto, String m_id) throws Exception {
		return consignDao.getCount(consignListPagingDto, m_id);
	}

}
