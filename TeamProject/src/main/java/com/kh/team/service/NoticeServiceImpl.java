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
	
	// 공지사항 목록 (페이징)
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

	// 공지사항 입력 - 관리자
	@Override
	public void noticeInsert(NoticeVo noticeVo) throws Exception {
		noticeDao.noticeInsert(noticeVo);
	}

	// 공지사항 수정 - 관리자
	@Override
	public void noticeUpdate(NoticeVo noticeVo) throws Exception {
		noticeDao.noticeUpdate(noticeVo);
	}

	// 공지사항 삭제 - 관리자
	@Override
	public void noticeDelete(int nno) throws Exception {
		noticeDao.noticeDelete(nno);
 	}

	// 공지사항 삭제 (체크박스) - 관리자
	@Override
	public void noticeDeleteChk(NoticeVo nnos) throws Exception {
		noticeDao.noticeDeleteChk(nnos);
	}

}
