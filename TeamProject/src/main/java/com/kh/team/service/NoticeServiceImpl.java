package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;
import com.kh.team.persistence.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDao noticeDao;
	
	// 공지사항 목록
	@Override
	public List<NoticeVo> noticeList(NoticePagingDto noticePagingDto) throws Exception {
		return noticeDao.noticeList(noticePagingDto);
	}

	// 게시글 수
	@Override
	public int getCount(NoticePagingDto noticePagingDto) throws Exception {
		return noticeDao.getCount(noticePagingDto);
	}

	// 공지사항 내용보기
	@Override
	public NoticeVo noticeRead(int nno) throws Exception {
		noticeDao.updateViewCnt(nno); // 공지사항 조회수
		NoticeVo noticeVo = noticeDao.noticeRead(nno);
		return noticeVo;
	}

	// 공지사항 입력
	@Override
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		noticeDao.insertNotice(noticeVo);
	}

	// 공지사항 수정
	@Override
	public void updateNotice(NoticeVo noticeVo) throws Exception {
		noticeDao.updateNotice(noticeVo);
	}

	// 공지사항 삭제
	@Override
	public void deleteNotice(int nno) throws Exception {
		noticeDao.deleteNotice(nno);
 	}

}
