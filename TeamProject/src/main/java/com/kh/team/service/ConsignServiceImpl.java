package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.MemberVo;
import com.kh.team.persistence.ConsignDao;

@Service
public class ConsignServiceImpl implements ConsignService {

	@Inject
	private ConsignDao consignDao;
	
	@Override
	public MemberVo selectMemberByConsign(String m_id) throws Exception {
		return consignDao.selectMemberByConsign(m_id);
	}

}
