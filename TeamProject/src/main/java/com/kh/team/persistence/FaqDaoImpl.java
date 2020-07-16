package com.kh.team.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqVo;

@Repository
public class FaqDaoImpl implements FaqDao {
	
	private static final String NAMESPACE = "mappers.faq-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	// faq 목록
	@Override
	public List<FaqVo> faqList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "faqList");
	}
	
	// faq 목록 - 페이징
	@Override
	public List<FaqVo> faqList(FaqPagingDto faqPagingDto) throws Exception {
		List<FaqVo> list = sqlSession.selectList(NAMESPACE + "faqList");
		return list;
	}

	// 게시글 수
	@Override
	public int getCount(FaqPagingDto faqPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", faqPagingDto);
	}

	// faq 내용보기
	@Override
	public FaqVo faqRead(int fno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "faqRead", fno);
	}

	// faq 입력
	@Override
	public void insertFaq(FaqVo faqVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertFaq", faqVo);
	}

	// faq 수정
	@Override
	public void updateFaq(FaqVo faqVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateFaq", faqVo);
	}

	// faq 삭제
	@Override
	public void deleteFaq(int fno) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteFaq", fno);
	}

}
