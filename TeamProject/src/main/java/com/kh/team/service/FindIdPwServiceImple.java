package com.kh.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.MemberVo;
import com.kh.team.persistence.FindIdPwDao;

@Service
public class FindIdPwServiceImple implements FindIdPwService {

	@Inject
	private FindIdPwDao findIdPwDao;
	
	@Override
	public MemberVo findId(String m_name, String m_email) throws Exception {
		return findIdPwDao.findId(m_name, m_email);
	}

	@Override
	public void findPwNew(String m_id, String m_email, String newPw) throws Exception {
		findIdPwDao.findPwNew(m_id, m_email, newPw);
	}

}
