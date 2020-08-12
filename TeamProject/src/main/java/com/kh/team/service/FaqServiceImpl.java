package com.kh.team.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqPagingDto2;
import com.kh.team.domain.FaqVo;
import com.kh.team.persistence.FaqDao;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Inject
	private FaqDao faqDao;

	// faq 목록 (페이징) - 관리자
	@Override
	public List<FaqVo> faqList(FaqPagingDto faqPagingDto) throws Exception {
		return faqDao.faqList(faqPagingDto);
	}
	// 게시글 수 - 관리자
	@Override
	public int getCount(FaqPagingDto faqPagingDto) throws Exception {
		return faqDao.getCount(faqPagingDto);
	}
	
	// faq 목록 (페이징)
	@Override
	public List<FaqVo> faqList(FaqPagingDto2 faqPagingDto2) throws Exception {
		return faqDao.faqList(faqPagingDto2);
	}
	// 게시글 수
	@Override
	public int getCount2(FaqPagingDto2 faqPagingDto2) throws Exception {
		return faqDao.getCount2(faqPagingDto2);
	}
	
	// faq f_cate = f1001 회원 관련 목록
	@Override
	public List<FaqVo> faq1() throws Exception {
		List<FaqVo> list = faqDao.faq1();
		return list;
	}
	// faq f_cate = f1002 경매 관련 목록
	@Override
	public List<FaqVo> faq2() throws Exception {
		List<FaqVo> list = faqDao.faq2();
		return list;
	}
	// faq f_cate = f1003 낙찰 관련 목록
	@Override
	public List<FaqVo> faq3() throws Exception {
		List<FaqVo> list = faqDao.faq3();
		return list;
	}
	// faq f_cate = f1004 위탁 관련 목록
	@Override
	public List<FaqVo> faq4() throws Exception {
		List<FaqVo> list = faqDao.faq4();
		return list;
	}
	// faq f_cate = f1005 기타 관련 목록
	@Override
	public List<FaqVo> faq5() throws Exception {
		List<FaqVo> list = faqDao.faq5();
		return list;
	}
	
	// faq 조회
	@Override
	public FaqVo faqRead(int fno) throws Exception {
		FaqVo faqVo = faqDao.faqRead(fno);
		return faqVo;
	}

	// faq 입력 - 관리자
	@Override
	public void faqInsert(FaqVo faqVo) throws Exception {
		faqDao.faqInsert(faqVo);
	}

	// faq 수정 - 관리자
	@Override
	public void faqUpdate(FaqVo faqVo) throws Exception {
		faqDao.faqUpdate(faqVo);
	}

	// faq 삭제 - 관리자
	@Override
	public void faqDelete(int fno) throws Exception {
		faqDao.faqDelete(fno);
	}
	
	// faq 삭제 (체크박스) - 관리자
	@Override
	public void faqDeleteChk(FaqVo fnos) throws Exception {
		faqDao.faqDeleteChk(fnos);
	}

}
