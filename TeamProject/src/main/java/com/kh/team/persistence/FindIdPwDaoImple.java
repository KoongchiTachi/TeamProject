package com.kh.team.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.MemberVo;

@Repository
public class FindIdPwDaoImple implements FindIdPwDao {

	private static final String NAMESPACE = "mappers.findIdPw-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVo findId(String m_name, String m_email) throws Exception {
		Map<String, String> param = new HashMap<>();
		param.put("m_name", m_name);
		param.put("m_email", m_email);
		return sqlSession.selectOne(NAMESPACE + "findId", param);
	}

	@Override
	public void findPwNew(String m_id, String m_email, String newPw) throws Exception {
		Map<String, String> param = new HashMap<>();
		param.put("m_id", m_id);
		param.put("m_email", m_email);
		param.put("newPw", newPw);
		sqlSession.selectOne(NAMESPACE + "findPwNew", param);
	}

}
