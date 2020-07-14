package com.kh.team.service;

import java.util.List;
import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;

public interface NoticeService {
	
	// 글목록
	//public List<NoticeVo> noticeList() throws Exception;
	
	// 글목록 - 페이징
	public List<NoticeVo> noticeList(NoticePagingDto noticePagingDto) throws Exception;
	
	// 게시글 수
	public int getCount(NoticePagingDto noticePagingDto) throws Exception;
	
	// 글내용보기
	public NoticeVo notice(int nno) throws Exception;
	
	// 글쓰기
	public void insertNotice(NoticeVo noticeVo) throws Exception;
	
	// 글수정
	public void updateNotice(NoticeVo noticeVo) throws Exception;
	
	// 삭제
	public void deleteNotice(int nno) throws Exception;

}
