package com.kh.team.service;

import java.util.List;
import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;

public interface NoticeService {
	
	// 공지사항 목록 (페이징)
	public List<NoticeVo> noticeList(NoticePagingDto noticePagingDto) throws Exception;
	
	// 게시글 수
	public int getCount(NoticePagingDto noticePagingDto) throws Exception;
	
	// 공지사항 내용보기
	public NoticeVo noticeRead(int nno) throws Exception;
	
	// 공지사항 입력 - 관리자
	public void noticeInsert(NoticeVo noticeVo) throws Exception;
	
	// 공지사항 수정 - 관리자
	public void noticeUpdate(NoticeVo noticeVo) throws Exception;
	
	// 공지사항 삭제 - 관리자
	public void noticeDelete(int nno) throws Exception;
	
	// 공지사항 삭제 (체크박스) - 관리자
	public void noticeDeleteChk(NoticeVo nnos) throws Exception;

}
