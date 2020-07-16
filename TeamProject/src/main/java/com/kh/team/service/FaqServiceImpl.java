package com.kh.team.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqVo;
import com.kh.team.persistence.FaqDao;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Inject
	private FaqDao faqDao;
	
	// faq 목록
	@Override
	public List<FaqVo> faqList() throws Exception {
		List<FaqVo> list = faqDao.faqList();
		return list;
	}

	// faq 목록 - 페이징
	@Override
	public List<FaqVo> faqList(FaqPagingDto faqPagingDto) throws Exception {
		return faqDao.faqList(faqPagingDto);
	}

	// 게시글 수
	@Override
	public int getCount(FaqPagingDto faqPagingDto) throws Exception {
		return faqDao.getCount(faqPagingDto);
	}
	
	// faq 내용보기
	@Override
	public FaqVo faqRead(int fno) throws Exception {
		FaqVo faqVo = faqDao.faqRead(fno);
		return faqVo;
	}

	// faq 입력
	@Override
	public void insertFaq(FaqVo faqVo) throws Exception {
		faqDao.insertFaq(faqVo);
	}

	// faq 수정
	@Override
	public void updateFaq(FaqVo faqVo) throws Exception {
		faqDao.updateFaq(faqVo);
	}

	// faq 삭제
	@Override
	public void deleteFaq(int fno) throws Exception {
		faqDao.deleteFaq(fno);
	}

}
