package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqPagingDto2;
import com.kh.team.domain.FaqVo;

@Repository
public class FaqDaoImpl implements FaqDao {
	
	private static final String NAMESPACE = "mappers.faq-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	// faq 목록 (페이징) - 관리자
	@Override
	public List<FaqVo> faqList(FaqPagingDto faqPagingDto) throws Exception {
		List<FaqVo> list = sqlSession.selectList(NAMESPACE + "faqList", faqPagingDto);
		return list;
	}
	// 게시글 수 - 관리자
	@Override
	public int getCount(FaqPagingDto faqPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", faqPagingDto);
	}
	
	// faq 목록 (페이징)
	@Override
	public List<FaqVo> faqList(FaqPagingDto2 faqPagingDto2) throws Exception {
		List<FaqVo> list = sqlSession.selectList(NAMESPACE + "faqList", faqPagingDto2);
		return list;
	}
	// 게시글 수
	@Override
	public int getCount2(FaqPagingDto2 faqPagingDto2) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount2", faqPagingDto2);
	}
	
	// faq f_cate = f1001 회원 관련 목록
	@Override
	public List<FaqVo> faq1() throws Exception {
		return sqlSession.selectList(NAMESPACE + "faq1");
	}
	// faq f_cate = f1002 경매 관련 목록
	@Override
	public List<FaqVo> faq2() throws Exception {
		return sqlSession.selectList(NAMESPACE + "faq2");
	}
	// faq f_cate = f1003 낙찰 관련 목록
	@Override
	public List<FaqVo> faq3() throws Exception {
		return sqlSession.selectList(NAMESPACE + "faq3");
	}
	// faq f_cate = f1004 위탁 관련 목록
	@Override
	public List<FaqVo> faq4() throws Exception {
		return sqlSession.selectList(NAMESPACE + "faq4");
	}
	// faq f_cate = f1005 기타 관련 목록
	@Override
	public List<FaqVo> faq5() throws Exception {
		return sqlSession.selectList(NAMESPACE + "faq5");
	}

	// faq 조회
	@Override
	public FaqVo faqRead(int fno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "faqRead", fno);
	}

	// faq 입력 - 관리자
	@Override
	public void faqInsert(FaqVo faqVo) throws Exception {
		sqlSession.insert(NAMESPACE + "faqInsert", faqVo);
	}

	// faq 수정 - 관리자
	@Override
	public void faqUpdate(FaqVo faqVo) throws Exception {
		sqlSession.update(NAMESPACE + "faqUpdate", faqVo);
	}

	// faq 삭제 - 관리자
	@Override
	public void faqDelete(int fno) throws Exception {
		sqlSession.delete(NAMESPACE + "faqDelete", fno);
	}
	
	// faq 삭제 (체크박스) - 관리자
	@Override
	public void faqDeleteChk(FaqVo fnos) throws Exception {
		sqlSession.delete(NAMESPACE + "faqDeleteChk", fnos);
	}

}
