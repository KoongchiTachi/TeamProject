package com.kh.team.persistence;

import java.util.List;
import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.FaqPagingDto2;
import com.kh.team.domain.FaqVo;

public interface FaqDao {
	
	// faq 목록 (페이징) - 관리자
	public List<FaqVo> faqList(FaqPagingDto faqPagingDto) throws Exception;
	// 게시글 수 - 관리자
	public int getCount(FaqPagingDto faqPagingDto) throws Exception;
	
	// faq 목록 (페이징)
	public List<FaqVo> faqList(FaqPagingDto2 faqPagingDto2) throws Exception;
	// 게시글 수
	public int getCount2(FaqPagingDto2 faqPagingDto2) throws Exception;
	
	// faq f_cate = f1001 회원 관련 목록
	public List<FaqVo> faq1() throws Exception;
	// faq f_cate = f1002 경매 관련 목록
	public List<FaqVo> faq2() throws Exception;
	// faq f_cate = f1003 낙찰 관련 목록
	public List<FaqVo> faq3() throws Exception;
	// faq f_cate = f1004 위탁 관련 목록
	public List<FaqVo> faq4() throws Exception;
	// faq f_cate = f1005 기타 관련 목록
	public List<FaqVo> faq5() throws Exception;
	
	// faq 조회
	public FaqVo faqRead(int fno) throws Exception;
	
	// faq 입력 - 관리자
	public void faqInsert(FaqVo faqVo) throws Exception;
	
	// faq 수정 - 관리자
	public void faqUpdate(FaqVo faqVo) throws Exception;
	
	// faq 삭제 - 관리자
	public void faqDelete(int fno) throws Exception;
	
	// faq 삭제 (체크박스) - 관리자
	public void faqDeleteChk(FaqVo fnos) throws Exception;

}
