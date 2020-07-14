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

//	@Override
//	public List<NoticeVo> noticeList() throws Exception {
//		List<NoticeVo> list = noticeDao.noticeList();
//		return list;
//	}

	@Override
	public NoticeVo notice(int nno) throws Exception {
		noticeDao.updateViewCnt(nno); // 공지사항 조회수
		NoticeVo noticeVo = noticeDao.notice(nno);
		return noticeVo;
	}

	@Override
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		noticeDao.insertNotice(noticeVo);

	}

	@Override
	public void updateNotice(NoticeVo noticeVo) throws Exception {
		noticeDao.updateNotice(noticeVo);

	}

	@Override
	public void deleteNotice(int nno) throws Exception {
		noticeDao.deleteNotice(nno);

	}

	@Override
	public List<NoticeVo> noticeList(NoticePagingDto noticePagingDto) throws Exception {
		return noticeDao.noticeList(noticePagingDto);
	}

	@Override
	public int getCount(NoticePagingDto noticePagingDto) throws Exception {
		return noticeDao.getCount(noticePagingDto);
	}

}
