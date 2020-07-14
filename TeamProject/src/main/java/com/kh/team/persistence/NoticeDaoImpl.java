package com.kh.team.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	private static final String NAMESPACE = "mappers.notice-mapper.";

	@Inject
	private SqlSession sqlSession;
 
	// 공지사항 내용보기
	@Override
	public NoticeVo notice(int nno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "notice", nno);
	}

	// 공지사항 입력
	@Override
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertNotice", noticeVo);
	}

	// 공지사항 수정
	@Override
	public void updateNotice(NoticeVo noticeVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateNotice", noticeVo);
	}

	// 공지사항 삭제
	@Override
	public void deleteNotice(int nno) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteNotice", nno);
	}
	
	// 공지사항 조회수 증가
	@Override
	public void updateViewCnt(int nno) throws Exception {
		sqlSession.update(NAMESPACE + "updateViewCnt", nno);
	}

	// 공지사항 목록 - 페이징
	@Override
	public List<NoticeVo> noticeList(NoticePagingDto noticePagingDto) throws Exception {
		List<NoticeVo> list = sqlSession.selectList(NAMESPACE + "noticeList", noticePagingDto);
		return list;
	}

	// 게시글 수
	@Override
	public int getCount(NoticePagingDto noticePagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", noticePagingDto);
	}

}
