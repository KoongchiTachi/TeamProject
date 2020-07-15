package com.kh.team.persistence;

import java.util.List;
import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;

public interface NoticeDao {
	
	// 공지사항 목록 - 페이징
	public List<NoticeVo> noticeList(NoticePagingDto noticePagingDto) throws Exception;
	
	// 게시글 수
	public int getCount(NoticePagingDto noticePagingDto) throws Exception;
	
	// 공지사항 내용보기
	public NoticeVo noticeRead(int nno) throws Exception;
	
	// 공지사항 입력
	public void insertNotice(NoticeVo noticeVo) throws Exception;
	
	// 공지사항 수정
	public void updateNotice(NoticeVo noticeVo) throws Exception;
	
	// 공지사항 삭제
	public void deleteNotice(int nno) throws Exception;
	
	// 조회수 증가
	public void updateViewCnt(int nno) throws Exception;  
	
}
