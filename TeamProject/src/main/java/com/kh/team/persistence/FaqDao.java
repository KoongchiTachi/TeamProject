package com.kh.team.persistence;

import java.util.List;
import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqVo;

public interface FaqDao {
	
	// 글목록
	public List<FaqVo> faqList() throws Exception;
	
	// faq 목록 - 페이징
	public List<FaqVo> faqList(FaqPagingDto faqPagingDto) throws Exception;
	
	// 게시글 수
	public int getCount(FaqPagingDto faqPagingDto) throws Exception;
	
	// faq 내용보기
	public FaqVo faqRead(int fno) throws Exception;
	
	// faq 입력
	public void insertFaq(FaqVo faqVo) throws Exception;
	
	// faq 수정
	public void updateFaq(FaqVo faqVo) throws Exception;
	
	// faq 삭제
	public void deleteFaq(int fno) throws Exception;

}
